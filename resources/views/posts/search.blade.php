@extends('layouts.app')
<style type="text/css">.avatar{border-radius: 100%; max-width: 100px;}</style>
@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-8"><h3><b>Blog</b> <span class="badge">{{$posts->count()}}</span></h3></div>
                        <div class="col-md-4">
                            <form method="POST" action="{{ url("/search") }}">
                            {{ csrf_field() }}
                            <div class="input-group">
                                <input type="text" name="search" class="form-control" placeholder="Search for ...">
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-default">Go!</button>
                                </span>
                            </div>     
                            </form>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="cold col-md-12">
                        <div class="col-md-3">
                            <img src="{{ url('images/avatar.png')}}" class="avatar" alt="">
                            <h2>{{ Auth::user()->name }}</h2>
                            Email: {{ Auth::user()->email }}  
                        </div> 
                        <div class="col-md-9">                                        
                            @if(count($posts) > 0)
                                @foreach($posts->all() as $post)
                                <div class="well">
                                    <center><h4><strong>{{ $post->post_title }}</strong></h4>
                                    <img src="/storage/images/{{ $post->post_image }}" alt="File" height="300" width="400"></center>
                                    <p>{{ substr($post->post_body, 0, 150) }}</p>
                                    <div class="btn-toolbar inline">
                                        <!--View functionality -->
                                        <a href="/posts/{{$post->id}}" class="btn btn-info btn-xs">VIEW</a>
                                        @if(!Auth::guest()) <!--if user is not logged in then they can't edit/delete posts -->
                                            @if(Auth::user()->id == $post->user_id) <!-- User can not edit/delete posts of other users -->        
                                                <!-- Edit functionality -->
                                                <a href="{{'/posts/'.$post->id.'/edit'}}" class="btn btn-info btn-xs">EDIT</a>
                                                <!-- Delete functionality -->
                                                <form class="form-group" action="{{'/posts/'.$post->id}}" method="POST">
                                                    {{csrf_field()}}
                                                    {{ method_field('DELETE')}}
                                                    <span class="input-group-btn">
                                                        <button type="submit" value="Delete" class="btn btn-danger btn-xs">
                                                        DELETE</button>
                                                    </span>
                                                </form>  
                                            @endif
                                        @endif
                                           
                                    </div> <!-- End of class="btn-toolbar inline"-->
                                    <site>Posted on: {{date('M j, Y H:i', strtotime($post->updated_at))}}</site> 
                                </div> <!-- End of class="well"-->     
                                @endforeach
                            @else
                                <p>No post found!!! Please add post:<a href="{{ url('/posts')}}" class="btn btn-info btn-lg">Add Post</a></p>
                            @endif                       
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
@endsection
