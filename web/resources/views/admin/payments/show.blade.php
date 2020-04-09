@extends('layouts.admin.index')
@section('up')
<!-- Start datatable css -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.18/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.jqueryui.min.css">
@endsection

@section('content')
<div class="row">
    <div class="col-lg-12 mt-5">
        <div class="card">
            <div class="card-body">
                <div class="invoice-area">
                    <div class="invoice-head">
                        <div class="row">
                            <div class="iv-left col-6">
                                <span>INVOICE</span>
                            </div>
                            <div class="iv-right col-6 text-md-right">
                                <span>{{ $data->invoice_number }}</span>
                            </div>
                        </div>
                    </div>
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="invoice-address">
                                <h3>invoiced to</h3>
                                <h5>{{ $data->name }}</h5>
                                <p>{{ $data->email }}</p>
                                <p>{{ $data->phone }}</p>
                            </div>
                        </div>
                        <div class="col-md-6 text-md-right">
                            <ul class="invoice-date">
                                <li>Invoice Date : {{ $data->created_at }}</li>
                            </ul>
                        </div>
                    </div>
                    <div class="invoice-table table-responsive mt-5">
                        <table class="table table-bordered table-hover text-right">
                            <thead>
                                <tr class="text-capitalize">
                                    <th class="text-center" style="width: 5%;">id</th>
                                    <th class="text-left" style="width: 45%; min-width: 130px;">desctination</th>
                                    <th>qty</th>
                                    <th style="min-width: 100px">Unit Cost</th>
                                    <th>total</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                $i=1;
                                @endphp
                                @foreach($detail as $d)
                                <tr>
                                    <td class="text-center">{{ $i }}</td>
                                    <td class="text-left">{{ $d->title}}</td>
                                    <td>{{ $d->quantity}}</td>
                                    <td>{{ $d->price}} FJ$</td>
                                    <td>{{ $d->price*$d->quantity}} FJ$</td>
                                </tr>
                                @php
                                $i++;
                                @endphp
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="4">total bill :</td>
                                    <td>{{ number_format($data->total_bill) }} FJ$</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div class="invoice-buttons text-right">
                    <a href="javascript:window.print()" class="invoice-btn">Print Invoice</a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
@endsection
@section('down')
<!-- Start datatable js -->
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>

@endsection