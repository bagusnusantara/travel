@extends('layouts.customer.index')
@section('content')
<!-- start banner Area -->
<section class="relative about-banner" id="home">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
                <h1 class="text-white">
                    Checkout
                </h1>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->
<!-- Start Align Area -->
<div class="whole-wrap">
    <div class="container">
        <div class="section-top-border">
            <div class="row">
                <div class="col-lg-8 col-md-8">
                    <h3 class="mb-30">Customer Details</h3>
                    @if (Session::has('message'))
                    <p class="alert alert-success">{{ Session::get('message') }}</p>
                    @endif
                    <form action="#">
                        @if (\Cart::isEmpty())
                        <p class="alert alert-warning">Your shopping cart is empty.</p>
                        @else

                        @endif
                        <div class="mt-10">
                            <label>Customer Name</label>
                            <input type="text" name="first_name" value="{{ Auth::user()->name }}" onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" required class="single-input" readonly>
                        </div>
                        <div class="mt-10">
                            <label>Address</label>
                            <input type="text" name="first_name" value="{{ Auth::user()->address }}" onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" required class="single-input" readonly>
                        </div>
                        <div class="mt-10">
                            <label>Email</label>
                            <input type="text" name="first_name" value="{{ Auth::user()->email }}" onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" required class="single-input" readonly>
                        </div>
                        <div class="mt-10">
                            <label>Phone</label>
                            <input type="text" name="first_name" value="{{ Auth::user()->phone }}" onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" required class="single-input" readonly>
                        </div>
                        
                        
                    </form>
                </div>
                <div class="col-lg-3 col-md-4 mt-sm-30 element-wrap">
                    <div class="single-element-widget">

                        <h4 class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-muted">Your cart</span>
                            <span class="badge badge-secondary badge-pill">{{Cart::getContent()->count()}}</span>
                        </h4>
                        <ul class="list-group mb-3">
                            @foreach(Cart::getContent() as $product)
                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                <div>
                                    <h6 class="my-0">{{$product->name}}</h6>
                                    <small class="text-muted">{{$product->quantity . ' x $' . $product->price}}</small>
                                </div>
                                <span class="text-muted">{{'$' . $product->price * $product->quantity}}</span>
                            </li>
                            @endforeach
                            <li class="list-group-item d-flex justify-content-between">
                                <span>Total (FJ$)</span>
                                <strong>{{Cart::getSubTotal()}}</strong>
                            </li>
                        </ul>
                        <form action="{{route('cart.clear')}}" method="POST" class="card p-2">
                            @csrf
                            <div class="input-group">
                                <div class="input-group">
                                    <button type="submit" class="btn btn-danger">Clear Cart</button>
                                </div>
                            </div>
                        </form>
                        <form method="POST" action="" class="card p-2">
                            <div class="input-group">
                                <div class="input-group">
                                    <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Align Area -->

@endsection