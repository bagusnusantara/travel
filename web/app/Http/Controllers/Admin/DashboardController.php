<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Gate;
use App\User;
use App\Destination;
use App\Order;
use DB;
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
        $orders = DB::table('orders')->select(DB::raw('SUM(total_bill) as total'),DB::raw('EXTRACT(MONTH FROM created_at) AS months'))
        ->groupBy('months')
        ->get();
        //$latest_orders = Order::orderBy('id','DESC')->paginate(5);
        $latest_orders = DB::table('orders')->join('users','orders.user_id','users.id')->select('orders.*', 'users.name', 'users.email','users.phone')->paginate(5);
        return view('admin.dashboard.index',compact('total_users','total_destinations','total_orders','orders','latest_orders'));
    }
}
