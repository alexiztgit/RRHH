<?php

class PerformanceEvaluation extends \Eloquent {
	protected $fillable = [];
	protected $table = 'performance_evaluation';
	public $timestamps = false;

	public function workFile(){
		return $this->belongsToMany('workFile', 'work_file_id');
	}
}