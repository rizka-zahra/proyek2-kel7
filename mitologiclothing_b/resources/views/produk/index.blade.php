<x-app-layout>
    <x-slot name="header">Produk</x-slot>

    <a href="{{ route('admin.produk.create') }}">+ Tambah Produk</a>

    @if(session('success'))
        <div>{{ session('success') }}</div>
    @endif

    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Produk</th>
                <th>Gambar</th>
                <th>Deskripsi</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @forelse($produk as $key => $item)
                <tr>
                    <td>{{ $key + 1 }}</td>
                    <td>{{ $item->nama_produk }}</td>
                    <td>
                        @if($item->gambar)
                            <img src="{{ asset('storage/' . $item->gambar) }}" width="60">
                        @else
                            Tidak ada gambar
                        @endif
                    </td>
                    <td>{{ $item->deskripsi ?? '-' }}</td>
                    <td>
                        <a href="{{ route('admin.produk.show', $item->id) }}">Detail</a>
                        <a href="{{ route('admin.produk.edit', $item->id) }}">Edit</a>
                        <form action="{{ route('admin.produk.destroy', $item->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button onclick="return confirm('Yakin hapus?')">Hapus</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="5">Belum ada produk.</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    {{ $produk->links() }}
</x-app-layout>
