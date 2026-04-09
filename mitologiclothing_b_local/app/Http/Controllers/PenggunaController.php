<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pengguna;

class PenggunaController extends Controller
{
    public function index()
    {
        $data = Pengguna::all();
        return response()->json($data);
    }

    public function store(Request $request)
    {
        $request->validate([
            'no_telephon' => 'required'
        ]);

        $pengguna = Pengguna::create([
            'no_telephon' => $request->no_telephon
        ]);

        return response()->json($pengguna);
    }

    public function show($id)
    {
        $pengguna = Pengguna::findOrFail($id);
        return response()->json($pengguna);
    }

    public function update(Request $request, $id)
    {
        $pengguna = Pengguna::findOrFail($id);

        $pengguna->update([
            'no_telephon' => $request->no_telephon
        ]);

        return response()->json($pengguna);
    }

    public function destroy($id)
    {
        $pengguna = Pengguna::findOrFail($id);
        $pengguna->delete();

        return response()->json(['message' => 'Data berhasil dihapus']);
    }
}
