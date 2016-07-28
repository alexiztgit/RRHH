<?php

class LicenseExam extends \Eloquent {
	protected $fillable = [];
	protected $table = "license_exam";
	public $timestamps = false;
	
	public function license(){
		return $this->belongsTo('License', 'license_id');
	}
}