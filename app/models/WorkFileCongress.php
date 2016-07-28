<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class WorkFileCongress extends Eloquent {

	protected $table = 'work_file_congress';
	public $timestamps = true;
	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

	public function congress()
    {
        return $this->belongsTo('Congress', 'congress_id');
    }

}