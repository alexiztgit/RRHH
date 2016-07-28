<?php

class Prepaid extends \Eloquent {
	protected $table = 'prepaid';

	public function medicalData()
	{
		return $this->hasMany('MedicalData');
	}
}