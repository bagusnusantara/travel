<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Destination;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use Illuminate\Http\Request;
use Gate;
use DB;
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
        $this->api_url = 'travel-backend.local/v1/';
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
        $url =  $this->api_url . 'destinations';
        $request = $client->get($url);
        $response = $request->getBody()->getContents();
        //$destinations = json_decode($response, true);
        $destinations = Destination::all();
        return Datatables::of($destinations)
            ->addColumn('action', function ($destinations) {
                return '<a href="destinations/edit/' . $destinations->slug . '" class="btn btn-primary btn-xs mb-3"><span class="ti-pencil-alt"></span> Edit</a>';
            })
            ->removeColumn('views')
            ->make(true);
        //return $destinations;
    }

    public function store(Request $request)
    {
        $client = new Client();

        $response = $client->request('POST', $this->api_url . 'destinations/store', [
            'form_params' => [
                'title' => $request->title,
                'slug' => str_slug($request->title),
                'description' => $request->description,
                'status' => $request->status,
                'price' => $request->price,
                'cover' => $request->cover->getClientOriginalName(),
            ]
        ]);
        $file = $request->file('cover');
        $path = '../../travel-backend/public/images/destinations';
        $file->move($path,$file->getClientOriginalName());
        
        return redirect()->route('Destinations');
    }

    public function create()
    {
        return view('admin.destinations.create');
    }
    public function edit($slug)
    {
        $data = Destination::where('slug', $slug)->first();
        return view('admin.destinations.edit',compact('data'));
    }

    public function update(Request $request)
    {
        if($request->cover == NULL){
            DB::table('destinations')->where('slug',$request->slug)->update([
                'title' => $request->title,
                'description' => $request->description,
                'status' => $request->status,
                'price' => $request->price,
                // 'cover' => $request->cover,           
            ]);
        }
        else if ($request->cover == !NULL){
            DB::table('destinations')->where('slug',$request->slug)->update([
                'title' => $request->title,
                'description' => $request->description,
                'status' => $request->status,
                'price' => $request->price,
                'cover' => $request->cover->getClientOriginalName(),           
            ]);
            $file = $request->file('cover');
            $path = '../../travel-backend/public/images/destinations';
            $file->move($path,$file->getClientOriginalName());
        }
        //dd($request->cover);
        
        
        return redirect()->route('Destinations');
    }
}
