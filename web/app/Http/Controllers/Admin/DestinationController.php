<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Destination;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use Illuminate\Http\Request;
use Gate;
use Yajra\Datatables\Datatables;

class DestinationController extends Controller
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
        $this->api_url= 'travel-backend.local/v1/';
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        // $destinations = Destination::all();   
        return view('admin.destinations.index');
    }
    public function getDestinations()
    {
        $client = new Client();
        $url =  $this->api_url.'destinations';
        $request = $client->get($url);
        $response = $request->getBody()->getContents();
        //$destinations = json_decode($response, true);
        $destinations = Destination::all();
        return Datatables::of($destinations)
        ->addColumn('action', function($destinations){
            return '<a href="#destinations/edit/'.$destinations->slug.'" class="btn btn-primary btn-xs mb-3"><span class="ti-pencil-alt"></span> Edit</a>';
        })
        ->removeColumn('views')               
        ->make(true);
        //return $destinations;
    }

    public function create()
    {
        return view('admin.destinations.create');
    }
    
}
