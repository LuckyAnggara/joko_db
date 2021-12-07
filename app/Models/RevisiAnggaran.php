<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RevisiAnggaran extends Model
{
    use HasFactory;
    protected $table = 'revisi_anggaran';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
    public $timestamps = true;
}
