<?php

class DocumentType extends Eloquent {

	protected $table = 'document_type';
	public $timestamps = false;

	public function employees()
	{
		return $this->hasMany('Employee');
	}

}