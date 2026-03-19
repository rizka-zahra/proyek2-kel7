@extends('layouts.app')

@section('content')
<div style="padding:40px;">
    <h2>Edit Pesanan</h2>

    <form action="{{ route('pesanan.update', $pesanan->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div>
            <label>Desain</label><br>
            <input type="text" name="desain" value="{{ $pesanan->desain }}" required>
        </div>

        <div>
            <label>Jumlah</label><br>
            <input type="number" name="jumlah" value="{{ $pesanan->jumlah }}" required>
        </div>

        <div>
            <label>Total Pembayaran</label><br>
            <input type="text" name="total_pembayaran" value="{{ $pesanan->total_pembayaran }}" required>
        </div>

        <div>
            <label>Status Pesanan</label><br>
            <input type="text" name="status_order" value="{{ $pesanan->status_order }}" required>
        </div>

        <div>
            <label>Pricelist</label><br>
            <select name="pricelist_id" required>
                @foreach($pricelists as $pricelist)
                    <option value="{{ $pricelist->id }}" {{ $pesanan->pricelist_id == $pricelist->id ? 'selected' : '' }}>
                        {{ $pricelist->kategori_bahan }} - {{ $pricelist->harga }}
                    </option>
                @endforeach
            </select>
        </div>

        <button type="submit">Update</button>
    </form>
</div>
@endsection