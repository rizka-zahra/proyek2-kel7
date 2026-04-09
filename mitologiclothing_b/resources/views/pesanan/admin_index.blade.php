<x-app-layout>
    <x-slot name="header">
        Daftar Pesanan
    </x-slot>

    @foreach($pesanan as $item)
        <div style="border:1px solid #ccc; margin-bottom:10px; padding:10px;">
            <p><strong>Nama:</strong> {{ $item->nama_pemesan }}</p>
            <p><strong>No HP:</strong> {{ $item->no_telephone }}</p>
            <p><strong>Total:</strong> Rp {{ number_format($item->total_pembayaran) }}</p>
            <p><strong>Status:</strong> {{ ucfirst($item->status_order) }}</p>

            <a href="{{ route('admin.pesanan.show', $item->id) }}">Detail</a>
            <a href="{{ route('admin.pesanan.edit', $item->id) }}">Ubah Status</a>
        </div>
    @endforeach

    {{ $pesanan->links() }}
</x-app-layout>
