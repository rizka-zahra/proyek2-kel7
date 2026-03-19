@extends('layouts.app')

@section('content')
<div style="padding:40px;">
    <h2>Tambah Produk Pricelist</h2>

    <form action="{{ route('pricelist.simpan') }}" method="POST" enctype="multipart/form-data">
        @csrf

        <div>
            <label>Kategori Bahan</label><br>
            <select name="kategori_bahan_id" required>

                @foreach($kategori as $k)
                <option value="{{ $k->id }}">
                    {{ $k->nama_kategori }}
                </option>
                @endforeach

            </select>
        </div>

        <div>
            <label>Harga</label><br>
            <input type="number" name="harga" required>
        </div>

        <div>
            <label>Gambar</label><br>
            <input type="file" name="gambar" required>
        </div>

        <button type="submit">Simpan</button>
    </form>
</div>
@endsection