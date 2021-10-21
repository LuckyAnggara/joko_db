<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Urusan extends Model
{
    use HasFactory;
    protected $table = 'urusan';
    protected $guarded = [
        'id',
    ];
    public $primaryKey = 'id';
}
