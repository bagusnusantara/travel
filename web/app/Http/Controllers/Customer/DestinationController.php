<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Gate;
use App\Destination;
use GuzzleHttp\Client;

class DestinationController extends Controller
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
        return view('customer.destinations.index',compact('destinations'));
    }
    public function slug($slug)
    {
        $show = Destination::where('slug', $slug)->first();
        return view('customer.destinations.show',compact('show'));;
        // return new DestinationResource($slug);
    }
    public function search(Request $request)
    {
        $keyword = $request->keyword;
        $destinations = Destination::select('*')
            ->where('title', 'LIKE', "%".$keyword."%")
            ->orderBy('views', 'DESC')
            ->get();
        //dd($destinations);
        return view('customer.destinations.search',compact('destinations'));        
    }
}
