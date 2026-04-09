<x-app-layout>
    <x-slot name="header">
        Tambah Detail Produk
    </x-slot>

    <form action="{{ route('admin.detail-produk.store') }}" method="POST">
        @csrf

        <div>
            <label>Produk</label>
            <select name="produk_id" required>
                <option value="">Pilih Produk</option>
                @foreach($produk as $item)
                    <option value="{{ $item->id }}">{{ $item->nama_produk }}</option>
                @endforeach
            </select>
        </div>

        <div>
            <label>Bahan</label>
            <input type="text" name="bahan" required>
        </div>

        <div>
            <label>Warna</label>
            <input type="text" name="warna" required>
        </div>

        <div>
            <label>Ukuran</label>
            <input type="text" name="ukuran" required>
        </div>

        <div>
            <label>Harga</label>
            <input type="number" name="harga" required>
        </div>

        <button type="submit">Simpan</button>
    </form>
</x-app-layout>
