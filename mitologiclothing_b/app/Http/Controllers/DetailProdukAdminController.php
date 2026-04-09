<?php

namespace App\Http\Controllers;

use App\Models\DetailProduk;
use App\Models\Produk;
use Illuminate\Http\Request;

class DetailProdukAdminController extends Controller
{
    public function index()
    {
        $detailProduk = DetailProduk::with('produk')->latest()->paginate(10);
        return view('detail_produk.index', compact('detailProduk'));
    }

    public function create()
    {
        $produk = Produk::all();
        return view('detail_produk.create', compact('produk'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'produk_id' => 'required|exists:produk,id',
            'bahan' => 'required|string|max:255',
            'warna' => 'required|string|max:255',
            'ukuran' => 'required|string|max:255',
            'harga' => 'required|numeric',
        ]);

        DetailProduk::create($validated);

        return redirect()->route('admin.detail-produk.index')->with('success', 'Detail produk berhasil ditambahkan.');
    }

    public function edit(DetailProduk $detail_produk)
    {
        $produk = Produk::all();
        return view('detail_produk.edit', [
            'detailProduk' => $detail_produk,
            'produk' => $produk,
        ]);
    }

    public function update(Request $request, DetailProduk $detail_produk)
    {
        $validated = $request->validate([
            'produk_id' => 'required|exists:produk,id',
            'bahan' => 'required|string|max:255',
            'warna' => 'required|string|max:255',
            'ukuran' => 'required|string|max:255',
            'harga' => 'required|numeric',
        ]);

        $detail_produk->update($validated);

        return redirect()->route('admin.detail-produk.index')->with('success', 'Detail produk berhasil diperbarui.');
    }

    public function destroy(DetailProduk $detail_produk)
    {
        $detail_produk->delete();

        return redirect()->route('admin.detail-produk.index')->with('success', 'Detail produk berhasil dihapus.');
    }
}
