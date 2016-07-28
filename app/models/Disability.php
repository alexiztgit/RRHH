<?php

class Disability extends Eloquent {
	protected $table = 'disability';
	public $timestamps = true;

	public function medicalData()
	{
		return $this->hasMany('MedicalData');
	}

	public function disabilityType() {
		return $this->belongsTo('DisabilityType', 'disability_type_id');
	}

}