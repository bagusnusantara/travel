@extends('layouts.customer.index')

@section('content')
<!-- start banner Area -->
<section class="about-banner relative">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
                <h1 class="text-white">
                    My Tickets
                </h1>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->

<!-- Start destinations Area -->
<section class="destinations-area section-gap">
    <div class="container">
        <div class="row">
            @php
            $i=0;
            @endphp
            @foreach($orders as $d)
            <div class="col-lg-9">
                <div class="single-destinations">
                <a href="my-tickets/show/{{$d->invoice_number}}">
                    <div class="details">
                        <h4 class="d-flex justify-content-between">
                        <span><img src="{{ asset('template/img/ticket.png') }}" alt="Smiley face"></span>
                            <div>
                            <h4>INVOICE NUMBER :</h4> <a class="price-btn">{{$d->invoice_number}}</a>
                            </div>
                        </h4>
                    </div>
                </div>
                </a>
            </div>
            @php
            $i++;
            @endphp
            @endforeach
        </div>
        <div class="pull-left mt-5">
            <ul>
                {{ $orders->links() }}
            </ul>
        </div>
    </div>
</section>
<!-- End destinations Area -->


@endsection