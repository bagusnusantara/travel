<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Gate;
use App\User;
use App\Destination;
use App\Order;
class DashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $total_users = User::where('status','ACTIVE')->count();
        $total_destinations = Destination::where('status','ACTIVE')->count();
        $total_orders = Order::count();
        //dd($total_users);
        return view('admin.dashboard.index',compact('total_users','total_destinations','total_orders'));
    }
}
