<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DestinationOrder extends Model
{
    protected $table = 'destination_order';

    protected $fillable = [
        'destination_id', 'order_id', 'quantity'
    ];
}
