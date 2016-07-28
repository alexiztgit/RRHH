<?php

class Art extends \Eloquent {
	protected $table = 'art';

	public function medicalData()
	{
		return $this->hasMany('MedicalData');
	}
}