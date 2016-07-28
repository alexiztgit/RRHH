<?php

class Office extends Eloquent {

	protected $table = 'office';

	public $timestamps = false;

	public function building()
	{
		return $this->belongsTo('Building', 'building_id');
	}

	public function files()
	{
		return $this->hasMany('WorkFile	');
	}

}
