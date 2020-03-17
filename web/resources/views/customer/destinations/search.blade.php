@extends('layouts.customer.index')

@section('content')
<!-- start banner Area -->
<section class="about-banner relative">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
                <h1 class="text-white">
                    Destinations List
                </h1>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->

<!-- Start destinations Area -->
<section class="destinations-area section-gap">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-40 col-lg-8">
                <div class="title text-center">
                    <h1 class="mb-10">Search Result...</h1>
                    @if($destinations->isEmpty())
                    <h3 class="text-danger">Sorry, we can not find your destination.</h3>
                    @else
                </div>
            </div>
        </div>
        <div class="row">
            @php
            $i=0;
            @endphp
            @foreach($destinations as $destination)
            <div class="col-lg-4">
                <div class="single-destinations">
                <a href="slug/{{ $destination->slug }}">
                    <div class="thumb">
                        <img style="height:200px;" src="http://travel-backend.local/images/destinations/{{ $destination->cover }}" alt="">
                    </div>
                    <div class="details">
                        <h4 class="d-flex justify-content-between">
                            <span>{{ $destination['title'] }}</span>
                            <div class="star">
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star"></span>
                            </div>
                        </h4>
                        <ul class="package-list">
                            <li class="d-flex justify-content-between align-items-center">
                                <span>{{ str_limit($destination['description'],100)  }}</span>
                            </li>
                            
                            <li class="d-flex justify-content-between align-items-center">
                                <span>Price</span>
                                <a href="#" class="price-btn">{{ number_format($destination['price']) }} FJ$</a>
                            </li>
                        </ul>
                    </div>
                </div>
</a>
            </div>
            @php
            $i++;
            @endphp
            @endforeach
        </div>
        @endif
    </div>
</section>
<!-- End destinations Area -->


@endsection