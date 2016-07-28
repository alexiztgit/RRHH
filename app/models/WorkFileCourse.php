<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class WorkFileCourse extends Eloquent {

	protected $table = 'work_file_course';
	public $timestamps = true;
	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

	public function course()
    {
        return $this->belongsTo('Course', 'course_id');
    }

}