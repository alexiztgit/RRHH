<?php

class Status extends Eloquent {

	protected $table = 'status';
	public $timestamps = true;

	public function employeeStatuses()
	{
		return $this->belongsToMany('EmployeeStatus', 'status_id');
	}

}