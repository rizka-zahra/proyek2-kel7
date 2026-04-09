<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PesananItem extends Model
{
    protected $table = 'pesanan_item';

    protected $fillable = [
        'pesanan_id',
        'detail_produk_id',
        'desain',
        'jumlah',
        'harga',
        'subtotal',
    ];

    public function pesanan()
    {
        return $this->belongsTo(Pesanan::class, 'pesanan_id');
    }

    public function detailProduk()
    {
        return $this->belongsTo(DetailProduk::class, 'detail_produk_id');
    }
}
