<?php

class EducationLevel extends Eloquent {

	protected $table = 'education_level';

	public $timestamps = false;

	public function educations()
	{
	 	return $this->hasMany('Education');
	}
	 
	public function additionalsKnowledge(){
		return $this->hasMany('WorkFileAdditionalKnowledge');
	}

}
