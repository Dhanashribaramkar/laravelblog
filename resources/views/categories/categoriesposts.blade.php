@extends('layouts.app')
@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading"><h3><center><b>Posts By Category</b></center></h3></div>
                <div class="panel-body">
                    <div class="cold col-md-12">
                        <div class="col-md-3">
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
                        <div class="col-md-9">                                        
                            @if(count($posts) > 0)
                                @foreach($posts->all() as $post)
                                <div class="well">
                                    <center><h4><strong>{{ $post->post_title }}</strong></h4>
                                    <img src="/storage/images/{{ $post->post_image }}" alt="File" height="300" width="400"></center>
                                    <p>{{ $post->post_body }}</p>
                                    <p><site class="pull-right"><strong>Posted on: </strong>{{date('M j, Y H:i', strtotime($post->updated_at))}}</site></p>       
                                </div>
                                @endforeach
                            @else
                                <p>No post found!!!</p>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
