@extends('layouts.admin.index')
@section('up')

@endsection

@section('content')
<div class="row">
    <!-- Textual inputs start -->
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">

                <form method="POST" action="{{ url('admin/users/update')}}" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Username</label>
                        <input class="form-control" type="text" name="name" id="example-text-input" value="{{ $data->name }}">
                        <input class="form-control" type="hidden" name="id" id="example-text-input" value="{{ $data->id }}">
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Email</label>
                        <input class="form-control" type="email" name="email" id="example-text-input" value="{{ $data->email }}">
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Address</label>
                        <input class="form-control" type="text" name="address" id="example-text-input" value="{{ $data->address }}">
                    </div>
                    <div class="form-group">
                        <label for="example-text-input" class="col-form-label">Phone</label>
                        <input class="form-control" type="text" name="phone" id="example-text-input" value="{{ $data->phone }}">
                    </div>
                    <div class="form-group">
                        <label class="col-form-label">Roles</label>
                        <select class="form-control" name="roles">
                            @if($data->roles == 'CUSTOMER')
                            <option value="CUSTOMER" selected>Customer</option>
                            <option value="ADMIN">Admin</option>
                            @else if($data->roles == 'ADMIN')
                            <option value="CUSTOMER">Customer</option>
                            <option value="ADMIN" selected>Admin</option>
                            @endif
                        </select>
                    </div>
                    <!-- <div class="form-group">
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
                    </div> -->
                   
                    <div class="form-group">
                        <label class="col-form-label">Avatar</label>

                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="inputGroupFile01" name="cover">
                            <label class="custom-file-label" for="inputGroupFile01">Change Picture</label>
                        </div>
                        <div class="col-lg-6 text-center">
                            <br><img class="img-fluid" src="http://travel-backend.local/images/users/{{ $data->avatar }}" alt="">
                        </div>
                    </div>
                    <div class="text-center">
                        <input type="submit" class="btn btn-primary btn-sm mb-3" value="Save Destination"><br>
                        <a href="{{ url('admin/users/') }}" type="button" class="btn btn-light btn-xs mb-3"><span class="ti-back-left"></span> Back</a>
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