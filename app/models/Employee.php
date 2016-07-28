<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class Employee extends Eloquent {

	protected $table = 'employee';
	public $timestamps = true;

	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

	public function city()
	{
		return $this->belongsTo('City', 'city_id');
	}

	public function document_type()
	{
		return $this->belongsTo('DocumentType', 'document_type_id');
	}

	public function status()
	{
		return $this->hasMany('EmployeeStatus');
	}

	public function contactTypes()
	{
		return $this->belongsToMany('ContactType', 'employee_contact_type')->withPivot('value', 'active');
	}

	public function adresses()
	{
		return $this->belongsToMany('Adress', 'employee_adress');
	}

	public function work_file()
	{
		 return $this->hasMany('WorkFile');
	}

	public function lastStatus(){
		return $this->hasOne('EmployeeStatus')->latest();
	}

}