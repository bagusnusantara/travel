@extends('layouts.admin.index')
@section('up')

@endsection

@section('content')
<div class="row">
    <!-- Textual inputs start -->
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">

                <form method="POST" action="{{ url('admin/destinations/update')}}" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Title</label>
                        <input class="form-control" type="text" name="title" id="example-text-input" value="{{ $data->title }}">
                        <input class="form-control" type="hidden" name="slug" id="example-text-input" value="{{ $data->slug }}">
                    </div>
                    <div class="form-group">
                        <label for="example-search-input" class="col-form-label">Description</label>
                        <textarea class="form-control" name="description" aria-label="With textarea">{{ $data->description }}</textarea>
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Status</label>
                        <select class="form-control" name="status">
                            @if($data->status == 'ACTIVE')
                            <option value="ACTIVE" selected>Active</option>
                            <option value="INACTIVE">Inactive</option>
                            @else if($data->status == 'INACTIVE')
                            <option value="ACTIVE">Active</option>
                            <option value="INACTIVE" selected>Inactive</option>
                            @endif
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Price</label>
                        <input class="form-control" type="number" name="price" id="example-text-input" value="{{ $data->price }}">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Photos</label>

                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="inputGroupFile01" name="cover">
                            <label class="custom-file-label" for="inputGroupFile01">Change Picture</label>
                        </div>
                        <div class="col-lg-6 text-center">
                            <br><img class="img-fluid" src="http://travel-backend.local/images/destinations/{{ $data->cover }}" alt="">
                        </div>
                    </div>
                    <div class="text-center">
                        <input type="submit" class="btn btn-primary btn-sm mb-3" value="Save Destination"><br>
                        <a href="{{ url('admin/destinations/') }}" type="button" class="btn btn-light btn-xs mb-3"><span class="ti-back-left"></span> Back</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Textual inputs end -->
</div>
@endsection
@section('down')

@endsection