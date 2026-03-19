@extends('layouts.app')

@section('content')
<div style="padding:40px;">
    <h2>Tambah Pesanan</h2>

    <form action="{{ route('pesanan.simpan') }}" method="POST">
        @csrf

        <div>
            <label>Desain</label><br>
            <input type="text" name="desain" required>
        </div>

        <div>
            <label>Jumlah</label><br>
            <input type="number" name="jumlah" required>
        </div>

        <div>
            <label>Total Pembayaran</label><br>
            <input type="text" name="total_pembayaran" required>
        </div>

        <div>
            <label>Status Pesanan</label><br>
            <input type="text" name="status_order" required>
        </div>

        <div>
            <label>Pricelist</label><br>
            <select name="pricelists_id" required>
                @foreach($pricelists as $pricelist)
                    <option value="{{ $pricelist->id }}">{{ $pricelist->kategori_bahan }} - {{ $pricelist->harga }}</option>
                @endforeach
            </select>
        </div>

        <button type="submit">Simpan</button>
    </form>
</div>
@endsection