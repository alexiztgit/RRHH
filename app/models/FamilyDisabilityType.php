<?php

class FamilyDisabilityType extends Eloquent {

	protected $table = 'family_disability_type';
	public $timestamps = false;

	public function disability()
    {
        return $this->belongsTo('Disability', 'disability_id');
    }

}