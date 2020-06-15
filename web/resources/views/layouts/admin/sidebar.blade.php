<!-- sidebar menu area start -->
<div class="sidebar-menu">
    <div class="sidebar-header">
        <div class="logo">
            <a href="#"><img src="{{ asset('srtdash/assets/images/icon/logo.png') }}" alt="logo"></a>
        </div>
    </div>
    <div class="main-menu">
        <div class="menu-inner">
            <nav>
                <ul class="metismenu" id="menu">
                    <li class="{{ request()->is('admin/dashboard') ? ' active' : '' }}">
                        <a href="{{ url('admin/dashboard') }}" aria-expanded="true"><i class="ti-dashboard"></i><span>dashboard</span></a>
                    </li>
                    @can('isAdmin')
                    <li class="{{ request()->is('admin/payments') ? ' active' : '' }}"><a  href="{{ url('admin/payments') }}"><i class="ti-receipt"></i> <span>Payment History</span></a></li>
                    <li class="{{ request()->is('admin/destinations') ? ' active' : '' }}"><a href="{{ url('admin/destinations') }}"><i class="ti-location-pin"></i> <span>Destinations</span></a></li>
                    <li class="{{ request()->is('admin/users') ? ' active' : '' }}"><a href="{{ url('admin/users') }}"><i class="ti-user"></i> <span>Users Management</span></a></li>
                    @endcan
                </ul>
            </nav>
        </div>
    </div>
</div>
<!-- sidebar menu area end -->