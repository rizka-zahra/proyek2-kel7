<?php

namespace App\Http\Controllers;

use App\Models\KategoriBahan;

use App\Models\Stok;
use Illuminate\Http\Request;

class StokController extends Controller
{
    public function kelola()
    {
        $stok = Stok::all();
        return view('stok.stok_kelola', compact('stok'));
    }

    public function tambah()
    {
        $kategori = KategoriBahan::all();
        return view('stok.stok_tambah', compact('kategori'));
    }

    public function simpan(Request $request)
    {
        $request->validate([
            'detail_bahan' => 'required',
            'stok' => 'required|integer',
        ]);

        $data = $request->all();

        if ($request->hasFile('gambar')) {
            $data['gambar'] = $request->file('gambar')
                ->store('gambar_stok', 'public');
        }

        Stok::create($data);

        return redirect()->route('stok.kelola');
    }

    public function edit($id)
    {
        $stok = Stok::findOrFail($id);
        return view('stok.stok_edit', compact('stok'));
    }

    public function update(Request $request, $id)
    {
        $stok = Stok::findOrFail($id);

        $stok->update($request->all());

        return redirect()->route('stok.kelola');
    }

    public function hapus($id)
    {
        Stok::destroy($id);
        return redirect()->route('stok.kelola');
    }
}
