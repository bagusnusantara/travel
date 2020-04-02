<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Gate;
use App\Destination;
use GuzzleHttp\Client;

class HomeController extends Controller
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

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        //$destinations = Destination::all();
        $client = new Client();
        $url =  $this->api_url . 'destinations';
        $request = $client->get($url);
        $response = $request->getBody()->getContents();
        $destinations = json_decode($response, true);
        //dd($destinations['data'][0]['title']);
        return view('customer.home.index',compact('destinations'));
    }
    public function slug($slug)
    {
        $show = Destination::where('slug', $slug)->first();
        // return new DestinationResource($slug);
    }
    public function guest()
    {
        //$destinations = Destination::all();
        $client = new Client();
        $url =  $this->api_url . 'destinations';
        $request = $client->get($url);
        $response = $request->getBody()->getContents();
        $destinations = json_decode($response, true);
        //dd($destinations['data'][0]['title']);
        return view('welcome',compact('destinations'));
    }
}
