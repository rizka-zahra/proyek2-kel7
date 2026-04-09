<?php

namespace App\Http\Controllers\Api\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Pesanan;
use App\Models\Tagihan;
use Illuminate\Http\Request;

class PesananFrontendController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nama_pemesan' => 'required|string|max:100',
            'no_telephone' => 'required|string|max:20',
            'desain' => 'required|string',
            'ukuran' => 'required|string',
            'warna' => 'required|string',
            'bahan' => 'required|string',
            'jumlah' => 'required|integer|min:1',
            'alamat_pengguna' => 'required|string',
            'pengiriman' => 'required|string',
            'subtotal_pembayaran' => 'required|numeric',
            'subtotal_pengiriman' => 'required|numeric',
            'total_pembayaran' => 'required|numeric',
            'metode_pembayaran' => 'required|string',
            'status_order' => 'required|in:menunggu,diproses,dikirim,selesai,dibatalkan',
        ]);

        $pesanan = Pesanan::create($validated);

        $detailPesanan = 'Desain: ' . $pesanan->desain .
            ', Ukuran: ' . $pesanan->ukuran .
            ', Warna: ' . $pesanan->warna .
            ', Bahan: ' . $pesanan->bahan .
            ', Pengiriman: ' . $pesanan->pengiriman;

        $hargaSatuan = $pesanan->jumlah > 0
            ? $pesanan->subtotal_pembayaran / $pesanan->jumlah
            : 0;

        $tagihan = Tagihan::create([
            'pesanan_id' => $pesanan->id,
            'nama_pemesan' => $pesanan->nama_pemesan,
            'no_telephone_user' => $pesanan->no_telephone,
            'detail_pesanan' => $detailPesanan,
            'jumlah_pesanan' => $pesanan->jumlah,
            'harga' => $hargaSatuan,
            'total_harga' => $pesanan->total_pembayaran,
            'status_pembayaran' => 'belum_bayar',
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Pesanan berhasil dibuat dan tagihan otomatis dibuat',
            'data' => [
                'pesanan' => $pesanan,
                'tagihan' => $tagihan,
            ]
        ], 201);
    }

    public function show($id)
    {
        $pesanan = Pesanan::with('tagihan')->findOrFail($id);

        return response()->json([
            'success' => true,
            'message' => 'Detail pesanan berhasil diambil',
            'data' => $pesanan
        ], 200);
    }
}
