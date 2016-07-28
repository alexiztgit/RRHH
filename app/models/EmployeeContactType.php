<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class EmployeeContactType extends Eloquent {

	protected $table = 'employee_contact_type';
	public $timestamps = true;
	public $primaryKey = 'id_employee_contact_type';

	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

	public function contact_type()
	{
		return $this->belongsTo('ContactType', 'contact_type_id');
	}

}