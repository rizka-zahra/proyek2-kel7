<?php

namespace App\Http\Controllers;

use App\Models\DetailProduk;
use App\Models\Pengguna;
use App\Models\Pesanan;
use App\Models\PesananItem;
use App\Models\Tagihan;
use Illuminate\Http\Request;

class PesananController extends Controller
{
    public function create()
    {
        $pengguna = Pengguna::all();
        $detailProduk = DetailProduk::with('produk')->get();

        return view('pesanan.create', compact('pengguna', 'detailProduk'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'status_order' => 'required|in:menunggu,diproses,selesai,dibatalkan',
        ]);

        $detailProduk = DetailProduk::with('produk')->findOrFail($validated['detail_produk_id']);

        $subtotalPembayaran = $detailProduk->harga * $validated['jumlah'];
        $totalPembayaran = $subtotalPembayaran + $validated['subtotal_pengiriman'];

        $pesanan = Pesanan::create([
            'pengguna_id' => $validated['pengguna_id'],
            'nama_pemesan' => $validated['nama_pemesan'],
            'no_telephone' => $validated['no_telephone'],
            'alamat_pengguna' => $validated['alamat_pengguna'],
            'pengiriman' => $validated['pengiriman'],
            'subtotal_pembayaran' => $subtotalPembayaran,
            'subtotal_pengiriman' => $validated['subtotal_pengiriman'],
            'total_pembayaran' => $totalPembayaran,
            'metode_pembayaran' => $validated['metode_pembayaran'],
            'status_order' => 'menunggu',
        ]);

        $pathDesain = null;

        if ($request->hasFile('desain')) {
            $pathDesain = $request->file('desain')->store('desain', 'public');
        }

        PesananItem::create([
            'pesanan_id' => $pesanan->id,
            'detail_produk_id' => $detailProduk->id,
            'desain' => $pathDesain,
            'jumlah' => $validated['jumlah'],
            'harga' => $detailProduk->harga,
            'subtotal' => $subtotalPembayaran,
        ]);

        $detailPesanan = 'Produk: ' . $detailProduk->produk->nama_produk .
            ', Bahan: ' . $detailProduk->bahan .
            ', Warna: ' . $detailProduk->warna .
            ', Ukuran: ' . $detailProduk->ukuran;

        Tagihan::create([
            'pesanan_id' => $pesanan->id,
            'nama_pemesan' => $validated['nama_pemesan'],
            'no_telephone_user' => $validated['no_telephone'],
            'detail_pesanan' => $detailPesanan,
            'jumlah_pesanan' => $validated['jumlah'],
            'harga' => $detailProduk->harga,
            'total_harga' => $totalPembayaran,
            'status_pembayaran' => 'belum_bayar',
        ]);

        return redirect()->route('admin.pesanan.index')->with('success', 'Pesanan berhasil dibuat.');
    }
}
