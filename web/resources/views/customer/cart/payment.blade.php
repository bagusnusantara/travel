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
                    <h3 class="mb-30">Payment Information</h3>
                    <form action="#">
                        <div class="mt-10">
                            <label>Order ID</label>
                            <input type="text" name="first_name" value="{{ $params->id }}" onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" required class="single-input" readonly>
                        </div>
                        <div class="mt-10">
                            <label>Invoice Number</label>
                            <input type="text" name="first_name" value="{{ $params->invoice_number }}" onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" required class="single-input" readonly>
                        </div>
                        <div class="mt-10">
                            <label>Total Bill (FJ$)</label>
                            <input type="text" name="first_name" value="{{ number_format($params->total_bill) }} " onfocus="this.placeholder = ''" onblur="this.placeholder = 'First Name'" required class="single-input" readonly>
                        </div>  
                    </form>
                </div>
            </div>
            <br><br>
            <div class="row">
                <div class="col-lg-12 col-md-8">
                    <h3 class="mb-30">Transfer to :</h3>
                    <form action="#">
                        <div class="mt-10">
                            <img src="http://localhost:8080/img/bsp.png" width="200">
                            <p><b>Bank of the South Pacific</b> : 312433151512414 - Fiji Travel Domestic</p>
                        </div>
                        <div class="mt-10">
                            <img src="http://localhost:8080/img/anz.png" width="200">
                            <p><b>ANZ Bank</b> : 9090903151512414 - Fiji Travel Domestic</p>
                        </div>
                        <div class="mt-10">
                            <img src="http://localhost:8080/img/westpac.jpg" width="200">
                            <p><b>Westpac Bank</b> : 7878913151512414 - Fiji Travel Domestic</p>
                        </div>
                         
                    </form>
                    <a href="{{url('contact')}}"type="button" class="btn btn-success btn-block">Finish</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Align Area -->

@endsection