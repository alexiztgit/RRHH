<?php 

class EmployeeController extends BaseController {

  /**
   * Display a listing of the resource.
   *
   * @return Response
   */

  protected $countries;
  protected $cities;
  protected $tdocs;
  protected $statuses;
  protected $employee;
  protected $provinces;
  protected $splits;
  protected $localities;
  protected $contact_types;
  protected $disability_types;
  protected $medical_data;
  protected $disability;
  protected $kinships;
  protected $family;
  protected $employee_status;
  protected $job_status;
  protected $additionals;
  protected $supplements;
  protected $areas;
  protected $buildings;
  protected $offices;
  protected $work_file;
  protected $roles;
  protected $institutions;
  protected $education_levels;
  protected $education_statuses;
  protected $it_areas;
  protected $it_levels;
  protected $languages;
  protected $medical_socials;
  protected $arts;
  protected $prepaids;
  protected $administrative_acts;
  protected $groupings;
  protected $categories;
  protected $stretchs;
  protected $levels;
  protected $disciplinary_action;
  protected $review_situation;
  protected $license_scale;

  public function __construct(Country $countries,
                City $cities,
                DocumentType $tdocs,
                Status $statuses,
                Employee $employee,
                Province $provinces,
                Split $splits,
                Locality $localities,
                ContactType $contact_types,
                DisabilityType $disability_types,
                Kinship $kinships,
                MedicalData $medical_data,
                Disability $disability,
                Family $family,
	              EmployeeStatus $employee_status,
                JobStatus $job_status,
                Additional $additionals,
                Supplement $supplements,
                Area $areas,
                Building $buildings,
                Office $offices,
                WorkFile $work_file,
                Review $review,
                Category $categories,
                Stretch $stretchs,
                Grouping $groupings,
                Scale $scales,
                Role $roles,
                Institution $institutions,
                EducationLevel $education_levels,
                EducationStatus $education_statuses,
                ItArea $it_areas,
                ItLevel $it_levels,
                Language $languages,
                MedicalSocial $medical_socials,
                Art $arts,
                Prepaid $prepaids, 
                AdministrativeAct $administrative_acts,
				        ItLevel $levels, 
                DisciplinaryAction $disciplinary_action,
                ReviewSituation $review_situation,
                LicenseScale $license_scale){

    $this->countries = $countries;
    $this->cities = $cities;
    $this->tdocs = $tdocs;
    $this->statuses = $statuses;
    $this->employee = $employee;
    $this->provinces = $provinces;
    $this->splits = $splits;
    $this->localities = $localities;
    $this->contact_types = $contact_types;
    $this->disability_types = $disability_types;
    $this->medical_data = $medical_data;
    $this->disability = $disability;
    $this->kinships = $kinships;
    $this->family = $family;
    $this->employee_status = $employee_status;	
    $this->job_status = $job_status;
    $this->additionals = $additionals;
    $this->supplements = $supplements;
    $this->areas = $areas;
    $this->buildings = $buildings;
    $this->offices = $offices;
    $this->work_file = $work_file;
    $this->review = $review;
    $this->categories = $categories;
    $this->stretchs = $stretchs;
    $this->groupings = $groupings;
    $this->scales = $scales;
    $this->roles = $roles;
    $this->institutions = $institutions;
    $this->education_levels = $education_levels;
    $this->education_statuses = $education_statuses;
    $this->it_areas = $it_areas;
    $this->it_levels = $it_levels;
    $this->languages = $languages;
    $this->medical_socials = $medical_socials;
    $this->arts = $arts;
    $this->prepaids = $prepaids;
    $this->administrative_acts = $administrative_acts;
    $this->disciplinary_action = $disciplinary_action;
    $this->review_situation = $review_situation;
	  $this->levels = $levels;
    $this->license_scale     = $license_scale;
  }

  public function index()
  {

  }

  /**
   * Show the form for creating a new resource.
   *
   * @return Response
   */
  public function create()
  {
    
  }

  /**
   * Store a newly created resource in storage.
   *
   * @return Response
   */
  public function store()
  {
    
  }

  /**
   * Display the specified resource.
   *
   * @param  int  $id
   * @return Response
   */
  public function show($id)
  {
    
  }

  /**
   * Show the form for editing the specified resource.
   *
   * @param  int  $id
   * @return Response
   */
  public function edit($id)
  {
    //Definimos los parametros a Enviar
    $countries = $this->countries->lists('name','id');
    $cities = $this->cities->lists('name','id');
    $tdocs = $this->tdocs->lists('name','id');
    $statuses = $this->statuses->lists('name','id');

    $provinces = $this->provinces->orderBy('name')->lists('name','id');
    $splits = $this->splits->orderBy('name')->lists('name','id');
    $localities = $this->localities->orderBy('name')->lists('name','id');
    $emails = $this->contact_types->where('type_id','=','1')->orderBy('name')->lists('name','id');
    $telefonos = $this->contact_types->where('type_id','=','2')->orderBy('name')->lists('name','id');
    $tdiscaps =  DisabilityType::all()->lists('name', 'id'); //$this->disability_types->list('name', 'id');
    $kinships = $this->kinships->lists('name','id');
    $job_status = $this->job_status->lists('name','id');
    $additionals = $this->additionals->lists('name','id');
    $supplements = $this->supplements->lists('name','id');
    $areas = $this->areas->lists('name','id');
    $buildings = $this->buildings->lists('name','id');
    $offices = $this->offices->lists('name','id');
    $categories = $this->categories->lists('name','id');
    $stretchs = $this->stretchs->lists('name','id');
    $groupings = $this->groupings->lists('name','id');
    $scales = $this->scales->lists('name','id');
    $roles = $this->roles->lists('name','id');
    $institutions = $this->institutions->lists('name','id');
    $education_levels = $this->education_levels->lists('name','id');
    $education_statuses = $this->education_statuses->lists('name','id');
    $it_areas = $this->it_areas->lists('name','id');
    $it_levels = $this->it_levels->lists('name','id');
    $languages = $this->languages->lists('name','id');
    $medical_socials = $this->medical_socials->lists('name','id');
    $arts = $this->arts->lists('name','id');
    $prepaids = $this->prepaids->lists('name','id');
    $administrative_acts = AdministrativeAct::all()->lists('name', 'id'); //$this->administrative_acts->lists('name','id');
  	$groupings = Grouping::all()->lists('name', 'id');
    $disciplinary_action = DisciplinaryAction::all()->lists('name', 'id');
    $review_situation = $this->review_situation->lists('name', 'id');
	  $license_scale     = $this->license_scale->lists('name', 'id');

    $cities[0] = '-Selecciona-';
    $countries[0] = '-Selecciona-';
    $tdocs[0] = '-Selecciona-';
    $provinces[0] = '-Selecciona-';
    $splits[0] = '-Selecciona-';
    $localities[0] = '-Selecciona-';
    $emails[0] = '-Selecciona-';
    $telefonos[0] = '-Selecciona-';
    $statuses[0] = '-Selecciona-';
    $tdiscaps[0] = '-Selecciona-';
    $kinships[0] = '-Selecciona-';
    $job_status[0] = '-Selecciona-';
    $additionals[0] = '-Selecciona-';
    $supplements[0] = '-Selecciona-';
    $areas[0] = '-Selecciona-';
    $buildings[0] = '-Selecciona-';
    $offices[0] = '-Selecciona-';
    $categories[0] = '-Selecciona-';
    $stretchs[0] = '-Selecciona-';
    $groupings[0] = '-Selecciona-';
    $scales[0] = '-Selecciona-';
    $roles[0] = '-Selecciona-';
    $institutions[0] = '-Selecciona-';
    $education_levels[0] = '-Selecciona-';
    $education_statuses[0] = '-Selecciona-';
    $it_areas[0] = '-Selecciona-';
    $it_levels[0] = '-Selecciona-';
    $languages[0] = '-Selecciona-';
    $medical_socials[0] = '-Selecciona-';
    $arts[0] = '-Selecciona-';
    $prepaids[0] = '-Selecciona-';
    $administrative_acts[0] = '-Selecciona-';
    $disciplinary_action[0] = '-Selecciona-';
    $review_situation[0] = '-Selecciona-';
    $license_scale[0] = '-Selecciona-';
	
    $empleado = $this->employee->with('city', 'city.country', 'document_type', 'adresses', 'contactTypes', 'contactTypes.type', 'work_file', 'status')->find($id);
    $medical_data = $this->medical_data->where('employee_id', '=', $id)->orderBy('id', 'desc')->first();
    $employee_status = $this->employee_status->where('employee_id', '=', $id)->orderBy('id_employee_status', 'desc')->first();
    $city = $this->cities->find($empleado->city_id);
    $file = $this->work_file->where('employee_id', '=', $id)->orderBy('created_at', 'desc')->first();
    Session::set('employee_id', $id);
    if(isset($file->id)){
      $review = $this->review->where('work_file_id', '=', $file->id)->orderBy('created_at', 'desc')->first();
    }

    if(isset($medical_data->id)){
      $disability = $this->disability->with('disabilityType')->where('medical_data_id', '=', $medical_data->id)->orderBy('id', 'desc')->first();
    }
    else{
      $disability = null;
    }

    $tdiscap = (isset($disability->disability_type_id)) ? $disability->disability_type_id : 0;

    return View::make('legajo', compact('empleado', 'countries', 'cities','statuses', 'tdocs', 'provinces', 'localities', 'splits', 'emails', 'telefonos', 'tdiscaps', 'medical_data', 'disability', 'tdiscap','kinships', 'employee_status', 'city', 'job_status', 'additionals', 'supplements', 'areas', 'buildings', 'offices', 'file', 'categories', 'groupings', 'stretchs', 'scales', 'roles', 'review', 'institutions','education_levels','education_statuses', 'it_areas', 'it_levels', 'languages', 'medical_socials', 'arts', 'prepaids', 'administrative_acts', 'disciplinary_action', 'review_situation', 'license_scale'));
  }

  /**
   * Update the specified resource in storage.
   *
   * @param  int  $id
   * @return Response
   */
  public function update($id)
  {
  
  }

  /**
   * Remove the specified resource from storage.
   *
   * @param  int  $id
   * @return Response
   */
  public function destroy($id)
  {
    
  }
  
}

?>