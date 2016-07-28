<?php

class Grouping extends Eloquent {

	protected $table = 'grouping';
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
