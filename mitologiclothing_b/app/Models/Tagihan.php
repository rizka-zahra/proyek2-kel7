<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tagihan extends Model
{
    use HasFactory;

    protected $table = 'pesanan';

    protected $fillable = [
        'no_telephone_user',
        'detail_pesanan',
        'jumlah_pesanan',
        'harga',
        'total_harga'
    ];
}
