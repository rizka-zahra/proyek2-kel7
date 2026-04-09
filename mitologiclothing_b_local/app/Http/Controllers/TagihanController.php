<?php

namespace App\Http\Controllers;

use App\Models\Tagihan;
use Illuminate\Http\Request;

class TagihanController extends Controller
{
    public function index()
    {
        $tagihan = Tagihan::with('pesanan.items.detailProduk.produk')->latest()->paginate(10);
        return view('tagihan.tagihan_kelola', compact('tagihan'));
    }

    public function show(Tagihan $tagihan)
    {
        $tagihan->load('pesanan.items.detailProduk.produk');
        return view('tagihan.show', compact('tagihan'));
    }

    public function edit(Tagihan $tagihan)
    {
        return view('tagihan.edit', compact('tagihan'));
    }

    public function update(Request $request, Tagihan $tagihan)
    {
        $validated = $request->validate([
            'status_pembayaran' => 'required|in:belum_bayar,menunggu_verifikasi,lunas',
        ]);

        $tagihan->update($validated);

        return redirect()->route('admin.tagihan.index')->with('success', 'Status tagihan berhasil diperbarui.');
    }
}
