<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Promo;
use App\Http\Resources\Promos as PromoResourceCollection;

class PromoController extends Controller
{
    public function random($count){
        $criteria = Promo::select('*')
        ->inRandomOrder()
        ->limit($count)
        ->get();
        return new PromoResourceCollection($criteria);
    }
}
