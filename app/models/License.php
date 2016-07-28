<?php

class License extends \Eloquent {
	protected $fillable = [];
	protected $table = "license";
	public $timestamps = true;
	
	public function licenseAbsent(){
		return $this->hasMany('LicenseAbsent');
	}
	
	public function licenseExam(){
		return $this->hasMany('LicenseExam');
	}
	
	public function licenseMedical(){
		return $this->hasMany('LicenseMedical');
	}
	
	public function licenseMedicalFamily(){
		return $this->hasMany('LicenseMedicalFamily');
	}
	
	public function workFile(){
		return $this->belongsTo('WorkFile', 'work_file_id');
	}

	public function licenseScale(){
		return $this->belongsTo('LicenseScale', 'license_scale_id');
	}
}