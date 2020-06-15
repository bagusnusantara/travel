<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Destination; 
use App\Category; 
use App\Http\Resources\Destination as DestinationResource;
use App\Http\Resources\Destinations as DestinationResourceCollection;

class DestinationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $criteria = Destination::paginate(10);
        return new DestinationResourceCollection($criteria);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function top($count)
    {
        $criteria = Destination::select('*')
            ->orderBy('views', 'DESC')
            ->limit($count)
            ->get();        
        return new DestinationResourceCollection($criteria);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function search($keyword)
    {
        $criteria = Destination::select('*')
            ->where('title', 'LIKE', "%".$keyword."%")
            ->orderBy('views', 'DESC')
            ->get();        
        return new DestinationResourceCollection($criteria);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $destination = Destination::create($request->all());
        // $file = $request->file('cover');
        // $tujuan_upload = 'images/destinations';
        // $file->move($tujuan_upload,$file->getClientOriginalName());

        // $destination = new Destination;
        // $destination->title = $request->title;
        // $destination->slug = str_slug($request->title);
        // $destination->description = $request->description;
        // $destination->price = $request->price;
        // $destination->status = $request->status;
        // $destination->cover = $file;
        // $destination->save();
        
        return response()->json([
            'status' => 'success',
            'message' => 'destinations',
            'data' => $destination,
        ], 200); 
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return new DestinationResource(Destination::find($id));
    }

    public function slug($slug)
    {
        $criteria = Destination::where('slug', $slug)->first();
        return new DestinationResource($criteria);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Display a listing of the resource.
     *
     * @param  array  $carts
     * @return \Illuminate\Http\Response
     */
    public function cart(Request $request)
    {
        //$request->carts = '[{"id":3,"quantity":4}]';
        $carts = json_decode($request->carts, true);
        $Destination_carts = [];
        foreach($carts as $cart){
            $id = (int)$cart['id'];
            $quantity = (int)$cart['quantity'];
            $Destination = Destination::find($id);
            if($Destination){
                $note = 'unsafe';
                if($Destination->stock >= $quantity){
                    $note = 'safe';
                }
                else {
                    $quantity = (int) $Destination->stock;
                    $note = 'out of stock'; 
                }
                $Destination_carts[] = [
                    'id' => $id,
                    'title' => $Destination->title,
                    'cover' => $Destination->cover,
                    'price' => $Destination->price,
                    'quantity' => $quantity,
                    'note' => $note
                ];
            }
        }
        return response()->json([
            'status' => 'success',
            'message' => 'carts',
            'data' => $Destination_carts,
        ], 200); 
        //foreach ($carts as $cart) {
            //var_dump(($request->carts));
        //}
        //$Destination_carts = [];
        //Destination::find
    }
}
