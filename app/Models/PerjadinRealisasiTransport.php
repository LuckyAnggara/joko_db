<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PerjadinRealisasiTransport extends Model
{
    use HasFactory;
    protected $table = 'perjadin_realisasi_transport';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
    public $timestamps = true;
}
