<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Cart;
use App\Destination;
use App\Order;
use App\DestinationOrder;
use DB;
use Auth;
use GuzzleHttp\Client;

class CartController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
        $this->api_url = 'travel-backend.local/v1/';
    }

    public function add(Request $request)
    {
        $destination = Destination::find($request->id);

        Cart::add($destination->id, $destination->title, $destination->price, 1, array());

        return back()->with('success', "$destination->title has successfully beed added to the shopping cart!");;
    }

    public function cart()
    {
        $params = [
            'title' => 'Shopping Cart Checkout',
        ];

        return view('customer.cart.index')->with($params);
    }

    public function clear()
    {
        Cart::clear();

        return back()->with('success', "The shopping cart has successfully beed added to the shopping cart!");;
    }
    public function payment(Request $request)
    {
        $order = new Order();
        $order->user_id = Auth::user()->id;
        $order->total_bill = $request->total_bill;
        $order->invoice_number = date('YmdHis');
        $order->user_name = Auth::user()->name;
        $order->user_email = Auth::user()->email;
        $order->user_phone = Auth::user()->phone;
        $order->status = 'SUBMIT';
        $order->save();
        Cart::clear();

        $data = $request->all();
        $count = count($request->destination_id);
        for($i = 0; $i < $count; $i++){
            $destination_order = new DestinationOrder();
            $destination_order->order_id = $order->id;
            $destination_order->destination_id = $request->destination_id[$i];
            $destination_order->quantity = $request->quantity[$i];
            $destination_order->save();
            if($destination_order->save()){
                // kurangi stock
                $destination = Destination::find($destination_order->destination_id);
                $destination->stock = $destination->stock - $destination_order->quantity;
                $destination->save();
            }
        }

        // DB::table('orders')->insert([
        //     'user_id' => Auth::user()->id,
        //     'total_bill' => $request->total_bill,
        //     'invoice_number' => date('YmdHis'),
        //     'user_name' => Auth::user()->name,
        //     'user_email' => Auth::user()->email,
        //     'user_phone' => Auth::user()->phone,

        // ]);
        $params = DB::table('orders')->where('user_id', Auth::user()->id)->latest()->first();
        return view('customer.cart.payment', compact('params'));
    }
}
