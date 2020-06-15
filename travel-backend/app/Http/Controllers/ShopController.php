<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Province;
use App\Http\Resources\Provinces as ProvinceResourceCollection;
use App\City;
use App\Http\Resources\Cities as CityResourceCollection;
use DB;
use Auth;
use Validator;
use App\User;
use App\Destination;
use App\Order;
use App\DestinationOrder;

class ShopController extends Controller
{

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function shipping(Request $request)
    {
        $user = Auth::user();
        $status = "error";
        $message = "";
        $data = null;
        $code = 200;
        if ($user) {
            $this->validate($request, [
                'name' => 'required',
                'address' => 'required',
                'phone' => 'required',
            ]);
            $user->name = $request->name;
            $user->address = $request->address;
            $user->phone = $request->phone;
            if($user->save()){
                $status = "success";
                $message = "Update shipping success";
                $data = $user->toArray();
            }
            else{
                $message = "Update shipping failed";
            }
        }
        else{
            $message = "User not found";
        }

        return response()->json([
            'status' => $status,
            'message' => $message,
            'data' => $data
        ], $code);
    }


    protected function validateCart($carts)
    {
        $safe_carts = [];
        $total = [
            'quantity_before' => 0,
            'quantity'  => 0,
            'price'     => 0,
        ];
        $idx = 0;
        foreach($carts as $cart){
            $id = (int)$cart['id'];
            $quantity = (int)$cart['quantity'];
            $total['quantity_before'] += $quantity;
            $destination = destination::find($id);
            if($destination){
                if($destination->stock>0){
                    $safe_carts[$idx]['id'] = $destination->id;
                    $safe_carts[$idx]['title'] = $destination->title;
                    $safe_carts[$idx]['cover'] = $destination->cover;
                    $safe_carts[$idx]['price'] = $destination->price;
                    $safe_carts[$idx]['weight'] = $destination->weight;
                    if($destination->stock < $quantity){
                        $quantity = (int) $destination->stock;
                    }
                    $safe_carts[$idx]['quantity'] = $quantity;

                    $total['quantity']  += $quantity;
                    $total['price']     += $destination->price * $quantity;
                    $idx++;
                }
                else{
                    continue;
                }
            }
        }
        return [
            'safe_carts' => $safe_carts,
            'total' => $total,
        ];
    }

    public function services(Request $request)
    {
        $status = "error";
        $message = "";
        $data = [];
        // validasi kelengkapan data
        $this->validate($request, [
            // 'courier' => 'required',
            'carts' => 'required',
        ]);

        $user = Auth::user();
        if($user){
            // $destination = $user->city_id;
            if($destination>0){
                // hardcode
                // $origin = 153; // Jakarta Selatan
                // $courier = $request->courier;
                $carts = $request->carts;
                $carts = json_decode($carts, true);
                // validasi data belanja
                $validCart = $this->validateCart($carts);
                $data['safe_carts'] = $validCart['safe_carts'];
                $data['total'] = $validCart['total'];
                $quantity_different = $data['total']['quantity_before']<>$data['total']['quantity'];
            }
            else{
                $message = "destination not set";
            }
        }
        else{
            $message = "user not found";
        }

        return response()->json([
            'status' => $status,
            'message' => $message,
            'data' => $data
        ], 200);
    }

    public function payment(Request $request)
    {
        $error = 0;
        $status = "error";
        $message = "";
        $data = [];

        $user = Auth::user();
        if ($user) {
            // validasi kelengkapan data
            $this->validate($request, [
            //    'courier' => 'required',
            //    'service' => 'required',
                'carts' => 'required',
            ]);

            DB::beginTransaction();
            try {
                // prepare data
                $origin = 153; // Jakarta Selatan
                // $destination = $user->city_id;
                //if($destination<=0) $error++;
                // $courier = $request->courier;
                // $service = $request->service;
                $carts = json_decode($request->carts, true);

                // create order
                $order = new Order;
                $order->user_id = $user->id;
                $order->total_bill = 0;
                $order->invoice_number = date('YmdHis');
                // $order->courier_service = $courier.'-'.$service;
                $order->status = 'SUBMIT';
                if($order->save()){
                    $total_price = 0;
                    // $total_weight = 0;
                    foreach($carts as $cart){
                        $id = (int)$cart['id'];
                        $quantity = (int)$cart['quantity'];
                        $destination = destination::find($id);
                        if($destination){
                            if($destination->stock>=$quantity){
                                $total_price += $destination->price * $quantity;
                                $destination_order = new destinationOrder;
                                $destination_order->destination_id = $destination->id;
                                $destination_order->order_id = $order->id;
                                $destination_order->quantity = $quantity;
                                if($destination_order->save()){
                                    // kurangi stock
                                    $destination->stock = $destination->stock - $quantity;
                                    $destination->save();
                                }
                            }
                            else{
                                $error++;
                                throw new \Exception('Out of stock');
                            }
                        }
                        else{
                            $error++;
                            throw new \Exception('destination is not found');
                        }
                    }

                    $totalBill = 0;

                    $total_bill = $total_price;
                    // update total bill order
                    $order->total_bill = $total_bill;
                    if($order->save()){
                        if($error==0){
                            DB::commit();
                            $status = 'success';
                            $message = 'Transaction success';
                            $data = [
                                'order_id' => $order->id,
                                'total_bill' => $total_bill,
                                'invoice_number' => $order->invoice_number,
                            ];
                        }
                        else{
                            $message = 'There are '.$error.' errors';
                        }
                    }
                }
            } catch (\Exception $e) {
                $message = $e->getMessage();
                DB::rollback();
            }
        }
        else{
            $message = "User not found";
        }

        return response()->json([
            'status' => $status,
            'message' => $message,
            'data' => $data
        ], 200);

    }

    public function myOrder(Request $request)
    {
        $user = Auth::user();
        $status = "error";
        $message = "";
        $data = [];
        if($user){
            $orders = Order::select('*')
                ->where('user_id','=',$user->id)
                ->orderBy('id','DESC')
                ->get();

            $status = "success";
            $message = "data my order ";
            $data = $orders;
        }
        else{
            $message = "User not found";
        }

        return response()->json([
            'status' => $status,
            'message' => $message,
            'data' => $data
        ], 200);
    }
}
