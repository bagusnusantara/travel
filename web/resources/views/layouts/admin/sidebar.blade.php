<!-- sidebar menu area start -->
<div class="sidebar-menu">
    <div class="sidebar-header">
        <div class="logo">
            <a href="index.html"><img src="{{ asset('srtdash/assets/images/icon/logo.png') }}" alt="logo"></a>
        </div>
    </div>
    <div class="main-menu">
        <div class="menu-inner">
            <nav>
                <ul class="metismenu" id="menu">
                    <li class="active">
                        <a href="{{ url('admin/dashboard') }}" aria-expanded="true"><i class="ti-dashboard"></i><span>dashboard</span></a>
                    </li>
                    @can('isAdmin')
                    <li><a href=""><i class="ti-receipt"></i> <span>Payment History</span></a></li>
                    <li><a href="{{ url('admin/destinations') }}"><i class="ti-location-pin"></i> <span>Destinations</span></a></li>
                    <li><a href="maps.html"><i class="ti-money"></i> <span>Price Management</span></a></li>
                    <li><a href="invoice.html"><i class="ti-user"></i> <span>Users Management</span></a></li>
                    @endcan
                </ul>
            </nav>
        </div>
    </div>
</div>
<!-- sidebar menu area end -->