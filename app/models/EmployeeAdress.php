<?php

class EmployeeAdress extends Eloquent {

	protected $table = 'employee_adress';
	public $timestamps = false;

	public function adresses()
    {
        return $this->belongsTo('Adress', 'adress_id');
    }

}