<?php

class MentionsCongrats extends \Eloquent {
	protected $fillable = [];
	protected $table = 'mentions_congrats';
	public $timestamps = false;

	public function workFile(){
		return $this->belongsToMany('workFile', 'work_file_id');
	}

	public function administrativeAct(){
		return $this->belongsTo('AdministrativeAct', 'administrative_act_id');
	}
}