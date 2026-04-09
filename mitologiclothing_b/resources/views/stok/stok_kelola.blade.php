<x-app-layout>
    <x-slot name="header">
        Stok
    </x-slot>
<link rel="stylesheet" href="{{ asset('css/stok/stok_kelola.css') }}">

<div class="stok-page">
    <div class="stok-header">
        <div>
            <h1 class="stok-title">Manajemen Stok Bahan</h1>
            <p class="stok-subtitle">Pantau ketersediaan kain, tinta, dan aksesoris produksi</p>
        </div>

        <div class="stok-header-actions">
            <button type="button" class="btn-filter">
                <svg viewBox="0 0 24 24" class="btn-icon">
                    <path d="M4 6h16l-6 7v5l-4-2v-3L4 6z"></path>
                </svg>
                Filter Kategori
            </button>

            <a href="{{ route('stok.tambah') }}" class="btn-tambah-stok">
                <span class="plus-icon">+</span>
                Tambah Stok Baru
            </a>
        </div>
    </div>

    <div class="stok-card">
        <div class="stok-toolbar">
            <div class="stok-search">
                <svg viewBox="0 0 24 24" class="search-icon">
                    <circle cx="11" cy="11" r="7"></circle>
                    <path d="M20 20l-3.5-3.5"></path>
                </svg>
                <input type="text" placeholder="Cari ID Stok, Nama Bahan, atau Kategori...">
            </div>

            <div class="stok-total">
                <svg viewBox="0 0 24 24" class="total-icon">
                    <path d="M12 4l7 4-7 4-7-4 7-4z"></path>
                    <path d="M5 12l7 4 7-4"></path>
                    <path d="M5 16l7 4 7-4"></path>
                </svg>
                <span>Total Item: {{ $stok->count() }}</span>
            </div>
        </div>

        <div class="stok-table-wrap">
            <table class="stok-table">
                <thead>
                    <tr>
                        <th>ID & Gambar</th>
                        <th>Detail Bahan</th>
                        <th>Kategori</th>
                        <th>Jumlah Stok</th>
                        <th class="th-aksi">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($stok as $item)
                        <tr>
                            <td>
                                <div class="stok-id-cell">
                                    <div class="stok-thumb">
                                        @if($item->gambar)
                                            <img src="{{ asset('storage/' . $item->gambar) }}" alt="{{ $item->detail_bahan }}">
                                        @else
                                            <div class="stok-thumb-empty">No Image</div>
                                        @endif
                                    </div>

                                    <div class="stok-code-box">
                                        <div class="stok-code">
                                            STK-{{ str_pad($item->id_stok, 4, '0', STR_PAD_LEFT) }}
                                        </div>
                                        <div class="stok-cat-code">
                                            CAT-{{ str_pad($item->kategori_bahan_id ?? 0, 3, '0', STR_PAD_LEFT) }}
                                        </div>
                                    </div>
                                </div>
                            </td>

                            <td>
                                <div class="stok-detail">
                                    <h3>{{ $item->detail_bahan }}</h3>
                                    <p>
                                        <span class="detail-dot"></span>
                                        Ready for Production
                                    </p>
                                </div>
                            </td>

                            <td>
                                <span class="stok-badge">
                                    {{ $item->kategori->nama_kategori ?? 'Tanpa Kategori' }}
                                </span>
                            </td>

                            <td>
                                <div class="stok-qty {{ $item->stok <= 5 ? 'low-stock' : '' }}">
                                    <span class="qty-number">{{ $item->stok }}</span>
                                    <span class="qty-unit">PCS</span>
                                </div>

                                @if($item->stok <= 5)
                                    <div class="low-stock-text">Low Stock!</div>
                                @endif
                            </td>

                            <td>
                                <div class="stok-actions">
                                    <a href="{{ route('stok.edit', $item->id_stok) }}" class="aksi-btn edit-btn" title="Edit">
                                        <svg viewBox="0 0 24 24" class="icon">
                                            <path d="M3 17.25V21h3.75L17.8 9.94l-3.75-3.75L3 17.25Z"></path>
                                            <path d="M14.06 4.94l3.75 3.75"></path>
                                        </svg>
                                    </a>

                                    <form action="{{ route('stok.hapus', $item->id_stok) }}" method="POST" class="form-hapus">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="aksi-btn hapus-btn" onclick="return confirm('Yakin hapus?')" title="Hapus">
                                            <svg viewBox="0 0 24 24" class="icon">
                                                <path d="M4 7h16"></path>
                                                <path d="M10 11v6"></path>
                                                <path d="M14 11v6"></path>
                                                <path d="M6 7l1 13h10l1-13"></path>
                                                <path d="M9 7V4h6v3"></path>
                                            </svg>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="5">
                                <div class="stok-empty">
                                    Belum ada data stok.
                                </div>
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    @if($stok->where('stok', '<=', 5)->count() > 0)
        <div class="stok-warning">
            <div class="warning-icon-wrap">
                <svg viewBox="0 0 24 24" class="warning-icon">
                    <path d="M12 3l9 16H3l9-16z"></path>
                    <path d="M12 9v4"></path>
                    <path d="M12 17h.01"></path>
                </svg>
            </div>
            <div>
                <h4>Peringatan Stok Rendah</h4>
                <p>Beberapa bahan baku hampir habis. Segera lakukan pengadaan untuk menjaga kelancaran produksi.</p>
            </div>
        </div>
    @endif
</div>
</x-app-layout>