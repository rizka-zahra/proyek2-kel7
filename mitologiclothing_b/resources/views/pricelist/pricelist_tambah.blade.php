<x-app-layout>
    <x-slot name="header">
        Pricelist
    </x-slot>
<link rel="stylesheet" href="{{ asset('css/pricelist/pricelist_tambah.css') }}">

<div class="pricelist-form-page">
    <div class="pricelist-form-header">
        <a href="{{ route('pricelist.index') }}" class="back-btn" aria-label="Kembali">
            <svg viewBox="0 0 24 24" class="back-icon">
                <path d="M15 18l-6-6 6-6" />
            </svg>
        </a>

        <div>
            <h1 class="form-title">Tambah Produk Pricelist</h1>
            <p class="form-subtitle">Tambahkan kategori bahan dan harga baru ke daftar pricelist</p>
        </div>
    </div>

    <div class="pricelist-form-card">
        <form action="{{ route('pricelist.simpan') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="form-group">
                <label for="kategori_bahan_id">Kategori Bahan <span>*</span></label>
                <select name="kategori_bahan_id" id="kategori_bahan_id" class="form-control" required>
                    <option value="">Pilih kategori bahan</option>
                    @foreach($kategori as $k)
                        <option value="{{ $k->id }}" {{ old('kategori_bahan_id') == $k->id ? 'selected' : '' }}>
                            {{ $k->nama_kategori }}
                        </option>
                    @endforeach
                </select>
                @error('kategori_bahan_id')
                    <small class="text-error">{{ $message }}</small>
                @enderror
            </div>

            <div class="form-group">
                <label for="harga">Harga <span>*</span></label>
                <input
                    type="number"
                    name="harga"
                    id="harga"
                    class="form-control"
                    placeholder="Masukkan harga"
                    value="{{ old('harga') }}"
                    required
                >
                @error('harga')
                    <small class="text-error">{{ $message }}</small>
                @enderror
            </div>

            <div class="form-group">
                <label for="gambar">Gambar <span>*</span></label>
                <input
                    type="file"
                    name="gambar"
                    id="gambar"
                    class="form-control form-file"
                    accept=".jpg,.jpeg,.png"
                    required
                >
                @error('gambar')
                    <small class="text-error">{{ $message }}</small>
                @enderror
            </div>

            <div class="form-actions">
                <a href="{{ route('pricelist.index') }}" class="btn-cancel">Batal</a>
                <button type="submit" class="btn-submit">
                    <svg viewBox="0 0 24 24" class="save-icon">
                        <path d="M5 21h14a2 2 0 0 0 2-2V7.5L16.5 3H5a2 2 0 0 0-2 2V19a2 2 0 0 0 2 2Z" />
                        <path d="M17 21v-8H7v8" />
                        <path d="M7 3v5h8" />
                    </svg>
                    Simpan Pricelist
                </button>
            </div>
        </form>
    </div>
</div>
</x-app-layout>