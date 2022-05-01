<?php

namespace App\Http\Controllers;

use App\Models\payment_detail;
use Illuminate\Http\Request;

class PaymentDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $payment_detail = payment_detail::get();
        return response()->json(['data' => $payment_detail]);
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
            'bayar'=>['required'],
            'tanggal'=>['required'],
            'id_payment'=>['required'],
            'jam'=>['required'],
        ]);

        $payment_detail = payment_detail::create($attribut);
        return response()->json(['data'=>$payment_detail]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\payment_detail  $payment_detail
     * @return \Illuminate\Http\Response
     */
    public function show(payment_detail $payment_detail)
    {
        return response()->json(['data'=>$payment_detail]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\payment_detail  $payment_detail
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, payment_detail $payment_detail)
    {
        $attribut = $request->validate([
            'bayar'=>['required'],
            'tanggal'=>['required'],
            'id_payment'=>['required'],
            'jam'=>['required'],
        ]);

        $payment_detail->update($attribut);
        return response()->json(['data'=>$payment_detail]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\payment_detail  $payment_detail
     * @return \Illuminate\Http\Response
     */
    public function destroy(payment_detail $payment_detail)
    {
        $payment_detail ->delete();
        return response()->json(['mesage'=>'Data Berhasil dihapus']);
    }
}
