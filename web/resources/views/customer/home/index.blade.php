@extends('layouts.customer.index')

@section('content')

<!-- start banner Area -->
<section class="banner-area relative">
    <div class="overlay overlay-bg"></div>
    <div class="container">
        <div class="row fullscreen align-items-center justify-content-between">
            <div class="col-lg-6 col-md-6 banner-left">
                <h6 class="text-white">Away from monotonous life</h6>
                <h1 class="text-white">Fiji Travel Domestic</h1>
                <p class="text-white">
                    If you are looking at blank cassettes on the web, you may be very confused at the difference in price. You may see some for as low as $.17 each.
                </p>
                <a href="#" class="primary-btn text-uppercase">Get Started</a>
            </div>
            <div class="col-lg-4 col-md-6 banner-right">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link" id="flight-tab" data-toggle="tab" href="#flight" role="tab" aria-controls="flight" aria-selected="false">Search Destinations</a>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">

                    <div class="tab-pane fade show active" id="flight" role="tabpanel" aria-labelledby="flight-tab">
                        <form action="destinations/search" method="GET" class="form-wrap">
                            <input type="text" class="form-control" name="keyword" placeholder="Where will you go? " onfocus="this.placeholder = ''" onblur="this.placeholder = 'Where will you go? '">
                            <input type="submit" class="primary-btn text-uppercase" value="Search">
                            
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- End banner Area -->
<!-- Start blog Area -->
<section class="recent-blog-area section-gap">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-9">
                <div class="title text-center">
                    <h1 class="mb-10">Popular Destination</h1>
                    <p>This is the most popular destinations in Fiji.</p>
                </div>
            </div>
        </div>
        <div class="row">

            <div class="active-recent-blog-carusel">
                @php
                $i=0;
                @endphp
                @foreach($destinations as $destination)

                <div class="single-recent-blog-post item">
                    <div class="thumb">
                        <img style="height:200px;" class="img-fluid" src="http://travel-backend.local/images/destinations/{{ $destinations['data'][$i]['cover'] }}" alt="">
                    </div>
                    <div class="details">
                        <div class="tags">
                            <ul>
                                <li>
                                    <a>{{ number_format($destinations['data'][$i]['price']) }} FJ$</a>
                                </li>
                            </ul>
                        </div>
                        <a href="destinations/slug/{{ $destinations['data'][$i]['slug'] }}">
                            <h4 class="title">{{ $destinations['data'][$i]['title'] }}</h4>
                        </a>
                        <p>
                            {{ $destinations['data'][$i]['description'] }}
                        </p>
                    </div>
                </div>
                @php
                $i++;
                @endphp
                @endforeach


            </div>
        </div>
    </div>
</section>
<!-- End recent-blog Area -->

<!-- Start price Area -->
<section class="price-area section-gap">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-70 col-lg-8">
                <div class="title text-center">
                    <h1 class="mb-10">We Provide Affordable Prices</h1>
                    <p>Well educated, intellectual people, especially scientists at all times demonstrate considerably.</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <div class="single-price">
                    <h4>Cheap Packages</h4>
                    <ul class="price-list">
                        <li class="d-flex justify-content-between align-items-center">
                            <span>New York</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Maldives</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Sri Lanka</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Nepal</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Thiland</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Singapore</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="single-price">
                    <h4>Luxury Packages</h4>
                    <ul class="price-list">
                        <li class="d-flex justify-content-between align-items-center">
                            <span>New York</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Maldives</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Sri Lanka</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Nepal</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Thiland</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Singapore</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="single-price">
                    <h4>Camping Packages</h4>
                    <ul class="price-list">
                        <li class="d-flex justify-content-between align-items-center">
                            <span>New York</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Maldives</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Sri Lanka</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Nepal</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Thiland</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                        <li class="d-flex justify-content-between align-items-center">
                            <span>Singapore</span>
                            <a href="#" class="price-btn">$1500</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End price Area -->


<!-- Start testimonial Area -->
<section class="testimonial-area section-gap">
    <div class="container">
        <div class="row d-flex justify-content-center">
            <div class="menu-content pb-70 col-lg-8">
                <div class="title text-center">
                    <h1 class="mb-10">Testimonial from our Clients</h1>
                    <p>The French Revolution constituted for the conscience of the dominant aristocratic class a fall from </p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="active-testimonial">
                <div class="single-testimonial item d-flex flex-row">
                    <div class="thumb">
                        <img class="img-fluid" src="{{ asset('template/img/elements/user1.png') }}" alt="">
                    </div>
                    <div class="desc">
                        <p>
                            Do you want to be even more successful? Learn to love learning and growth. The more effort you put into improving your skills, the bigger the payoff you.
                        </p>
                        <h4>Harriet Maxwell</h4>
                        <div class="star">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                        </div>
                    </div>
                </div>
                <div class="single-testimonial item d-flex flex-row">
                    <div class="thumb">
                        <img class="img-fluid" src="{{ asset('template/img/elements/user2.png') }}" alt="">
                    </div>
                    <div class="desc">
                        <p>
                            A purpose is the eternal condition for success. Every former smoker can tell you just how hard it is to stop smoking cigarettes. However.
                        </p>
                        <h4>Carolyn Craig</h4>
                        <div class="star">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                        </div>
                    </div>
                </div>
                <div class="single-testimonial item d-flex flex-row">
                    <div class="thumb">
                        <img class="img-fluid" src="{{ asset('template/img/elements/user1.png') }}" alt="">
                    </div>
                    <div class="desc">
                        <p>
                            Do you want to be even more successful? Learn to love learning and growth. The more effort you put into improving your skills, the bigger the payoff you.
                        </p>
                        <h4>Harriet Maxwell</h4>
                        <div class="star">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                        </div>
                    </div>
                </div>
                <div class="single-testimonial item d-flex flex-row">
                    <div class="thumb">
                        <img class="img-fluid" src="{{ asset('template/img/elements/user2.png') }}" alt="">
                    </div>
                    <div class="desc">
                        <p>
                            A purpose is the eternal condition for success. Every former smoker can tell you just how hard it is to stop smoking cigarettes. However.
                        </p>
                        <h4>Carolyn Craig</h4>
                        <div class="star">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                        </div>
                    </div>
                </div>
                <div class="single-testimonial item d-flex flex-row">
                    <div class="thumb">
                        <img class="img-fluid" src="{{ asset('template/img/elements/user1.png') }}" alt="">
                    </div>
                    <div class="desc">
                        <p>
                            Do you want to be even more successful? Learn to love learning and growth. The more effort you put into improving your skills, the bigger the payoff you.
                        </p>
                        <h4>Harriet Maxwell</h4>
                        <div class="star">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                        </div>
                    </div>
                </div>
                <div class="single-testimonial item d-flex flex-row">
                    <div class="thumb">
                        <img class="img-fluid" src="{{ asset('template/img/elements/user2.png') }}" alt="">
                    </div>
                    <div class="desc">
                        <p>
                            A purpose is the eternal condition for success. Every former smoker can tell you just how hard it is to stop smoking cigarettes. However.
                        </p>
                        <h4>Carolyn Craig</h4>
                        <div class="star">
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star checked"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End testimonial Area -->



@endsection