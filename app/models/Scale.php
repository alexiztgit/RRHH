<?php

class Scale extends Eloquent {

	protected $table = 'scale';
	public $timestamps = false;

	public function review()
	{
		return $this->hasMany('Review');
	}

	public function administrative_history(){
		return $this->hasMany('AdministrativeHistory');
	}

	public function orchestra(){
		return $this->hasMany('Orchestra');
	}
}
