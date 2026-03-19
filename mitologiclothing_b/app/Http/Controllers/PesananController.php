<?php

namespace App\Http\Controllers;

use App\Models\Pesanan;
use App\Models\Pricelists;
use Illuminate\Http\Request;

class PesananController extends Controller
{
    public function index()
    {
        $pesanan = Pesanan::all();
        return view('pesanan.pesanan_kelola', compact('pesanan'));
    }

    public function create()
    {
        $pricelists = Pricelists::all();
        return view('pesanan.pesanan_tambah', compact('pricelists'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'no_telephone' => 'required',
            'desain' => 'required',
            'ukuran' => 'required',
            'warna' => 'required',
            'bahan' => 'required',
            'jumlah' => 'required|integer',
            'alamat_pengguna' => 'required',
            'pengiriman' => 'required',
            'subtotal_pembayaran' => 'required|numeric',
            'subtotal_pengiriman' => 'required|numeric',
            'total_pembayaran' => 'required|numeric',
            'metode_pembayaran' => 'required',
            'status_order' => 'required',
            'pricelists_id' => 'required|exists:pricelists,id',
        ]);

        Pesanan::create($request->all());

        return redirect()->route('pesanan.kelola');
    }

    public function edit($id)
    {
        $pesanan = Pesanan::findOrFail($id);
        $pricelists = Pricelists::all();
        return view('pesanan.edit', compact('pesanan', 'pricelists'));
    }

    public function update(Request $request, $id)
    {
        $pesanan = Pesanan::findOrFail($id);
        $pesanan->update($request->all());

        return redirect()->route('pesanan.kelola');
    }

    public function destroy($id)
    {
        Pesanan::destroy($id);
        return redirect()->route('pesanan.kelola');
    }
}
