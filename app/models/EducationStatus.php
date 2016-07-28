<?php

class EducationStatus extends Eloquent {

	protected $table = 'education_status';

	public $timestamps = false;

	public function educations()
	 {
	 	return $this->hasMany('Education');
	 }

}
