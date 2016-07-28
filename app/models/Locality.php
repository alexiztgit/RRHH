<?php

class Locality extends Eloquent {

	protected $table = 'locality';
	public $timestamps = true;

	public function adresses()
	{
		return $this->hasMany('Adress', 'locality_id');
	}

}