<?php

class Split extends Eloquent {

	protected $table = 'split';
	public $timestamps = true;

	public function adresses()
	{
		return $this->hasMany('Adress', 'split_id');
	}

}