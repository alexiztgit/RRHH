<?php

class ReviewSituation extends \Eloquent {	
	protected $table = 'review_situation';
	protected $fillable = [];
	public $timestamps = true;

	public function public_service(){
		return $this->hasMany('PublicService');
	}
}