<?php

class ReviewRole extends Eloquent {

	protected $table = 'review_role';
	protected $primaryKey = 'id_review_role'; 
	public $timestamps = true;

	public function role()
    {
        return $this->belongsTo('Role', 'role_id');
    }

}