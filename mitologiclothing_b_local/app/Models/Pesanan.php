<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pesanan extends Model
{
    protected $table = 'pesanan';

    protected $fillable = [
        'pengguna_id',
        'nama_pemesan',
        'no_telephone',
        'alamat_pengguna',
        'pengiriman',
        'subtotal_pembayaran',
        'subtotal_pengiriman',
        'total_pembayaran',
        'metode_pembayaran',
        'status_order',
    ];

    public function pengguna()
    {
        return $this->belongsTo(Pengguna::class, 'pengguna_id');
    }

    public function items()
    {
        return $this->hasMany(PesananItem::class, 'pesanan_id');
    }

    public function tagihan()
    {
        return $this->hasOne(Tagihan::class, 'pesanan_id');
    }
}
