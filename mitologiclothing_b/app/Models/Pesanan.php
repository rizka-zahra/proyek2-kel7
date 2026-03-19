<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pesanan extends Model
{
    use HasFactory;

    protected $table = 'pesanan';

    protected $fillable = [
        'no_telephone',
        'desain',
        'ukuran',
        'warna',
        'bahan',
        'jumlah',
        'alamat_pengguna',
        'pengiriman',
        'subtotal_pembayaran',
        'subtotal_pengiriman',
        'total_pembayaran',
        'metode_pembayaran',
        'status_order',
        'pricelists_id'
    ];

    public function pricelist()
    {
        return $this->belongsTo(Pricelists::class, 'pricelists_id');
    }
}
