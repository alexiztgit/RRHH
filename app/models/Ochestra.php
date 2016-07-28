<?php

class Ochestra extends \Eloquent {
	protected $fillable = [];
	protected $table = 'ochestra';
	public $timestamps = true;

	public function workFile(){
		return $this->belongsToMany('workFile', 'work_file_id');
	}

	public function administrativeAct(){
		return $this->belongsTo('AdministrativeAct', 'administrative_act_id');
	}

	public function scale(){
		return $this->belongsTo('Scale', 'scale_id');
	}

	public function grouping(){
		return $this->belongsTo('Grouping', 'grouping_id');
	}

	public function category(){
		return $this->belongsTo('Category', 'category_id');
	}
	
	public function stretch(){
		return $this->belongsTo('Stretch', 'stretch_id');
	}
}