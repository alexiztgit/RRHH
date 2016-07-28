<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class Adress extends Eloquent {

	protected $table = 'adress';
	public $timestamps = true;

	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

	public function locality()
	{
		return $this->belongsTo('Locality', 'locality_id');
	}

	public function split()
	{
		return $this->belongsTo('Split', 'split_id');
	}

	public function province()
	{
		return $this->belongsTo('Province', 'province_id');
	}

	public function employee()
	{
		return $this->belongsToMany('EmployeeAdress', 'address_id');
	}

}