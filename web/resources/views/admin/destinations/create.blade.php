@extends('layouts.admin.index')
@section('up')

@endsection

@section('content')
<div class="row">
    <!-- Textual inputs start -->
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <form method="POST" action="{{ url('admin/destinations/store')}}" enctype="multipart/form-data">
                @csrf
                <div class="form-group">
                    <label for="example-text-input" class="col-form-label">Title</label>
                    <input class="form-control" type="text" name="title" id="example-text-input">
                </div>
                <div class="form-group">
                    <label for="example-search-input" class="col-form-label">Description</label>
                    <textarea class="form-control" name="description" aria-label="With textarea"></textarea>
                </div>
                <div class="form-group">
                    <label class="col-form-label">Status</label>
                    <select class="form-control" name="status">
                        <option value="ACTIVE">Active</option>
                        <option value="INACTIVE">Inactive</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="example-search-input" class="col-form-label">Price</label>
                    <textarea class="form-control" name="price" aria-label="With textarea"></textarea>
                </div>
                <div class="form-group">
                    <label class="col-form-label">Photos</label>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="cover" name="cover">
                        <label class="custom-file-label" for="cover">Choose file</label>
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