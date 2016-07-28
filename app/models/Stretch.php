<?php

class Stretch extends Eloquent {

	protected $table = 'stretch';
	public $timestamps = false;

	public function review()
	{
		return $this->hasMany('Review');
	}

	public function administrative_history(){
		return $this->hasMany('Stretch');
	}

}
