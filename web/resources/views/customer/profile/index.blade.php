@extends('layouts.customer.index')

@section('content')
<!-- start banner Area -->
<section class="about-banner relative">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
                <h1 class="text-white">
                    My Profile
                </h1>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->

<!-- Start destinations Area -->
<section class="destinations-area section-gap">
    <div class="container">
        <div class="col-lg-12 sidebar-widgets">
            <div class="widget-wrap">
                <div class="single-sidebar-widget user-info-widget">
                    <img style="height:200px;" src="http://travel-backend.local/images/users/{{ $data->avatar }}" alt="">
                    <a href="#">
                        <h4>{{ $data->name }}</h4>
                    </a>
                    <p>
                        {{ $data->email }}
                    </p>
                </div>
                <div class="single-sidebar-widget popular-post-widget">
                    <h4 class="popular-title">My Profile</h4>
                    <div class="popular-post-list">
                        <div class="single-post-list  align-items-center">
                            <div class="details">
                                <form method="POST" action="{{ url('admin/users/update')}}" enctype="multipart/form-data">
                                    @csrf
                                    <div class="mt-10">
                                        <label for="example-text-input" class="col-form-label">Username</label>
                                        <input class="single-input" type="text" name="name" id="example-text-input" value="{{ $data->name }}">
                                        <input class="form-control" type="hidden" name="id" id="example-text-input" value="{{ $data->id }}">
                                    </div>
                                    <div class="form-group">
                                        <label for="example-text-input" class="col-form-label">Email</label>
                                        <input class="single-input" type="email" name="email" id="example-text-input" value="{{ $data->email }}">
                                    </div>
                                    <div class="form-group">
                                        <label for="example-text-input" class="col-form-label">Address</label>
                                        <input class="single-input" type="text" name="address" id="example-text-input" value="{{ $data->address }}">
                                    </div>
                                    <div class="form-group">
                                        <label for="example-text-input" class="col-form-label">Phone</label>
                                        <input class="single-input" type="number" name="phone" id="example-text-input" value="{{ $data->phone }}">
                                    </div>
                                    <div class="form-group">
                                        <label class="col-form-label">Roles</label>
                                        <select class="single-input" name="roles">
                                            @if($data->roles == 'CUSTOMER')
                                            <option value="CUSTOMER" selected>Customer</option>
                                            <option value="ADMIN">Admin</option>
                                            @else if($data->roles == 'ADMIN')
                                            <option value="CUSTOMER">Customer</option>
                                            <option value="ADMIN" selected>Admin</option>
                                            @endif
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-form-label">Avatar</label>

                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="inputGroupFile01" name="avatar">
                                            <label class="custom-file-label" for="inputGroupFile01">Change Picture</label>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <input type="submit" class="btn btn-success" value="Update My Profile"><br>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- End destinations Area -->


@endsection