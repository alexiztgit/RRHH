<?php

class EmployeeStatus extends Eloquent {

	protected $table = 'employee_status';
	protected $primaryKey = 'employee_id';
	public $timestamps = true;

	public function status(){
		return $this->belongsTo('Status', 'status_id');
	}

	public function user(){
		return $this->belongsTo('User', 'user_id');
	}

}