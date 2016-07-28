<?php

class DisciplinaryAction extends \Eloquent {
	protected $fillable = [];
	protected $table  = "disciplinary_action";

	public function sanction(){
		return $this->hasMany('Sanction');
	}
}