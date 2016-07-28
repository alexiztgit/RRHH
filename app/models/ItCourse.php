<?php
use Illuminate\Database\Eloquent\SoftDeletingTrait;

class ItCourse extends Eloquent {

	protected $table = 'it_course';
	public $timestamps = true;

	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

    public function work_files()
    {
        return $this->belongsToMany('WorkFile', 'work_file_it_course');
    }    

    public function level()
    {
        return $this->belongsTo('ItLevel', 'it_level_id');
    }

    public function area()
    {
        return $this->belongsTo('ItArea', 'it_area_id');
    }

}