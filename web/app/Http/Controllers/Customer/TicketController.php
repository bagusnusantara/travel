<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Order;
use Illuminate\Http\Request;
use Auth;
use DB;
use Yajra\Datatables\Datatables;

class TicketController extends Controller
{
    private $api_url;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
        $this->api_url = 'travel-backend.local/v1/';
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $orders = DB::table('orders')->join('users','orders.user_id','users.id')->select('orders.*', 'users.name', 'users.email','users.phone')->orderByDesc('id')->where('orders.user_id',Auth::user()->id)->paginate(10);
        return view('customer.tickets.index',compact('orders'));
    }
    public function show($invoice_number){
        //$data = Order::where('invoice_number', $invoice_number)->first();
        $data = DB::table('orders')->join('users','orders.user_id','users.id')->select('orders.*', 'users.name', 'users.email','users.phone')->where('invoice_number', $invoice_number)->first();
        $detail= DB::table('destination_order')->join('destinations','destination_order.destination_id','destinations.id')->select('destination_order.*', 'destinations.title','destinations.price')->where('order_id', $data->id)->get();
        return view('customer.tickets.show',compact('data','detail'));
    }
    public function getpayments()
    {
        $payments = Order::all();
        return Datatables::of($payments)
            ->addColumn('action', function ($payments) {
                return '<a href="edit/' . $payments->id . '" class="btn btn-primary btn-xs mb-3"><span class="ti-pencil-alt"></span> Edit</a>';
            })
            ->removeColumn('views')
            ->make(true);
            return Datatables::of($payments);
    }

    public function edit($id)
    {
        $data = Order::where('id', $id)->first();
        return view('admin.payments.edit',compact('data'));
    }

    public function update(Request $request)
    {
        if($request->avatar == NULL){
            DB::table('payments')->where('id',$request->id)->update([
                'name' => $request->name,
                'email' => $request->email,
                'roles' => $request->roles,
                'address' => $request->address,
                'phone' => $request->phone,          
            ]);
        }
        else if ($request->avatar == !NULL){
            DB::table('payments')->where('id',$request->id)->update([
                'name' => $request->name,
                'email' => $request->email,
                'roles' => $request->roles,
                'address' => $request->address,
                'phone' => $request->phone,  
                'avatar' => $request->avatar->getClientOriginalName(),           
            ]);
            $file = $request->file('avatar');
            $path = '../../travel-backend/public/images/payments';
            $file->move($path,$file->getClientOriginalName());
        }
        //dd($request->cover);
        
        
        return redirect()->route('payments');
    }
}
