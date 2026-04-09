<?php

namespace App\Http\Controllers;

use App\Models\Pengguna;
use App\Models\DetailProduk;
use App\Models\Pesanan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PesananAdminController extends Controller
{
    public function index()
    {
        $pesanan = Pesanan::with('pengguna', 'items.detailProduk.produk', 'tagihan')
            ->latest()
            ->paginate(10);

        return view('pesanan.admin_index', compact('pesanan'));
    }

    public function create()
    {
        $pengguna = Pengguna::all();
        $detailProduk = DetailProduk::with('produk')->get();

        return view('pesanan.create', compact('pengguna', 'detailProduk'));
    }

    public function show(Pesanan $pesanan)
    {
        $pesanan->load('pengguna', 'items.detailProduk.produk', 'tagihan');
        return view('pesanan.admin_show', compact('pesanan'));
    }

    public function edit(Pesanan $pesanan)
    {
        $pesanan->load('items.detailProduk.produk');
        $detailProduk = DetailProduk::with('produk')->get();

        return view('pesanan.admin_edit', compact('pesanan', 'detailProduk'));
    }

    public function update(Request $request, Pesanan $pesanan)
    {
        $validated = $request->validate([
            'status_order' => 'required|in:menunggu,diproses,selesai,dibatalkan',
        ]);

        $pesanan->update([
            'status_order' => $validated['status_order'],
        ]);

        return redirect()->route('admin.pesanan.index')
            ->with('success', 'Status berhasil diperbarui.');
    }

    public function destroy(Pesanan $pesanan)
    {
        foreach ($pesanan->items as $item) {
            if ($item->desain) {
                Storage::delete('public/' . $item->desain);
            }
        }

        $pesanan->delete();

        return redirect()->route('admin.pesanan.index')->with('success', 'Pesanan berhasil dihapus.');
    }
}
