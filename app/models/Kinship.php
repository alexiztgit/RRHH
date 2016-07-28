<?php

class Kinship extends Eloquent {

	protected $table = 'kinship';
	public $timestamps = false;

	public function employees()
	{
		return $this->hasMany('Family');
	}

}
