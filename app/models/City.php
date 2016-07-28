<?php

class City extends Eloquent {

	protected $table = 'city';

	public function country()
	{
		return $this->belongsTo('Country', 'country_id');
	}

	public function employees()
	{
		return $this->hasMany('Employee');
	}

}
