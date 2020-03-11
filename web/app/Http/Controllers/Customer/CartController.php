<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Cart;
use App\Destination;
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
        $this->middleware('auth');
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
}
