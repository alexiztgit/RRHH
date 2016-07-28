<?php

class WorkFileJobStatus extends Eloquent {

	protected $table = 'work_file_job_status';
	protected $primaryKey = 'work_file_job_status_id';
	
	public $timestamps = true;

	public function work_file()
    {
        return $this->belongsTo('WorkFile', 'work_file_id');
    }

}