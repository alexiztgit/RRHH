<?php

class Building extends Eloquent {

	protected $table = 'building';

	public $timestamps = false;

	public function offices()
	{
		return $this->hasMany('Office');
	}

}
