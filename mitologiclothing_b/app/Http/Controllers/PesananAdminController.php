<?php

namespace App\Http\Controllers;

use App\Models\Pesanan;
use Illuminate\Http\Request;

class PesananAdminController extends Controller
{
    public function index()
    {
        $pesanan = Pesanan::with(['pembeli', 'tagihan'])->latest()->paginate(10);

        return view('pesanan.admin_index', compact('pesanan'));
    }

    public function show(Pesanan $pesanan)
    {
        $pesanan->load(['pembeli', 'tagihan']);

        return view('pesanan.admin_show', compact('pesanan'));
    }

    public function edit(Pesanan $pesanan)
    {
        return view('pesanan.admin_edit', compact('pesanan'));
    }

    public function update(Request $request, Pesanan $pesanan)
    {
        $request->validate([
            'status_order' => 'required|in:menunggu,diproses,dikirim,selesai,dibatalkan',
        ]);

        $pesanan->update([
            'status_order' => $request->status_order,
        ]);

        return redirect()->route('admin.pesanan.index')
            ->with('success', 'Status pesanan berhasil diperbarui.');
    }

    public function destroy(Pesanan $pesanan)
    {
        $pesanan->delete();

        return redirect()->route('admin.pesanan.index')
            ->with('success', 'Pesanan berhasil dihapus.');
    }
}
