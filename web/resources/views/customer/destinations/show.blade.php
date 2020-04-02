@extends('layouts.customer.index')

@section('content')
<!-- start banner Area -->
<section class="about-banner relative">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
                <h1 class="text-white">
                    {{ $show->title }}
                </h1>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->

<!-- Start insurence-one Area -->
<section class="insurence-one-area section-gap">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 insurence-left">
                <img class="img-fluid" src="http://travel-backend.local/images/destinations/{{ $show->cover }}" alt="">
            </div>
            <div class="col-lg-6 insurence-right">
                <h1>{{ $show->title }}</h1>
                <p>
                    {{ $show->description }}
                </p>
                <div class="list-wrap">
                    <ul>
                        <li>Price : {{ number_format($show->price) }} FJ$ </li>
                        <li>Available Tickets : {{ $show->stock }}</li>
                        <li>
                            @auth
                            <form method="POST" action="{{route('cart.add')}}" class="form-inline my-2 my-lg-0">
                                @csrf
                                <input name="id" type="hidden" value="{{$show->id}}">
                                <button class="btn btn-success btn-block" type="submit">Add to cart</button>
                            </form>
                            @endauth
                            @guest
                                <a type="button" href="{{ url('/') }}" class="btn btn-success btn-block">Book the destination</a>
                            @endguest
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End insurence-one Area -->
@endsection