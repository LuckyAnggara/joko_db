<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PerjadinLog extends Model
{
    use HasFactory;
    protected $table = 'perjadin_log';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
    public $timestamps = true;
    // protected $dates = [
    //     'created_at',
    // ];

}
