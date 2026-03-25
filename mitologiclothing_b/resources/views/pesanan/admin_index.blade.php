<x-app-layout>
    <x-slot name="header">
        Pesanan
    </x-slot>
<link rel="stylesheet" href="{{ asset('css/pesanan/pesanan_index.css') }}">

<div class="pesanan-page">
    <div class="pesanan-header">
        <div>
            <h1 class="pesanan-title">Kelola Pesanan</h1>
            <p class="pesanan-subtitle">Pantau status pesanan, tagihan, dan data pelanggan</p>
        </div>
    </div>

    @if(session('success'))
        <div class="alert-success">
            {{ session('success') }}
        </div>
    @endif

    <div class="pesanan-card">
        <div class="pesanan-table-wrap">
            <table class="pesanan-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>No Telephone</th>
                        <th>Jumlah</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Tagihan</th>
                        <th class="th-aksi">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($pesanan as $item)
                        <tr>
                            <td>
                                <div class="pesanan-no">
                                    {{ $loop->iteration + ($pesanan->firstItem() - 1) }}
                                </div>
                            </td>

                            <td>
                                <div class="pesanan-phone">
                                    {{ $item->pembeli->no_telephone ?? '-' }}
                                </div>
                            </td>

                            <td>
                                <div class="pesanan-jumlah">
                                    {{ $item->jumlah }}
                                </div>
                            </td>

                            <td>
                                <div class="pesanan-total">
                                    Rp {{ number_format($item->total_pembayaran, 0, ',', '.') }}
                                </div>
                            </td>

                            <td>
                                <span class="status-badge status-{{ $item->status_order }}">
                                    {{ ucfirst($item->status_order) }}
                                </span>
                            </td>

                            <td>
                                @if($item->tagihan)
                                    <span class="tagihan-badge tagihan-yes">Sudah masuk</span>
                                @else
                                    <span class="tagihan-badge tagihan-no">Belum masuk</span>
                                @endif
                            </td>

                            <td>
                                <div class="pesanan-actions">
                                    <a href="{{ route('admin.pesanan.show', $item->id) }}" class="aksi-btn detail-btn" title="Detail">
                                        <svg viewBox="0 0 24 24" class="icon">
                                            <path d="M2 12s3.5-6 10-6 10 6 10 6-3.5 6-10 6-10-6-10-6Z"></path>
                                            <circle cx="12" cy="12" r="2.5"></circle>
                                        </svg>
                                    </a>

                                    <a href="{{ route('admin.pesanan.edit', $item->id) }}" class="aksi-btn edit-btn" title="Edit">
                                        <svg viewBox="0 0 24 24" class="icon">
                                            <path d="M3 17.25V21h3.75L17.8 9.94l-3.75-3.75L3 17.25Z"></path>
                                            <path d="M14.06 4.94l3.75 3.75"></path>
                                        </svg>
                                    </a>

                                    <form action="{{ route('admin.pesanan.destroy', $item->id) }}" method="POST" class="form-hapus">
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
                            <td colspan="7">
                                <div class="pesanan-empty">
                                    Belum ada data pesanan.
                                </div>
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>

        <div class="pagination-wrap">
            {{ $pesanan->links() }}
        </div>
    </div>
</div>
</x-app-layout>