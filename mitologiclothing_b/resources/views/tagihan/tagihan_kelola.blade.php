@extends('layouts.app')

@section('content')
<div style="padding:40px;">

    <div style="display:flex; justify-content:space-between; margin-bottom:20px;">
        <h2>Kelola Tagihan</h2>
        <a href="{{ route('tagihan.tambah') }}"
           style="background:#2E5BFF; color:white; padding:8px 16px; border-radius:8px; text-decoration:none;">
           + Tambah Tagihan
        </a>
    </div>

    <div style="background:white; padding:20px; border-radius:12px;">
        <table style="width:100%; border-collapse:collapse;">
            <thead>
                <tr style="border-bottom:1px solid #ddd;">
                    <th>No</th>
                    <th>Detail Pesanan</th>
                    <th>Jumlah</th>
                    <th>Total Harga</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @foreach($tagihan as $key => $item)
                <tr style="border-bottom:1px solid #eee;">
                    <td>{{ $key+1 }}</td>
                    <td>{{ $item->detail_pesanan }}</td>
                    <td>{{ $item->jumlah_pesanan }}</td>
                    <td>{{ $item->total_harga }}</td>
                    <td>
                        <a href="{{ route('tagihan.edit', $item->id) }}">Edit</a>
                        <form action="{{ route('tagihan.hapus', $item->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" onclick="return confirm('Yakin hapus?')">Hapus</button>
                        </form>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>

</div>
@endsection