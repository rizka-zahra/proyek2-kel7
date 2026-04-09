<?php

namespace App\Http\Controllers;

use App\Models\Pricelists;
use App\Models\KategoriBahan;
use Illuminate\Http\Request;

class PricelistController extends Controller
{
    public function index()
    {
        $pricelist = Pricelists::with('kategori')->get();
        return view('pricelist.pricelist_kelola', compact('pricelist'));
    }

    public function create()
    {
        $kategori = KategoriBahan::all();
        return view('pricelist.pricelist_tambah', compact('kategori'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'kategori_bahan_id' => 'required',
            'harga' => 'required|numeric',
            'gambar' => 'required|image',
        ]);

        $gambar = $request->file('gambar')->store('images', 'public');

        Pricelists::create([
            'kategori_bahan_id' => $request->kategori_bahan_id,
            'harga' => $request->harga,
            'gambar' => $gambar,
        ]);

        return redirect()->route('pricelist.index');
    }

    public function edit($id)
    {
        $pricelist = Pricelists::findOrFail($id);
        $kategori = KategoriBahan::all();

        return view('pricelist.pricelist_edit', compact('pricelist', 'kategori'));
    }

    public function update(Request $request, $id)
    {
        $pricelist = Pricelists::findOrFail($id);

        $pricelist->update($request->all());

        return redirect()->route('pricelist.index');
    }

    public function destroy($id)
    {
        Pricelists::destroy($id);
        return redirect()->route('pricelist.index');
    }
}
