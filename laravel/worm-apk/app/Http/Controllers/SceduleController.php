<?php

namespace App\Http\Controllers;

use App\Models\scedule;
use Illuminate\Http\Request;

class SceduleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $scedule = scedule::get();
        return response()->json(['data' => $scedule]);
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

        $scedule = scedule::create($attribut);
        return response()->json(['data'=>$scedule]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\scedule  $scedule
     * @return \Illuminate\Http\Response
     */
    public function show(scedule $scedule)
    {
        return response()->json(['data'=>$scedule]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\scedule  $scedule
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, scedule $scedule)
    {
        $attribut = $request->validate([
            'nama_kegiatan'=>['required'],
            'detail_kegiatan'=>['required'],
            'tanggal'=>['required'],
            'jam'=>['required'],
            'tempat'=>['required'],
        ]);

            $scedule->update($attribut);
            return response()->json(['data'=>$scedule]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\scedule  $scedule
     * @return \Illuminate\Http\Response
     */
    public function destroy(scedule $scedule)
    {
        $scedule ->delete();
        return response()->json(['mesage'=>'Data Berhasil dihapus']);
    }
}
