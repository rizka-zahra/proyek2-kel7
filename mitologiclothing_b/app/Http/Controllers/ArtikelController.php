<?php

namespace App\Http\Controllers;

use App\Models\Artikel;
use App\Models\KategoriArtikel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ArtikelController extends Controller
{
    public function kelola()
    {
        $artikel = Artikel::with('kategori')->get();
        return view('artikel.artikel_kelola', compact('artikel'));
    }

    public function tambah()
    {
        $kategori = KategoriArtikel::all();
        return view('artikel.artikel_tambah', compact('kategori'));
    }

    public function simpan(Request $request)
    {
        $request->validate([
            'kategori_id' => 'required',
            'judul' => 'required',
            'isi' => 'required',
            'gambar' => 'nullable|image|mimes:jpg,jpeg,png|max:2048'
        ]);

        $data = $request->all();

        if ($request->hasFile('gambar')) {
            $file = $request->file('gambar');
            $namaFile = time() . '_' . $file->getClientOriginalName();
            $file->storeAs('public/artikel', $namaFile);
            $data['gambar'] = $namaFile;
        }

        Artikel::create($data);

        return redirect()->route('artikel.kelola');
    }

    public function edit($id)
    {
        $artikel = Artikel::findOrFail($id);
        $kategori = KategoriArtikel::all();
        return view('artikel.artikel_edit', compact('artikel', 'kategori'));
    }

    public function update(Request $request, $id)
    {
        $artikel = Artikel::findOrFail($id);

        $request->validate([
            'kategori_id' => 'required',
            'judul' => 'required',
            'isi' => 'required',
            'gambar' => 'nullable|image|mimes:jpg,jpeg,png|max:2048'
        ]);

        $data = $request->all();

        if ($request->hasFile('gambar')) {

            if ($artikel->gambar) {
                Storage::delete('public/artikel/' . $artikel->gambar);
            }

            $file = $request->file('gambar');
            $namaFile = time() . '_' . $file->getClientOriginalName();
            $file->storeAs('public/artikel', $namaFile);
            $data['gambar'] = $namaFile;
        }

        $artikel->update($data);

        return redirect()->route('artikel.kelola');
    }

    public function hapus($id)
    {
        $artikel = Artikel::findOrFail($id);

        if ($artikel->gambar) {
            Storage::delete('public/artikel/' . $artikel->gambar);
        }

        $artikel->delete();

        return redirect()->route('artikel.kelola');
    }
}
