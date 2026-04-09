<x-app-layout>
    <x-slot name="header">
        Edit Detail Produk
    </x-slot>

    <form action="{{ route('admin.detail-produk.update', $detailProduk->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div>
            <label>Produk</label>
            <select name="produk_id" required>
                @foreach($produk as $item)
                    <option value="{{ $item->id }}"
                        {{ $item->id == $detailProduk->produk_id ? 'selected' : '' }}>
                        {{ $item->nama_produk }}
                    </option>
                @endforeach
            </select>
        </div>

        <div>
            <label>Bahan</label>
            <input type="text" name="bahan" value="{{ $detailProduk->bahan }}" required>
        </div>

        <div>
            <label>Warna</label>
            <input type="text" name="warna" value="{{ $detailProduk->warna }}" required>
        </div>

        <div>
            <label>Ukuran</label>
            <input type="text" name="ukuran" value="{{ $detailProduk->ukuran }}" required>
        </div>

        <div>
            <label>Harga</label>
            <input type="number" name="harga" value="{{ $detailProduk->harga }}" required>
        </div>

        <button type="submit">Update</button>
    </form>
</x-app-layout>
