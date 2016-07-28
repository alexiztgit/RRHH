<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class WorkFileItCourse extends Eloquent {

	protected $table = 'work_file_it_course';
	public $timestamps = true;
	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

	public function course()
    {
        return $this->belongsTo('ItCourse', 'it_course_id');
    }

}