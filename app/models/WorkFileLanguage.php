<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class WorkFileLanguage extends Eloquent {

	protected $table = 'work_file_language';
	//protected $primaryKey = array('work_file_id','language_id');
	public $timestamps = true;
	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];
	
	

	public function language()
    {
        return $this->belongsTo('Language', 'language_id');
    }

    public function workFile(){
    	return $this->belongsTo('WorkFile', 'work_file_id');
    }
}