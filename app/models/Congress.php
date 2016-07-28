<?php
use Illuminate\Database\Eloquent\SoftDeletingTrait;

class Congress extends Eloquent {

	protected $table = 'congress';
	public $timestamps = true;

	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

    // public function category()
    // {
    //     return $this->belongsTo('Category');
    // }

    // public function grouping()
    // {
    //     return $this->belongsTo('Grouping');
    // }

    // public function scale()
    // {
    //     return $this->belongsTo('Scale');
    // }

    // public function stretch()
    // {
    //     return $this->belongsTo('Stretch');
    // }

    public function work_files()
    {
        return $this->belongsToMany('WorkFile', 'work_file_education');
    }    

}