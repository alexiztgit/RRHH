<?php

class Province extends Eloquent {

	protected $table = 'province';
	public $timestamps = true;

	public function adresses()
	{
		return $this->hasMany('Adress', 'province_id');
	}

}