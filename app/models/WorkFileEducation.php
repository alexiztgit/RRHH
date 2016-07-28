<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class WorkFileEducation extends Eloquent {

	protected $table = 'work_file_education';
	public $timestamps = true;
	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

	public function education()
    {
        return $this->belongsTo('Education', 'education_id');
    }

}