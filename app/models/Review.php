<?php
use Illuminate\Database\Eloquent\SoftDeletingTrait;

class Review extends Eloquent {

	protected $table = 'review';
	public $timestamps = true;

	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

    public function category()
    {
        return $this->belongsTo('Category');
    }

    public function scale()
    {
        return $this->belongsTo('Scale');
    }

    public function stretch()
    {
        return $this->belongsTo('Stretch');
    }

    public function roles()
    {
        return $this->belongsToMany('Role', 'review_role');
    }    

    public function workFile()
    {
        return $this->belongsTo('workFile', 'work_file_id');
    }   
	
	public function publicService(){
		return $this->hasMany('PublicService');
	}
	
	public function grouping(){
		return $this->belongsTo('Grouping', 'grouping_id');
	}

}