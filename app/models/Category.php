<?php

class Category extends Eloquent {

	protected $table = 'category';
	public $timestamps = false;

	public function review()
	{
		return $this->hasMany('Review');
	}

	public function orchestra(){
		return $this->hasMany('Orchestra');
	}
}
