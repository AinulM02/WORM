<?php

namespace App\Http\Controllers;

use App\Models\payment;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $payment = payment::get();
        return response()->json(['data' => $payment]);
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
            'nama_vendor'=>['required'],
            'tunai_keseluruhan'=>['required'],
            'tanggal'=>['required'],
            'tunai'=>['required'],
            'keterangan'=>['required'],
        ]);

        $payment = payment::create($attribut);
        return response()->json(['data'=>$payment]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function show(payment $payment)
    {
        return response()->json(['data'=>$payment]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, payment $payment)
    {
        $attribut = $request->validate([
            'nama_vendor'=>['required'],
            'tunai_keseluruhan'=>['required'],
            'tanggal'=>['required'],
            'tunai'=>['required'],
            'keterangan'=>['required'],
        ]);

            $payment->update($attribut);
            return response()->json(['data'=>$payment]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function destroy(payment $payment)
    {
        $payment ->delete();
        return response()->json(['mesage'=>'Data Berhasil dihapus']);
    }
}
