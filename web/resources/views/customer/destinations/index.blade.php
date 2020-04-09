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
                    <h1 class="mb-10">Popular Destinations</h1>
                    <p>We all live in an age that belongs to the young at heart. Life that is becoming extremely fast, day to.</p>
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
                <a href="destinations/slug/{{ $destinations['data'][$i]['slug'] }}">
                    <div class="thumb">
                        <img style="height:200px;" src="http://travel-backend.local/images/destinations/{{ $destinations['data'][$i]['cover'] }}" alt="">
                    </div>
                    <div class="details">
                        <h4 class="d-flex justify-content-between">
                            <span>{{ $destinations['data'][$i]['title'] }}</span>
                            <div class="star">
                            <a href="#" class="price-btn">{{ number_format($destinations['data'][$i]['price']) }} FJ$</a>
                            </div>
                        </h4>
                        <ul class="package-list">
                            <li class="d-flex justify-content-between align-items-center">
                                <span>{{ str_limit($destinations['data'][$i]['description'],100)  }}</span>
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
    </div>
</section>
<!-- End destinations Area -->


@endsection