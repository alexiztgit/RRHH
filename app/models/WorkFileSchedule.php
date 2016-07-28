<?php
use Illuminate\Database\Eloquent\SoftDeletingTrait;

class WorkFileSchedule extends Eloquent {

	protected $table = 'work_file_schedule';
	public $timestamps = true;

	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

	public function schedules()
    {
        return $this->belongsTo('Schedule', 'schedule_id');
    }

    public function work_file()
    {
        return $this->belongsTo('WorkFile', 'work_file_id');
    }

}