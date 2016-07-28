<?php

class Seizure extends \Eloquent {
	protected $fillable = [];
	protected $table = 'seizure';
	public $timestamps = true;

	public function workFile(){
		return $this->belongsToMany('workFile', 'work_file_id');
	}

}