@extends('layouts.admin.index')

@section('content')
<!-- sales report area start -->
<div class="sales-report-area mt-5 mb-5">
    <div class="row">
        <div class="col-md-4">
            <div class="single-report mb-xs-30">
                <div class="s-report-inner pr--20 pt--30 mb-3">
                    <div class="icon"><i class="fa fa-users"></i></div>
                    <div class="s-report-title d-flex justify-content-between">
                        <h4 class="header-title mb-0">Total Users</h4>
                    </div>
                    <div class="d-flex justify-content-between pb-2">
                        <h1>{{ $total_users }}</h1>
                    </div>
                </div>
                <canvas id="coin_sales1" height="35"></canvas>
            </div>
        </div>
        <div class="col-md-4">
            <div class="single-report mb-xs-30">
                <div class="s-report-inner pr--20 pt--30 mb-3">
                    <div class="icon"><i class="fa fa-map-marker"></i></div>
                    <div class="s-report-title d-flex justify-content-between">
                        <h4 class="header-title mb-0">Total Destinations</h4>
                    </div>
                    <div class="d-flex justify-content-between pb-2">
                        <h1>{{ $total_destinations }}</h1>
                    </div>
                </div>
                <canvas id="coin_sales2" height="35"></canvas>
            </div>
        </div>
        <div class="col-md-4">
            <div class="single-report">
                <div class="s-report-inner pr--20 pt--30 mb-3">
                    <div class="icon"><i class="fa fa-money"></i></div>
                    <div class="s-report-title d-flex justify-content-between">
                        <h4 class="header-title mb-0">Total Orders</h4>
                    </div>
                    <div class="d-flex justify-content-between pb-2">
                        <h1>{{ $total_orders }}</h1>
                    </div>
                </div>
                <canvas id="coin_sales3" height="35"></canvas>
            </div>
        </div>
    </div>
</div>
<!-- sales report area end -->
@endsection