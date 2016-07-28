<?php

class Family extends Eloquent {

	protected $table = 'family';

	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

	public function kinship()
	{
		return $this->belongsTo('Kinship', 'kinship_id');
	}

	public function disability()
	{
		return $this->belongsToMany('DisabilityType', 'family_disability_type');
	}

}
