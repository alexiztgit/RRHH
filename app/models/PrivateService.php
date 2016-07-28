<?php

class PrivateService extends \Eloquent {
	protected $fillable = [];
	protected $table = 'private_service';
	public $timestamps = false;

	public function workFile(){
		return $this->belongsToMany('workFile', 'work_file_id');
	}
}