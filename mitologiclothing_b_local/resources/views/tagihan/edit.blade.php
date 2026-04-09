<x-app-layout>
    <x-slot name="header">
        Edit Tagihan
    </x-slot>

    <form action="{{ route('admin.tagihan.update', $tagihan->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div>
            <label>Status Pembayaran</label>
            <select name="status_pembayaran" required>
                <option value="belum_bayar" {{ $tagihan->status_pembayaran == 'belum_bayar' ? 'selected' : '' }}>Belum Bayar</option>
                <option value="menunggu_verifikasi" {{ $tagihan->status_pembayaran == 'menunggu_verifikasi' ? 'selected' : '' }}>Menunggu Verifikasi</option>
                <option value="lunas" {{ $tagihan->status_pembayaran == 'lunas' ? 'selected' : '' }}>Lunas</option>
            </select>
        </div>

        <button type="submit">Update</button>
    </form>
</x-app-layout>
