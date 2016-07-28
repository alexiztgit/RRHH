<?php

class DisabilityType extends Eloquent {

	protected $table = 'disability_type';
	//public $timestamps = true;

	public function disability()
	{
		return $this->hasMany('Disability');
	}

	public function family()
	{
		return $this->belongsToMany('FamilyDisabilityType', 'disability_type_id');
	}

}