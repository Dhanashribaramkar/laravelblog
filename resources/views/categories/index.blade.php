@if(Auth::id() == 6)
@extends('layouts.app')
@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading"><h2>Category <small>Add, View, Delete</small></h2></div>
                <div class="panel-body">
                <div class="well">
                     <!-- CategoriesController@store -->
                    <form class="form-horizontal" method="POST" action="/categories">
                        {{ csrf_field() }}
                        <div class="form-group{{ $errors->has('category') ? ' has-error' : '' }}">
                            <label for="category" class="col-md-4 control-label">Enter Category</label>

                            <div class="col-md-6">
                                <input id="category" type="category" class="form-control" name="category" value="{{ old('category') }}" required autofocus>
                                @if ($errors->has('category'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('category') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-8 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Add Category
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="">
                    <h4><strong>Categories</strong><button type="button" class="btn btn-primary btn-xs"><span class="badge">{{$categories->total()}}</span></button></h4>
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <th>Category</th>             
                            <th>Action</th>
                        </thead>                   
                        @if(count($categories) > 0)
                            @foreach($categories as $category)               
                        <tbody>
                            <td>{{$category->category}}</td>
                            <td >        
                                 <!-- Delete functionality -->
                                <form class="form-group" action="{{'/categories/'.$category->id}}" method="POST">
                                {{csrf_field()}}
                                {{ method_field('DELETE')}}
                                    <button type="submit" value="Delete" class="btn btn-danger btn-xs">Delete</button>     
                                </form> 
                             </td>
                        </tbody>
                        @endforeach
                        @else
                            <p>No categories found. Please add categories</p>
                        @endif                                                        
                    </table>
                    {!! $categories->links() !!} <!-- Pagination links --> 
                </div>
              </div>
            </div>
        </div>
    </div>

@endsection
@endif