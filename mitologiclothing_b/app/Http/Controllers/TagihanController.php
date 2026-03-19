<?php

namespace App\Http\Controllers;

use App\Models\Tagihan;
use Illuminate\Http\Request;

class TagihanController extends Controller
{
    public function index()
    {
        $tagihan = Tagihan::all();
        return view('tagihan.tagihan_kelola', compact('tagihan'));
    }

    public function create()
    {
        return view('tagihan.tagihan_tambah');
    }

    public function store(Request $request)
    {
        $request->validate([
            'no_telephone_user' => 'required',
            'detail_pesanan' => 'required',
            'jumlah_pesanan' => 'required|integer',
            'harga' => 'required|numeric',
            'total_harga' => 'required|numeric',
        ]);

        Tagihan::create($request->all());

        return redirect()->route('tagihan.kelola');
    }

    public function edit($id)
    {
        $tagihan = Tagihan::findOrFail($id);
        return view('tagihan.tagihan_edit', compact('tagihan'));
    }

    public function update(Request $request, $id)
    {
        $tagihan = Tagihan::findOrFail($id);
        $tagihan->update($request->all());

        return redirect()->route('tagihan.kelola');
    }

    public function destroy($id)
    {
        Tagihan::destroy($id);
        return redirect()->route('tagihan.kelola');
    }
}
