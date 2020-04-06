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
<!-- visitor graph area start -->
<div class="card mt-5">
    <div class="card-body">
        <div class="d-flex justify-content-between mb-5">
            <h4 class="header-title mb-0">Orders Report</h4>
            <select class="custome-select border-0 pr-3">
                <option selected="">2020</option>
                <option value="0">Last Month</option>
            </select>
        </div>
        <div id="visitor_graph"></div>
    </div>
</div>
<!-- visitor graph area end -->

<!-- order list area start -->
<div class="card mt-5">
    <div class="card-body">
        <h4 class="header-title">Latest Orders</h4>
        <div class="table-responsive">
            <table class="dbkit-table">
                <tbody>
                    <tr class="heading-td">
                        <td>Invoice Number</td>
                        <td>Username </td>
                        <td>Email </td>
                        <td>Phone </td>
                        <td>Total Bill</td>
                        <td>Date</td>
                    </tr>
                    @foreach($latest_orders as $latest)
                    <tr>
                        <td>{{$latest->invoice_number}}</td>
                        <td>{{$latest->name}}</td>
                        <td>{{$latest->email}}</td>
                        <td>{{$latest->phone}}</td>
                        <td>{{number_format($latest->total_bill)}} FJ$</td>
                        <td>{{$latest->created_at}}</td>
                    </tr>
                    @endforeach
                    
                </tbody>
            </table>
        </div>
        <div class="pull-right mt-5">
            <ul>
                {{ $latest_orders->links() }}
            </ul>
        </div>
    </div>
</div>
<!-- order list area end -->
@endsection
@section('down')

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<!-- start highcharts js -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<!-- start zingchart js -->
<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
<script>
    zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
</script>
<!-- all line chart activation -->
<script>
    /*--------------  visitor graph line chart start ------------*/
    if ($('#visitor_graph').length) {

        Highcharts.chart('visitor_graph', {
            chart: {
                type: 'areaspline'
            },
            title: false,
            yAxis: {
                title: false,
                gridLineColor: '#fbf7f7',
                gridLineWidth: 1
            },
            xAxis: {
                gridLineColor: '#fbf7f7',
                gridLineWidth: 1,
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
            },
            series: [{
                name: 'Income (FJ$)',
                data: [@foreach($orders as $order) 
                {{ $order-> total}}, @endforeach],
                fillColor: 'rgba(76, 57, 249, 0.5)',
                lineColor: 'transparent'
            }]
        });
    }
    /*--------------  END visitor graph line chart start ------------*/
</script>
@endsection