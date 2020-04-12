<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\User;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use Illuminate\Http\Request;
use Gate;
use DB;
use Auth;
use Yajra\Datatables\Datatables;

class ProfileController extends Controller
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
        $data = User::where('id',Auth::user()->id)->first();
        //dd($data);
        return view('customer.profile.index',compact('data'));
    }
    public function getUsers()
    {
        $users = User::all();
        return Datatables::of($users)
            ->addColumn('action', function ($users) {
                return '<a href="edit/' . $users->id . '" class="btn btn-primary btn-xs mb-3"><span class="ti-pencil-alt"></span> Edit</a>';
            })
            ->removeColumn('views')
            ->make(true);
            return Datatables::of($users);
    }

    public function edit($id)
    {
        $data = User::where('id', $id)->first();
        return view('admin.users.edit',compact('data'));
    }

    public function update(Request $request)
    {
        if($request->avatar == NULL){
            DB::table('users')->where('id',$request->id)->update([
                'name' => $request->name,
                'email' => $request->email,
                'roles' => $request->roles,
                'address' => $request->address,
                'phone' => $request->phone,          
            ]);
        }
        else if ($request->avatar == !NULL){
            DB::table('users')->where('id',$request->id)->update([
                'name' => $request->name,
                'email' => $request->email,
                'roles' => $request->roles,
                'address' => $request->address,
                'phone' => $request->phone,  
                'avatar' => $request->avatar->getClientOriginalName(),           
            ]);
            $file = $request->file('avatar');
            $path = '../../travel-backend/public/images/users';
            $file->move($path,$file->getClientOriginalName());
        }
        //dd($request->cover);
        
        
        return redirect()->route('Users');
    }
}
