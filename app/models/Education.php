<?php
use Illuminate\Database\Eloquent\SoftDeletingTrait;

class Education extends Eloquent {

	protected $table = 'education';
	public $timestamps = true;

	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

    public function level()
    {
        return $this->belongsTo('EducationLevel', 'education_level_id');
    }

    public function status()
    {
        return $this->belongsTo('EducationStatus', 'education_status_id');
    }

    public function work_files()
    {
        return $this->belongsToMany('WorkFile', 'work_file_education');
    }    

	public function institution(){
		return $this->belongsTo('Institution', 'institution_id');
	}
}