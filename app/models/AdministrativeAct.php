<?php

class AdministrativeAct extends \Eloquent {
	protected $fillable = [];
	protected $table = 'administrative_act';

	public function publicServices(){
		return $this->hasMany('PublicServices');
	}

	public function mentions_congrats(){
		return $this->hasMany('MentionsCongrats');
	}

	public function administrative_history(){
		return $this->hasMany('AdministrativeHistory');
	}

	public function ochestra(){
		return $this->hasMany('Ochestra');
	}

	public function sanction(){
		return $this->hasMany('Sanction');
	}
}