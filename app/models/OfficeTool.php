<?php
use Illuminate\Database\Eloquent\SoftDeletingTrait;

class OfficeTool extends Eloquent {

	protected $table = 'office_tool';
	public $timestamps = true;
	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

	public function file()	
	{
		return $this->hasMany('work_file');
	}

}
