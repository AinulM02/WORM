<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class scedule extends Model
{
    use HasFactory;

    protected $fillable = ['nama_kegiatan', 'detail_kegiatan','tanggal', 'jam','tempat'];
}
