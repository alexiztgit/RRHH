<?php

class Schedule extends Eloquent {

	protected $table = 'schedule';
	public $timestamps = false;

	public function work_file()
	{
		return $this->belongsToMany('work_file_schedule', 'schedule_id');
	}

}
