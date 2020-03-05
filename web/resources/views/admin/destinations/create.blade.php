@extends('layouts.admin.index')
@section('up')

@endsection

@section('content')
<div class="row">
    <!-- Textual inputs start -->
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <div class="form-group">
                    <label for="example-text-input" class="col-form-label">Name</label>
                    <input class="form-control" type="text" value="Carlos Rath" id="example-text-input">
                </div>
                <div class="form-group">
                    <label for="example-search-input" class="col-form-label">Description</label>
                    <textarea class="form-control" aria-label="With textarea"></textarea>
                    <!-- <input class="form-control" type="search" value="Where is google office" id="example-search-input"> -->
                </div>
                <div class="form-group">
                    <label class="col-form-label">Status</label>
                    <select class="form-control">
                        <option value="1">Active</option>
                        <option value="0">Inactive</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="col-form-label">Photos</label>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="inputGroupFile01">
                        <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                    </div>
                </div>
                <div class="text-center">
                    <button type="button" class="btn btn-primary btn-sm mb-3"><span class="ti-save"></span> Save Destination</button><br>
                    <a href="{{ url('admin/destinations/') }}" type="button" class="btn btn-light btn-xs mb-3"><span class="ti-back-left"></span> Back</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Textual inputs end -->
</div>
@endsection
@section('down')

@endsection