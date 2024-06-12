<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProductCategory extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name'
    ];
    
    /**
     * The attributes that are mass assignable
     * 
     * @var array
     */

    // RELASI
    public function products()
    {
        return $this->hasMany(Product::class, 'categories_id','id');
    }
}
