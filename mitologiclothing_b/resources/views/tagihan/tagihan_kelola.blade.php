<x-app-layout>
    <x-slot name="header">
        Daftar Tagihan
    </x-slot>

    @if(session('success'))
        <div>{{ session('success') }}</div>
    @endif

    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Pesanan ID</th>
                <th>Nama Pemesan</th>
                <th>Total Harga</th>
                <th>Status Pembayaran</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @forelse($tagihan as $key => $item)
                <tr>
                    <td>{{ $key + 1 }}</td>
                    <td>{{ $item->pesanan_id }}</td>
                    <td>{{ $item->nama_pemesan }}</td>
                    <td>Rp {{ number_format($item->total_harga, 0, ',', '.') }}</td>
                    <td>{{ ucfirst(str_replace('_', ' ', $item->status_pembayaran)) }}</td>
                    <td>
                        <a href="{{ route('admin.tagihan.show', $item->id) }}">Detail</a>
                        <a href="{{ route('admin.tagihan.edit', $item->id) }}">Edit</a>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="6">Belum ada tagihan.</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    {{ $tagihan->links() }}
</x-app-layout>
