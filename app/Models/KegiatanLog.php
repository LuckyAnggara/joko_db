<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KegiatanLog extends Model
{
    use HasFactory;
    protected $table = 'kegiatan_log';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
    public $timestamps = true;
    // public $date = ['created_at','deleted_at'];
}
