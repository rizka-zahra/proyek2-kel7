<x-app-layout>
    <x-slot name="header">
        Detail Produk
    </x-slot>

    <a href="{{ route('admin.detail-produk.create') }}">+ Tambah Detail Produk</a>

    @if(session('success'))
        <div>{{ session('success') }}</div>
    @endif

    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Produk</th>
                <th>Bahan</th>
                <th>Warna</th>
                <th>Ukuran</th>
                <th>Harga</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @forelse($detailProduk as $key => $item)
                <tr>
                    <td>{{ $key + 1 }}</td>
                    <td>{{ $item->produk->nama_produk }}</td>
                    <td>{{ $item->bahan }}</td>
                    <td>{{ $item->warna }}</td>
                    <td>{{ $item->ukuran }}</td>
                    <td>Rp {{ number_format($item->harga, 0, ',', '.') }}</td>
                    <td>
                        <a href="{{ route('admin.detail-produk.edit', $item->id) }}">Edit</a>
                        <form action="{{ route('admin.detail-produk.destroy', $item->id) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" onclick="return confirm('Yakin hapus?')">Hapus</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="7">Belum ada detail produk.</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    {{ $detailProduk->links() }}
</x-app-layout>
