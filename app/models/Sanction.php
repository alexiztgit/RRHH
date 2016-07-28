<?php

class Sanction extends \Eloquent {
	protected $fillable = [];
	protected $table = 'sanction';
	public $timestamps = false;

	public function administrativeAct(){
		return $this->belongsTo('AdministrativeAct', 'administrative_act_id');
	}

	public function administrativeFile()
	{
		return $this->belongsTo('WorkFile', 'work_file_id');
	}

	public function disciplinaryAction(){
		return $this->belongsTo('DisciplinaryAction', 'disciplinary_action_id');
	}
}