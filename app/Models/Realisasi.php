<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Realisasi extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'realisasi';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
    public $timestamps = true;
    public $date = ['tanggal_spb','created_at','deleted_at'];
}
