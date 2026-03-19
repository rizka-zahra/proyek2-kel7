@extends('layouts.app')

@section('content')
<div style="padding:40px;">
    <h2>Tambah Tagihan</h2>

    <form action="{{ route('tagihan.simpan') }}" method="POST">
        @csrf

        <div>
            <label>Detail Pesanan</label><br>
            <textarea name="detail_pesanan" required></textarea>
        </div>

        <div>
            <label>Jumlah Pesanan</label><br>
            <input type="number" name="jumlah_pesanan" required>
        </div>

        <div>
            <label>Harga Satuan</label><br>
            <input type="number" name="harga" required>
        </div>

        <div>
            <label>Total Harga</label><br>
            <input type="number" name="total_harga" required>
        </div>

        <button type="submit">Simpan</button>
    </form>
</div>
@endsection