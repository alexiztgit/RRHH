<?php

class WorkFileAdditionalKnowledge extends \Eloquent {
	protected $fillable = [];
	
	protected $table = "work_file_additional_knowledge";
	
	public function workFile(){
		return $this->belongsTo('WorkFile', 'work_file_id');
	}
	
	public function educationLevel(){
		return $this->belongsTo('EducationLevel', 'education_level_id');
	}
}