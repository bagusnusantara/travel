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
    <!-- data table start -->
    <div class="col-12 mt-5">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title">Users List</h4>
                <div class="data-tables">
                    <table id="users-table">
                        <thead class="bg-light text-capitalize">
                            <tr>
                                <th>ID</th>
                                <th>Avatar</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Roles</th>
                                <th>Address</th>
                                <th>Phone</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
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
<script>
    $(function() {
        $('#users-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: '{{ url('/admin/users/get') }}',
            columns: [{
                    data: 'id',
                    name: 'id'
                },
                {
                    data: 'avatar',
                    name: 'avatar',
                    render: function( data, type, full, meta ) {
                    return "<img style=\"border-radius: 50%;width:50px;height:50px;\" src=\"http://travel-backend.local/images/users/" + data + "\" height=\"15\"  alt='No Image'/>";
                },
            },
                {
                    data: 'name',
                    name: 'name'
                },
                {
                    data: 'email',
                    name: 'email'
                },
                {
                    data: 'roles',
                    name: 'roles'
                },
                {
                    data: 'address',
                    name: 'address'
                },
                {
                    data: 'phone',
                    name: 'phone'
                },
                

                {
                    data: 'status',
                    name: 'status'
                },
                {
                    data: 'action', 
                    name: 'action', 
                    orderable: false,
                    searchable: false
                },
            ]
        });
    });
</script>
@endsection