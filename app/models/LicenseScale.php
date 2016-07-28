<?php

class LicenseScale extends \Eloquent {
	protected $fillable = [];
	protected $table = 'license_scale';

	public function license(){
		return $this->hasMany('license'); 
	}
}