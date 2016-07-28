<?php

class CapacitationCredit extends \Eloquent {
	protected $fillable = [];
	protected $table = 'capacitation_credit';
	public $timestamps = false;

	public function workFile(){
		return $this->belongsToMany('workFile', 'work_file_id');
	}
}