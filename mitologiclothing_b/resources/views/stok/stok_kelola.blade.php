<!-- resources/views/stok/stok_kelola.blade.php -->
@extends('layouts.app')

@section('content')
<div style="padding:40px;">

    <div style="display:flex; justify-content:space-between; margin-bottom:20px;">
        <h2>Kelola Stok</h2>

        <a href="{{ route('stok.tambah') }}"
           style="background:#2E5BFF; color:white; padding:8px 16px; border-radius:8px; text-decoration:none;">
           + Tambah Stok
        </a>
    </div>

    <div style="background:white; padding:20px; border-radius:12px;">
        <table style="width:100%; border-collapse:collapse;">
            <thead>
                <tr style="border-bottom:1px solid #ddd;">
                    <th>No</th>
                    <th>Kategori Bahan</th>
                    <th>Detail Bahan</th>
                    <th>Jumlah Stok</th>
                    <th>Gambar</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @forelse($stok as $key => $item)
                <tr style="border-bottom:1px solid #eee;">
                    <td>{{ $key+1 }}</td>
                    <td>{{ $item->kategori->nama_kategori ?? '-' }}</td>
                    <td>{{ $item->detail_bahan }}</td>
                    <td>{{ $item->stok }}</td>
                    <td>
                        @if($item->gambar)
                            <img src="{{ asset('storage/'.$item->gambar) }}" width="60">
                        @endif
                    </td>
                    <td>
                        <a href="{{ route('stok.edit',$item->id_stok) }}">Edit</a>

                        <form action="{{ route('stok.hapus',$item->id_stok) }}"
                              method="POST"
                              style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit"
                                onclick="return confirm('Yakin hapus?')">
                                Hapus
                            </button>
                        </form>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="6">Belum ada data stok</td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>

</div>
@endsection