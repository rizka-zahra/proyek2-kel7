@extends('layouts.app')

@section('content')
<div style="padding:40px;">
    <h2>Edit Tagihan</h2>

    <form action="{{ route('tagihan.update', $tagihan->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div>
            <label>Detail Pesanan</label><br>
            <textarea name="detail_pesanan" required>{{ $tagihan->detail_pesanan }}</textarea>
        </div>

        <div>
            <label>Jumlah Pesanan</label><br>
            <input type="number" name="jumlah_pesanan" value="{{ $tagihan->jumlah_pesanan }}" required>
        </div>

        <div>
            <label>Harga Satuan</label><br>
            <input type="number" name="harga" value="{{ $tagihan->harga }}" required>
        </div>

        <div>
            <label>Total Harga</label><br>
            <input type="number" name="total_harga" value="{{ $tagihan->total_harga }}" required>
        </div>

        <button type="submit">Update</button>
    </form>
</div>
@endsection