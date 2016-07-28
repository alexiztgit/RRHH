<?php
use Illuminate\Database\Eloquent\SoftDeletingTrait;

class Course extends Eloquent {

	protected $table = 'course';
	public $timestamps = true;

	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

    public function work_files()
    {
        return $this->belongsToMany('WorkFile', 'work_file_education');
    }    

}