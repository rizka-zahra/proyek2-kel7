@extends('layouts.app')

@section('content')
<div style="padding:40px;">
    <h2>Edit Produk Pricelist</h2>

    <form action="{{ route('pricelist.update', $pricelist->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')

        <div>
            <label>Kategori Bahan</label><br>
            <select name="kategori_bahan_id" required>

                @foreach($kategori as $k)
                <option value="{{ $k->id }}"
                    {{ $pricelist->kategori_bahan_id == $k->id ? 'selected' : '' }}>
                    {{ $k->nama_kategori }}
                </option>
                @endforeach

            </select>
        </div>

        <div>
            <label>Harga</label><br>
            <input type="number" name="harga" value="{{ $pricelist->harga }}" required>
        </div>

        <div>
            <label>Gambar Baru</label><br>
            <input type="file" name="gambar">
        </div>

        <button type="submit">Update</button>
    </form>
</div>
@endsection