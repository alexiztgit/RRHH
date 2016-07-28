<?php

class WorkFile extends Eloquent {

	protected $table = 'work_file';

	use SoftDeletingTrait;

	protected $dates = ['deleted_at'];

	public function area()
	{
		return $this->belongsTo('Area', 'area_id');
	}
	public function office()
	{
		return $this->belongsTo('Office', 'office_id');
	}

	public function status()
	{
		return $this->belongsToMany('JobStatus', 'work_file_job_status');
	}

	public function supplement()
	{
		return $this->belongsTo('Supplement', 'supplement_id');
	}

	public function additional()
	{
		return $this->belongsTo('Additional', 'additional_id');
	}

	public function schedule()
	{
		return $this->belongsToMany('Schedule', 'work_file_schedule');
	}

	public function employee()
    {
        return $this->belongsTo('Employee');
    }

    public function education()
	{
		return $this->belongsToMany('Education', 'work_file_education');
	}

	public function courses()
	{
		return $this->belongsToMany('Course', 'work_file_course');
	}

	public function languages()
	{
		return $this->belongsToMany('Language', 'work_file_language');
	}

	public function publicServices(){
		return $this->hasMany('PublicService');
	}

	public function privateServices(){
		return $this->hasMany('PrivateService');
	}

	public function mentionsCongrats(){
		return $this->hasMany('MentionsCongrats');
	}


	public function seizure(){
		return $this->hasMany('Seizure');
	}

	public function performanceEvaluation(){
		return $this->hasMany('PerformanceEvaluation');
	}

	public function capacitationCredit(){
		return $this->hasMany('CapacitationCredit');
	}	
	
	public function administrativeHistory(){
		return $this->hasMany('AdministrativeHistory');
	}	

	public function sanction(){
		return $this->hasMany('Sanction');
	}

	public function review(){
		return $this->hasMany('Review');
	}
	
	public function workFileLanguages()
	{
		return $this->hasMany('WorkFileLanguage');
	}
	
	public function workFileAdditionalKnowledge(){
		return $this->hasMany('WorkFileAdditionalKnowledge');
	}

	public function workFileJobStatus(){
		return $this->hasMany('WorkFileJobStatus');
	}
	
	public function license(){
		return $this->hasMany('License');
	}
}
