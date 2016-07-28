<?php

class Type extends Eloquent {

	protected $table = 'type';

	public function contactTypes()
	{
		return $this->hasMany('ContactType');
	}

}
