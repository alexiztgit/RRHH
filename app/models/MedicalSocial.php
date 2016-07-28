<?php

class MedicalSocial extends Eloquent {
	protected $table = 'medical_social';

	public function medicalData()
	{
		return $this->hasMany('MedicalData');
	}
}