<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PembelianLampiran extends Model
{
    use HasFactory;
    protected $table = 'pembelian_lampiran';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
    public $timestamps = true;
}
