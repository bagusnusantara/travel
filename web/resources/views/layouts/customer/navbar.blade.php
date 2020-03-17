<header id="header">

    <div class="container main-menu">
        <div class="row align-items-center justify-content-between d-flex">
            <div id="logo">
                <a href="index.html"><img src="{{ asset('template/img/logo.png') }}" alt="" title="" /></a>
            </div>
            <nav id="nav-menu-container">
                <ul class="nav-menu">
                    <li><a href="{{ url('customer/home') }}">Home</a></li>
                    <li><a href="{{ url('customer/destinations') }}">Destinations</a></li>
                    <li><a href="{{ url('customer/about') }}">About</a></li>
                    <li><a href="{{ url('customer/contact') }}">Contact</a></li>
                    @auth
                    <li class="menu-has-children"><a href="#">{{ Auth::user()->name }}</a>
                        <ul>
                            <li><a href="{{ url('/my-profile') }}">My Profile</a></li>
                            <li><a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                                    {{ __('Logout') }}
                                </a>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    @csrf
                                </form>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="btn btn-success btn-sm ml-3" href="{{route('cart.checkout')}}">
                            <i class="fa fa-shopping-cart"></i> {{Cart::getTotalQuantity()}}
                        </a>
                    </li>
                    @endauth

                </ul>
            </nav><!-- #nav-menu-container -->
        </div>
    </div>
</header><!-- #header -->