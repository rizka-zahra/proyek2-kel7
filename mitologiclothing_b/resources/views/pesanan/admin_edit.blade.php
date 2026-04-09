<x-app-layout>
    <x-slot name="header">
        Ubah Status Pesanan
    </x-slot>

    <p><strong>Nama:</strong> {{ $pesanan->nama_pemesan }}</p>
    <p><strong>No HP:</strong> {{ $pesanan->no_telephone }}</p>
    <p><strong>Total:</strong> Rp {{ number_format($pesanan->total_pembayaran) }}</p>

    <form action="{{ route('admin.pesanan.update', $pesanan->id) }}" method="POST">
        @csrf
        @method('PUT')

        <label>Status</label>
        <select name="status_order">
            <option value="menunggu" {{ $pesanan->status_order == 'menunggu' ? 'selected' : '' }}>Menunggu</option>
            <option value="diproses" {{ $pesanan->status_order == 'diproses' ? 'selected' : '' }}>Diproses</option>
            <option value="selesai" {{ $pesanan->status_order == 'selesai' ? 'selected' : '' }}>Selesai</option>
            <option value="dibatalkan" {{ $pesanan->status_order == 'dibatalkan' ? 'selected' : '' }}>Dibatalkan</option>
        </select>

        <br><br>
        <button type="submit">Update Status</button>
    </form>
</x-app-layout>
