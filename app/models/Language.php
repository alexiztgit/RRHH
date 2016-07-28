<?php

class Language extends Eloquent {

	protected $table = 'language';

	public $timestamps = false;

	// public function contactTypes()
	// {
	// 	return $this->hasMany('ContactType');
	// }
	public function workFile(){
		return $this->belongsToMany('WorkFile', 'work_file_language');
	}

}
