<?php

namespace App\Http\Controllers;

use App\Models\jadwal;
use Illuminate\Http\Request;

class JadwalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $jadwal = jadwal::get();
        return response()->json(['data' => $jadwal]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $attribut = $request->validate([
            'nama_kegiatan'=>['required'],
            'detail_kegiatan'=>['required'],
            'tanggal'=>['required'],
            'jam'=>['required'],
            'tempat'=>['required'],
        ]);

        $coba = jadwal::create($attribut);
        return response()->json(['data'=>$coba]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\jadwal  $jadwal
     * @return \Illuminate\Http\Response
     */
    public function show(jadwal $jadwal)
    {
        return response()->json(['data'=>$jadwal]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\jadwal  $jadwal
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, jadwal $jadwal)
    {
        $attribut = $request->validate([
            'nama_kegiatan'=>['required'],
            'detail_kegiatan'=>['required'],
            'tanggal'=>['required'],
            'jam'=>['required'],
            'tempat'=>['required'],
        ]);

            $jadwal->update($attribut);
            return response()->json(['data'=> $jadwal]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\jadwal  $jadwal
     * @return \Illuminate\Http\Response
     */
    public function destroy(jadwal $jadwal)
    {
        $jadwal ->delete();
        return response()->json(['mesage'=>'Data Berhasil dihapus']);
    }
}
