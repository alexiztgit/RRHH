<?php

class MedicalData extends Eloquent {

	protected $table = 'medical_data';
	public $timestamps = true;

	public function disability()
	{
		return $this->hasMany('Disability');
	}

	public function art()
    {
        return $this->belongsTo('Art', 'art_id');
    }

    public function prepaid()
    {
        return $this->belongsTo('Prepaid', 'prepaid_id');
    }

    public function medicaSocial()
    {
        return $this->belongsTo('MedicalSocial', 'medical_social_id');
    }
}