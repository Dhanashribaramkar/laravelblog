<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\URL;
use App\Category;
use App\User;
use App\Post;
use App\Comment;
use Auth;
use DB;

class PostsController extends Controller
{
    public function __construct()
    {   
        $this->middleware('auth');  //accessing all the functions
        //$this->middleware('auth',['except' => ['index', 'show']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::all(); // Do not forgot to add 'use App\Category;' above
        return view('posts.index', [ 'categories' => $categories ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,
            [
                'post_title' => 'required',
                'post_body' => 'required',
                'category_id' => 'required',
                'post_image' => 'nullable|max:1999',
            ]
        );
        //Handle file upload
        if($request->hasFile('post_image'))
        {
            // Get filename with the extension
            $filenameWithExt = $request->file('post_image')->getClientOriginalName();
            // Get just filename
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            // Get just ext
            $extension = $request->file('post_image')->getClientOriginalExtension();
            // Filename to store
            $fileNameToStore = $filename.'_'.time().'.'.$extension;
            // Upload image
            $path = $request->file('post_image')->storeAs('public/images', $fileNameToStore);
        } else
        {
            $fileNameToStore = 'noimage.jpg';
        }

        // Create post
        $posts = new Post();
        $posts->category_id = $request->input('category_id');
        $posts->user_id = Auth::user()->id; //Add above 'use Auth'
        $posts->post_title = $request->input('post_title');
        $posts->post_body = $request->input('post_body');
        $posts->post_image = $fileNameToStore;
        $posts->save();
        return redirect('/home')->with('success', 'New Post Has Been Added Successfully!!!!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $posts = Post::where('id', '=', $id)->get();
        $categories = Category::all();
        //Listing comments:
        $comments = DB::table('users')
            ->join('comments', 'users.id', '=', 'comments.user_id')
            ->join('posts', 'comments.post_id', '=', 'posts.id')
            ->select('users.name', 'comments.*')
            ->where(['posts.id' => $id])
            ->get();
        return view('posts.show')->with('posts', $posts)->with('categories', $categories)->with('comments', $comments);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $categories = Category::all();
        $posts = Post::find($id);
        $category = Category::find($posts->category_id);
        // Check for correct user
        if(auth()->user()->id !== $posts->user_id){
          return redirect('/home')->with('error', 'Unauthorized page');
        }
        return view('posts.edit')->with('posts', $posts)->with('categories', $categories)->with('category', $category);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request,
            [
                'post_title' => 'required',
                'post_body' => 'required',
                'category_id' => 'required',
                'post_image' => 'nullable|max:1999',
            ]
        );
        //Handle file upload
        if($request->hasFile('post_image'))
        {
            // Get filename with the extension
            $filenameWithExt = $request->file('post_image')->getClientOriginalName();
            // Get just filename
            $filename = pathinfo($filenameWithExt, PATHINFO_FILENAME);
            // Get just ext
            $extension = $request->file('post_image')->getClientOriginalExtension();
            // Filename to store
            $fileNameToStore = $filename.'_'.time().'.'.$extension;
            // Upload image
            $path = $request->file('post_image')->storeAs('public/images', $fileNameToStore);
        } else
        {
            $fileNameToStore = 'noimage.jpg';
        }

        // Create post
        $posts = Post::find($id);
        $posts->category_id = $request->input('category_id');
        $posts->user_id = Auth::user()->id; //Add above 'use Auth'
        $posts->post_title = $request->input('post_title');
        $posts->post_body = $request->input('post_body');
         if($request->hasFile('post_image'))
        {
            // Delete the old image if it's changed .
            if ($posts->post_image != 'no_image.png') 
            {
                Storage::delete('public/images/'.$posts->post_image);
            }
            $posts->post_image = $fileNameToStore;
        }
        $posts->save();
        return redirect('/home')->with('success', 'Post Has Been Updated Successfully!!!!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $posts = Post::find($id);
        // Check for correct user
        if(auth()->user()->id !== $posts->user_id){
          return redirect('/home')->with('error', 'Unauthorized page');
        }
        //Delete image from post
        if($posts->post_image != 'noimage.jpg')
        {
            Storage::delete('public/images/'.$posts->post_image);
        }
        $posts->comments()->delete();
        $posts->delete();
        return redirect('/home')->with('success', 'Post Deleted Successfully !!!!');
    }

    public function category($cat_id)
    {
        $categories = Category::all();

        //Joining two tables posts and categories
        $posts = DB::table('posts')
            ->join('categories', 'posts.category_id', '=', 'categories.id')
            ->select('posts.*', 'categories.*')
            ->where(['categories.id' => $cat_id])
            ->get();
        return view('categories.categoriesposts')->with('categories', $categories)->with('posts', $posts);
    }

    // COMMENTS
    public function comment(Request $request, $post_id)
    {
        $this->validate($request, [
            'comment' => 'required'
        ]);
        //Adding comments
        $comment = new Comment; //Do not forgot to add use App\Comment above
        $comment->user_id = auth()->user()->id; //fetch the user_id
        $comment->post_id = $post_id; //fetch the post_id
        $comment->comment = $request->input('comment');
        $comment->save();
        return redirect("/posts/$post_id")->with('success', 'Comment Added Successfully!!');
    }  

    //SEARCH
    public function search(Request $request)
    {
        $user_id = Auth::user()->id; //use Auth;    
        $user = User::find($user_id);
        $keyword = $request->input('search');
        $posts = Post::where('post_title', 'LIKE', '%'.$keyword.'%')->get();
        //return $posts;
        //exit();
        return view('posts.search')->with('user', $user )->with('posts', $posts);
    } 
}
