<?php

class PublicService extends \Eloquent {
	protected $table = 'public_service';

	public function workFile(){
		return $this->belongsTo('workFile', 'work_file_id');
	}
	
	public function administrativeAct(){
		return $this->belongsTo('AdministrativeAct', 'administrative_act_id');
	}
	
	public function review(){
		return $this->belongsTo('Review', 'review_id');
	}

	public function reviewSituation(){
		return $this->belongsTo('ReviewSituation', 'review_situation_id');
	}
}