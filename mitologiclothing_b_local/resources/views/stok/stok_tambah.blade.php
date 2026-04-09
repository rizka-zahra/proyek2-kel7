<x-app-layout>
    <x-slot name="header">
        Stok
    </x-slot>
<link rel="stylesheet" href="{{ asset('css/stok/stok_tambah.css') }}">

<div class="stok-form-page">
    <div class="stok-form-header">
        <a href="{{ route('stok.index') }}" class="back-btn" aria-label="Kembali">
            <svg viewBox="0 0 24 24" class="back-icon">
                <path d="M15 18l-6-6 6-6" />
            </svg>
        </a>

        <div>
            <h1 class="form-title">Tambah Stok Bahan</h1>
            <p class="form-subtitle">Tambahkan bahan baku baru untuk kebutuhan produksi</p>
        </div>
    </div>

    <div class="stok-form-card">
        <form action="{{ route('stok.simpan') }}" method="POST" enctype="multipart/form-data">
            @csrf

            <div class="form-group">
                <label for="kategori_bahan_id">Kategori Bahan <span>*</span></label>
                <select name="kategori_bahan_id" id="kategori_bahan_id" class="form-control">
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
                <label for="detail_bahan">Detail Bahan <span>*</span></label>
                <input
                    type="text"
                    name="detail_bahan"
                    id="detail_bahan"
                    class="form-control"
                    placeholder="Masukkan nama atau detail bahan"
                    value="{{ old('detail_bahan') }}"
                >
                @error('detail_bahan')
                    <small class="text-error">{{ $message }}</small>
                @enderror
            </div>

            <div class="form-grid">
                <div class="form-group">
                    <label for="stok">Jumlah Stok <span>*</span></label>
                    <input
                        type="number"
                        name="stok"
                        id="stok"
                        class="form-control"
                        placeholder="Masukkan jumlah stok"
                        value="{{ old('stok') }}"
                    >
                    @error('stok')
                        <small class="text-error">{{ $message }}</small>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="gambar">Gambar</label>
                    <input
                        type="file"
                        name="gambar"
                        id="gambar"
                        class="form-control form-file"
                        accept=".jpg,.jpeg,.png"
                    >
                    @error('gambar')
                        <small class="text-error">{{ $message }}</small>
                    @enderror
                </div>
            </div>

            <div class="form-actions">
                <a href="{{ route('stok.index') }}" class="btn-cancel">Batal</a>
                <button type="submit" class="btn-submit">
                    <svg viewBox="0 0 24 24" class="save-icon">
                        <path d="M5 21h14a2 2 0 0 0 2-2V7.5L16.5 3H5a2 2 0 0 0-2 2V19a2 2 0 0 0 2 2Z" />
                        <path d="M17 21v-8H7v8" />
                        <path d="M7 3v5h8" />
                    </svg>
                    Simpan Stok
                </button>
            </div>
        </form>
    </div>
</div>
</x-app-layout>