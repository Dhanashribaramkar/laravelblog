@extends('layouts.app')
@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                 @if(count($posts) > 0)
                                @foreach($posts as $post)
                <div class="panel-heading"><h3><center><b>{{ $post->post_title }} View </b></center></h3></div>
                <div class="panel-body">
                    <div class="cold col-md-12">
                        <div class="col-md-3 center">
                        <ul class="list-group text-center">
                            <h4><b>Categories</b>
                            @if(count($categories) > 0)
                                @foreach($categories->all() as $category)
                                    <li class="list-group-item list-group-item-info"><a href='{{ url("category/{$category->id}") }}'> {{$category->category}}</a></li>
                                @endforeach
                            @else
                                <p>No categories found. Please add categories</p>
                            @endif </h4>
                        </ul>
                        </div> 
                        <div class="well col-md-9">                                        
                           
                                    <center><h4><strong>{{ $post->post_title }}</strong></h4>
                                    <img src="/storage/images/{{ $post->post_image }}" alt="File" height="300" width="400"></center>
                                    <p>{{ $post->post_body }}</p>
                                @endforeach
                            @else
                                <p>No post found!!!</p>
                            @endif

                     @if(!Auth::guest()) <!--if user is not logged in then they can't edit/delete posts -->
                        @if(Auth::user()->id == $post->user_id) <!-- User can not edit/delete posts of other users -->        
                            <!--Comment Add functionality -->
                            <h3>Comments<span class="badge">{{$comments->count()}}</span> <small>Add, List</small></h3>
                            <form method="POST" action="{{ url("/comment/{$post->id}") }}">
                                    {{csrf_field()}}
                                        <div class="form-group">
                                            <textarea id="comment" rows="5" class="form-control" name="comment" required autofocus></textarea>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-success">Post comment</button>
                                        </div>
                            </form>
                        @endif
                    @endif
                            @if(count($comments) > 0)
                                @foreach ($post->comments as $comment)
                                <div class="panel panel-body">
                                    <span class="pull-right">{{ $comment->created_at->format('Y-m-d') }}</span>
                                    {{ $comment->comment }}          
                                </div>
                                @endforeach
                            @else
                                <p>No comment found!!!</p>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
