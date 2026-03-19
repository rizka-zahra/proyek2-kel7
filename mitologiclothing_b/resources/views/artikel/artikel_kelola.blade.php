@extends('layouts.app')

@section('content')
<div style="padding:40px;">

    <div style="display:flex; justify-content:space-between; margin-bottom:20px;">
        <h2>Kelola Artikel</h2>

        <a href="{{ route('artikel.tambah') }}"
           style="background:#2E5BFF; color:white; padding:8px 16px; border-radius:8px; text-decoration:none;">
           + Tambah Artikel
        </a>
    </div>

    <div style="background:white; padding:20px; border-radius:12px;">
        <table style="width:100%; border-collapse:collapse;">
            <thead>
                <tr style="border-bottom:1px solid #ddd;">
                    <th>No</th>
                    <th>Gambar</th>
                    <th>Kategori</th>
                    <th>Judul</th>
                    <th>Tanggal</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @forelse($artikel as $key => $item)
                <tr style="border-bottom:1px solid #eee;">
                    <td>{{ $key+1 }}</td>

                    <td>
                        @if($item->gambar)
                            <img src="{{ asset('storage/artikel/'.$item->gambar) }}" 
                                 width="80">
                        @else
                            -
                        @endif
                    </td>

                    <td>{{ $item->kategori->nama_kategori ?? '-' }}</td>
                    <td>{{ $item->judul }}</td>
                    <td>{{ $item->tanggal_publish }}</td>

                    <td>
                        <a href="{{ route('artikel.edit',$item->id) }}">Edit</a>

                        <form action="{{ route('artikel.hapus',$item->id) }}"
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
                    <td colspan="6" style="text-align:center;">
                        Belum ada artikel
                    </td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>

</div>
@endsection