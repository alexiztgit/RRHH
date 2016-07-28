<?php

class Country extends Eloquent {

	protected $table = 'country';

	public function cities()
	{
		return $this->hasMany('City');
	}

}
