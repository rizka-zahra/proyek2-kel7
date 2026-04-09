<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tagihan extends Model
{
    protected $table = 'tagihan';

    protected $fillable = [
        'pesanan_id',
        'nama_pemesan',
        'no_telephone_user',
        'detail_pesanan',
        'jumlah_pesanan',
        'harga',
        'total_harga',
        'status_pembayaran',
    ];

    public function pesanan()
    {
        return $this->belongsTo(Pesanan::class, 'pesanan_id');
    }
}
