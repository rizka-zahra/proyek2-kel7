@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Data Pengguna Flutter</h2>

    @if(session('success'))
        <div style="padding:10px;background:#d4edda;margin-bottom:15px;">
            {{ session('success') }}
        </div>
    @endif

    @if(session('activation_url'))
        <div style="padding:10px;background:#fff3cd;margin-bottom:15px;">
            <div><strong>Link aktivasi:</strong></div>
            <div>
                <a href="{{ session('activation_url') }}" target="_blank">{{ session('activation_url') }}</a>
            </div>
            <div style="margin-top:10px;">
                <a href="{{ session('wa_link') }}" target="_blank">Kirim ke WhatsApp</a>
            </div>
        </div>
    @endif

    <table border="1" cellpadding="10" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nama</th>
                <th>No Telepon</th>
                <th>Status</th>
                <th>Keterangan</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @foreach($penggunas as $item)
                <tr>
                    <td>{{ $item->id }}</td>
                    <td>{{ $item->nama_lengkap }}</td>
                    <td>{{ $item->no_telephone }}</td>
                    <td>{{ $item->status_akses }}</td>
                    <td>{{ $item->keterangan }}</td>
                    <td>
                        @if($item->status_akses === 'pending')
                            <form action="{{ route('admin.pengguna.approve', $item->id) }}" method="POST" style="display:inline;">
                                @csrf
                                <button type="submit">Approve</button>
                            </form>

                            <form action="{{ route('admin.pengguna.reject', $item->id) }}" method="POST" style="display:inline;">
                                @csrf
                                <button type="submit">Reject</button>
                            </form>
                        @else
                            -
                        @endif
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection