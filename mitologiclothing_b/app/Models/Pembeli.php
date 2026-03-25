<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Pembeli extends Model
{
    use HasFactory;

    protected $table = 'pembeli';

    protected $fillable = [
        'no_telephone',
    ];

    public function pesanan()
    {
        return $this->hasMany(Pesanan::class, 'pembeli_id');
    }
}
