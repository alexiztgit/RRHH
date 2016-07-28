<?php

class ContactType extends Eloquent {

	protected $table = 'contact_type';
	public $timestamps = false;

	public function employee()
    {
        return $this->belongsToMany('Employee');
    }

	public function type()
	{
		return $this->belongsTo('Type', 'type_id');
	}

}