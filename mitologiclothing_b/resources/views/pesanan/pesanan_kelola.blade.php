@extends('layouts.app')

@section('content')
<div style="padding:40px;">

    <div style="display:flex; justify-content:space-between; margin-bottom:20px;">
        <h2>Kelola Pesanan</h2>
        <a href="{{ route('pesanan.tambah') }}"
           style="background:#2E5BFF; color:white; padding:8px 16px; border-radius:8px; text-decoration:none;">
           + Tambah Pesanan
        </a>
    </div>

    <div style="background:white; padding:20px; border-radius:12px;">
        <table style="width:100%; border-collapse:collapse;">
            <thead>
                <tr style="border-bottom:1px solid #ddd;">
                    <th>No</th>
                    <th>Desain</th>
                    <th>Jumlah</th>
                    <th>Total Pembayaran</th>
                    <th>Status</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @forelse($pesanan as $key => $item)
                <tr style="border-bottom:1px solid #eee;">
                    <td>{{ $key+1 }}</td>
                    <td>{{ $item->desain }}</td>
                    <td>{{ $item->jumlah }}</td>
                    <td>{{ $item->total_pembayaran }}</td>
                    <td>{{ $item->status_order }}</td>
                    <td>
                        <a href="{{ route('pesanan.edit',$item->id) }}">Edit</a>
                        <form action="{{ route('pesanan.destroy', $item->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" onclick="return confirm('Yakin hapus?')">Hapus</button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="6">Belum ada pesanan</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>

</div>
@endsection