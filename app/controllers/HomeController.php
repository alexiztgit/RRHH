<?php

use Illuminate\Http\Request;

class HomeController extends EmployeeController {


	/*
	|--------------------------------------------------------------------------
	| Default Home Controller
	|--------------------------------------------------------------------------
	|
	| You may wish to use controllers instead of, or in addition to, Closure
	| based routes. That's great! Here is an example controller method to
	| get you started. To route to this controller, just add the route:
	|
	|	Route::get('/', 'HomeController@showWelcome');
	|
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
	protected $disciplinary_action;
	protected $review_situation;
	protected $license_scale;
	protected $empleado;
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
		$this->license_scale     = $license_scale;
	}

	public function home(){
		$empleados = Employee::paginate(10);
		return View::make('dashboard',  compact('empleados'));

	}


	public function legajo()
	{
		$countries = $this->countries->lists('name','id');
		$cities = $this->cities->lists('name','id');
		$tdocs = $this->tdocs->lists('name','id');
		$statuses = $this->statuses->lists('name','id');

		$provinces = $this->provinces->orderBy('name')->lists('name','id');
		$splits = $this->splits->orderBy('name')->lists('name','id');
		$localities = $this->localities->orderBy('name')->lists('name','id');
		$emails = $this->contact_types->where('type_id','=','1')->orderBy('name')->lists('name','id');
		$telefonos = $this->contact_types->where('type_id','=','2')->orderBy('name')->lists('name','id');
		$tdiscaps =  DisabilityType::all()->lists('name', 'id');
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
	    $administrative_acts = $this->administrative_acts->lists('name', 'id');
	    $disciplinary_action = DisciplinaryAction::all()->lists('name', 'id');
	    $review_situation = ReviewSituation::all()->lists('name', 'id');
		$license_scale = $this->license_scale->lists('name', 'id');

		$cities[0] = '-Selecciona-';
		$countries[0] = '-Selecciona-';
		$tdocs[0] = '-Selecciona-';
		$provinces[0] = '-Selecciona-';
		$splits[0] = '-Selecciona-';
		$localities[0] = '-Selecciona-';
		$emails[0] = '-Selecciona-';
		$telefonos[0] = '-Selecciona-';
		$tdiscaps[0] = '-Selecciona-';
		$statuses[0] = '-Selecciona-';
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
    	$medical_socials[0] = '-Selecciona-';
	    $arts[0] = '-Selecciona-';
	    $prepaids[0] = '-Selecciona-';
	    $administrative_acts[0] = '-Selecciona-';
	    $review_situation[0] = '-Selecciona-';
	    $disciplinary_action[0] = '-Selecciona-';
		$license_scale[0] = '-Selecciona-';

	    
		return View::make('legajo', compact('countries', 'cities','statuses', 'tdocs', 'provinces', 'localities', 'splits', 'emails', 'telefonos', 'tdiscaps', 'kinships', 'job_status', 'additionals', 'supplements', 'areas', 'buildings', 'offices', 'file', 'categories', 'groupings', 'stretchs', 'scales', 'roles', 'review', 'institutions','education_levels','education_statuses', 'it_areas', 'it_levels', 'languages','medical_socials', 'arts', 'prepaids','administrative_acts', 'disciplinary_action', 'review_situation', 'license_scale'));

	}

	public function actived(){

		$empleados = Employee::with('lastStatus')->get();

		/*$empleados = Employee::whereHas('status', function ($q) {
						//$q->orderBy('id_employee_status', 'desc');
					    $q->where('status_id', '<>', 2);  
					 })->get();
*/
		return View::make('actived', compact('empleados'));
	} 

	public function retired(){

		$empleados = Employee::with('lastStatus')->get();
		/*$empleados = Employee::whereHas('status', function ($q) {
					    $q->where('status_id', '=', 2);  
					 })->get();*/
		return View::make('retired', compact('empleados'));
	} 
	
	public function structure(){
		return View::make('structure');
	}

	public function view($id){

	    $empleado = $this->employee->with('city', 'city.country', 'document_type', 'adresses', 'contactTypes', 'contactTypes.type', 'work_file', 'status')->find($id);

	    $employee_status = $this->employee_status->where('employee_id', '=', $id)->orderBy('id_employee_status', 'desc')->with('status')->first();
		$contactos = EmployeeContactType::where('employee_id','=', $id)->with('contact_type')->get();
		$employee_address = EmployeeAdress::where('employee_id','=', $id)->with('adresses', 'adresses.province','adresses.locality','adresses.split')->get();

		$disabilities = MedicalData::where('employee_id', '=', $id)
							->join('disability', 'disability.medical_data_id', '=', 'medical_data.id')
							->join('disability_type', 'disability_type.id', '=', 'disability.disability_type_id')->get();

		$families = Family::where('employee_id','=', $id)->with('kinship', 'disability')->get();
		$schedules = WorkFile::where('employee_id','=', $id)->with('area', 'office', 'office.building')
						->join('work_file_schedule', 'work_file_schedule.work_file_id', '=', 'work_file.id')
						->join('schedule', 'schedule.id', '=', 'work_file_schedule.schedule_id')
						->get();

		$ids = array();
		$workfiles = WorkFile::where('employee_id','=', $id)->get();
		foreach($workfiles as $workfile){
			array_push($ids, $workfile->id);
		}

		$reviews = Review::whereIn('work_file_id', $ids)->with('scale', 'grouping', 'stretch')->get();
		$educations = WorkFileEducation::whereIn('work_file_id', $ids)->with('education', 'education.level', 'education.status')->get();
		$courses = WorkFileCourse::whereIn('work_file_id', $ids)->with('course')->get();
		$congresses = WorkFileCongress::whereIn('work_file_id', $ids)->with('congress')->get();
		$languages = WorkFileLanguage::whereIn('work_file_id', $ids)->with('language')->get();
		$informatics = WorkFileItCourse::whereIn('work_file_id', $ids)->with('course', 'course.level', 'course.area')->get();
		$additionals = WorkFileAdditionalKnowledge::whereIn('work_file_id', $ids)->with('educationLevel')->get();
		$publicServices = PublicService::whereIn('work_file_id', $ids)->with('administrativeAct', 'reviewSituation')->get();
		$privateServices = PrivateService::whereIn('work_file_id', $ids)->get();
		$congratulations = MentionsCongrats::whereIn('work_file_id', $ids)->with('administrativeAct')->get();
		$sanctions = Sanction::whereIn('work_file_id', $ids)->with('administrativeAct')->get();
		$seizures = Seizure::whereIn('work_file_id', $ids)->get();
		$evaluations = PerformanceEvaluation::whereIn('work_file_id', $ids)->get();
		$capacitations = CapacitationCredit::whereIn('work_file_id', $ids)->get();
		$capacitations = CapacitationCredit::whereIn('work_file_id', $ids)->get();
		$historics = AdministrativeHistory::whereIn('work_file_id', $ids)->with('scale', 'grouping', 'stretch', 'administrativeAct')->get();
		$ochestras = Ochestra::whereIn('work_file_id', $ids)->with('administrativeAct', 'scale', 'grouping', 'category', 'stretch')->get();
		$exams = WorkFile::where('employee_id', '=', $id)
							->join('license', 'license.work_file_id', '=', 'work_file.id')
							->join('license_exam', 'license_exam.license_id', '=', 'license.id')
							->join('license_scale', 'license_scale.id', '=', 'license.license_scale_id')->get();

		$absents = WorkFile::where('employee_id', '=', $id)
							->join('license', 'license.work_file_id', '=', 'work_file.id')
							->join('license_absent', 'license_absent.license_id', '=', 'license.id')
							->join('license_scale', 'license_scale.id', '=', 'license.license_scale_id')->get();

		$medicals = WorkFile::where('employee_id', '=', $id)
							->join('license', 'license.work_file_id', '=', 'work_file.id')
							->join('license_medical', 'license_medical.license_id', '=', 'license.id')
							->join('license_scale', 'license_scale.id', '=', 'license.license_scale_id')->get();

		$medical_families = WorkFile::where('employee_id', '=', $id)
							->join('license', 'license.work_file_id', '=', 'work_file.id')
							->join('license_medical_family', 'license_medical_family.license_id', '=', 'license.id')
							->join('license_scale', 'license_scale.id', '=', 'license.license_scale_id')->get();

	    return View::make('view-legajo', compact('empleado', 'employee_status', 'contactos', 'employee_address', 'disabilities', 'families', 'schedules', 'reviews', 'educations', 'courses', 'congresses', 'languages', 'informatics', 'additionals', 'publicServices', 'privateServices', 'congratulations', 'sanctions', 'seizures', 'evaluations', 'capacitations', 'historics', 'ochestras', 'exams', 'absents', 'medicals', 'medical_families'));
  	}

	public function savePersonal() {

		$input = Input::get();

		//	VALIDAR QUE EL CUIL NO EXISTA
		if ($input['id']){
			$employee = Employee::find($input['id']);
			if ($employee->cuil != $input['cuil']){
				$employee = Employee::where('cuil', '=', $input['cuil'])->get();

				if ($employee->count() > 0){
					return array('status' => 1, 'response' => "El cuil ya se encuentra registrado");				
				}
			}

		}else{
			$employee = Employee::where('cuil', '=', $input['cuil'])->get();

			if ($employee->count() > 0)
				return array('status' => 1, 'response' => "El cuil ya se encuentra registrado");
		}

		//	VALIDAR QUE EL DOCUMENTO NO EXISTA
		if ($input['id']){
			$employee = Employee::find($input['id']);
			if ($employee->document != $input['document']){
				$employee = Employee::where('document', '=', $input['document'])->get();

				if ($employee->count() > 0){
					return array('status' => 1, 'response' => "El documento de identificación ya se encuentra registrado");				
				}
			}
		}else{
			$employee = Employee::where('document', '=', $input['document'])->get();

			if ($employee->count() > 0)
				return array('status' => 1, 'response' => "El documento de identificación ya se encuentra registrado");
		}

		if ($input['id']){
			$employee = Employee::find($input['id']);
		}
		else{
			$employee = new Employee;
		}

		$employee->document = $input['document'];
		$employee->name = $input['name'];
		$employee->lastname = $input['lastname'];
		$employee->gender = $input['sexo'];
		$employee->cuil = $input['cuil'];
		$employee->birthdate = date('Y-m-d', strtotime($input['fecha-nacimiento']));
		$employee->marital_status = $input['marital_status'];
		$employee->document_type_id = $input['document_type'];
		$employee->city_id = $input['city'];

		//	UPLOAD DE PHOTO
		$destinationPath = public_path().'/upload/';

		if (Input::file('photo')){
			$photoNewFileName = date("Ymdhis").Input::file('photo')->getClientOriginalName();
			if (Input::file('photo')->move($destinationPath, $photoNewFileName))
				$employee->photo = $photoNewFileName;
		}

		try {

			$currentUser = Sentry::getUser();

			$employee->save();

			$insertedId = $employee->id;

			$employee_status = new EmployeeStatus;

			$employee_status->employee_id = $insertedId;

			$employee_status->user_id = $currentUser->id;

			$employee_status->from = ($input['estado-desde'] != "") ? date('Y-m-d', strtotime($input['estado-desde'])) : "0000-00-00"; 
			$employee_status->to = ($input['estado-hasta'] != "") ? date('Y-m-d', strtotime($input['estado-hasta'])) : "0000-00-00"; 

			if ($employee_status->from != "0000-00-00" && $employee_status->to != "0000-00-00"){
				$employee_status->status_id = 2;
			}
			else{
				if ($employee_status->from != "0000-00-00")
					$employee_status->status_id = 1;				
				else
					$employee_status->status_id = 3;
			}
			
		

			

			$employee_status->save();

			return array('status' => 0, 'response' => $employee->id, 'message' => 'Datos Guardados con Exito', 'employee' => $employee);
		} catch (Exception $e) {
			return array('status' => 1, 'response' => $e->getMessage());	
		}
		
	}

	public function savePhone(){

		$input = Input::json();
	
		if ($input->get('id_employee_contact_type')){
			$contacto = EmployeeContactType::where('id_employee_contact_type', '=', $input->get('id_employee_contact_type'))->first();
			$contacto->contact_type_id = $input->get('contact_type');
			$contacto->value = $input->get('phone');
		}else{
			$contacto = new EmployeeContactType;
			$contacto->employee_id = $input->get('id_employee');
			$contacto->contact_type_id = $input->get('contact_type');
			$contacto->value = $input->get('phone');
		}

		try {
			$contacto->save();
			return array('status' => 0 ,'response' => 'success', 'message' => 'Datos Guardados con Exito');
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
		
	}

	public function saveMail(){

		$input = Input::json();

		if ($input->get('id_employee_contact_type')){
			$contacto = EmployeeContactType::where('id_employee_contact_type', '=', $input->get('id_employee_contact_type'))->first();
			$contacto->contact_type_id = $input->get('contact_type');
			$contacto->value = $input->get('email');			
		}else{
			$contacto = new EmployeeContactType;
			$contacto->employee_id = $input->get('id_employee');
			$contacto->contact_type_id = $input->get('contact_type');
			$contacto->value = $input->get('email');
		}

		try {
			$contacto->save();
			return array('status' => 0 ,'response' => 'success');
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function saveAdress(){

		$input = Input::json();

		if ($input->get('id')){
			$direccion = Adress::find($input->get('id'));
		}else{
			$direccion = new Adress;
		}
		
		$direccion->type = $input->get('tipo');
		$direccion->street = $input->get('calle');
		$direccion->number = $input->get('numero');
		$direccion->floor = $input->get('piso');
		$direccion->department = $input->get('departamento');
		$direccion->postal_code = $input->get('codigo-postal');
		$direccion->province_id = $input->get('province_id');
		$direccion->locality_id = $input->get('locality_id');
		$direccion->split_id = $input->get('split_id');
		$direccion->neighborhood = $input->get('barrio');
		$direccion->phone = $input->get('telefono-direccion');
	
		try {
			$direccion->save();

			if (!$input->get('id')){
				$direccion_empleado = new EmployeeAdress;
				$direccion_empleado->adress_id = $direccion->id;
				$direccion_empleado->employee_id = $input->get('id_employee');
				$direccion_empleado->save();
			}
			return array('status' => 0 ,'response' => 'success');
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function saveMedicalInfo($id){

		$destinationPath = public_path().'/upload/';	

		$input = Input::get();

		try {

			$legajoNewFileName =  "";
			$certificadoNewFileName = "";
			//Verifico si ya existe un registro anterior para adjuntar el legajo médico
			if($input['medical_file_exists'] == ""){

				//Creo el nuevo registro Médico
				$medical = new MedicalData;

				if (Input::file('legajo-medico')){
					$legajoNewFileName = date("Ymdhis").Input::file('legajo-medico')->getClientOriginalName();
					Input::file('legajo-medico')->move($destinationPath, $legajoNewFileName);
					$medical->number = $input['numero-carnet'];
					$medical->blood_type = $input['tipo-sangre'];
					$medical->medical_file = '/upload/' . $legajoNewFileName;
				}
				
			}
			else{
				$legajoNewFileName = $input['medical_file_exists'];

				$medical = MedicalData::where('employee_id', '=', $id)->first();

				$medical->medical_file = $legajoNewFileName;
			}
			
			//Verifico si viene discapacidad para obtener el adjunto
			if($input['discapacidad'] == "1"){
				//Verifico que haya recibido el archivo o si no devuelvo error
				if(Input::file('certificado-discapacidad') != ""){
					if (Input::file('certificado-discapacidad')->getMimeType() != "image/jpeg"){
						return array('status' => 1 ,'response' => "Tipo de Archivo Inválido");
					}
					$certificadoNewFileName = date("Ymdhis").Input::file('certificado-discapacidad')->getClientOriginalName();
					Input::file('certificado-discapacidad')->move($destinationPath, $certificadoNewFileName);
				}
				else{
					return array('status' => 1 ,'response' => "Debes adjuntar el Certificado de Discapacidad");
				}
			}

			//Seteo los dato a guardar

			
			$medical->medical_apto = (Input::get('apto-medico')) ? date('Y-m-d', strtotime(Input::get('apto-medico'))) : "";
			$medical->medical_social_id = ($input['obra-social']) ? $input['obra-social'] : 0;
			$medical->art_id = ($input['art']) ? $input['art'] : 0;
			$medical->prepaid_id = ($input['prepaga']) ? $input['prepaga'] : 0;
			$medical->employee_id = $id;

			$medical->save();

			$insertedId = $medical->id;

			$disability = new Disability;

			$disability->generated_date = (Input::get('fecha-cert-discapacidad')) ? date('Y-m-d', strtotime(Input::get('fecha-cert-discapacidad'))) : "0000-00-00";
			$disability->start_date = (Input::get('vigencia-certificado')) ? date('Y-m-d', strtotime(Input::get('vigencia-certificado'))) : "0000-00-00";  
			$disability->end_date = (Input::get('vigencia-certificado-hasta')) ? date('Y-m-d', strtotime(Input::get('vigencia-certificado-hasta'))): "0000-00-00"; 
			$disability->certificate_url = ($certificadoNewFileName) ? $destinationPath . $certificadoNewFileName : "";
			$disability->certificate_creator = ($input['entidad-certificado']) ? $input['entidad-certificado'] : "";
			$disability->disability_type_id = ($input['tipo-discapacidad']) ? $input['tipo-discapacidad'] : 1;
			$disability->active = 1;
			$disability->medical_data_id = $insertedId;

			$disability->save();

			return array('status' => 0 ,'response' => 'success', 'obj' => $medical->medical_file);
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function saveFamily(){

		$input = Input::json();

		if ($input->get('var_id'))
			$family = Family::find($input->get('var_id'));
		else
			$family = new Family;

		$family->kinship_id = $input->get('parentesco');
		$family->name = $input->get('nombre');
		$family->lastname = $input->get('apellido');
		$family->document = $input->get('documento');
		$family->gender = $input->get('genero');
		$family->birthdate = date('Y-m-d', strtotime($input->get('nacimiento')));
		$family->living_with = $input->get('convive');
		$family->garden_assignation = $input->get('asignacion');
		$family->employee_id = $input->get('employee_id');
		
		try {
			$family->save();

			$family_disability = $input->get('disability');
			if($family_disability == "1"){
				$fd = new FamilyDisabilityType;
				$fd->family_id = $family->id;
				$fd->disability_type_id = $input->get('disability_type'); 
				$fd->save();
				return array('status' => 0 ,'response' => 'success');
			} 
			else{
				return array('status' => 0 ,'response' => 'success');
			}
			
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function saveReview(){

		$input = Input::json();

		if ($input->get('var_id'))
			$review = Review::find($input->get('var_id'));
		else
			$review = new Review;

		//verifico que exista primero un work_file
		if($input->get('id_work_file')){
			$review->work_file_id = $input->get('id_work_file');
			$review->scale_id = $input->get('scale');
			$review->grouping_id = $input->get('grouping');
			$review->stretch_id = $input->get('stretch');
			$review->category_id = $input->get('category');
			$review->in_afip = date('Y-m-d', strtotime($input->get('in_afip')));			
			$review->date_afip = date('Y-m-d', strtotime($input->get('date_afip')));
			$review->executive_function = $input->get('executive_function');
			$review->grade = $input->get('grade');
			$review->level = $input->get('level');

			if($input->get('out_afip')){
				$review->out_afip = date('Y-m-d', strtotime($input->get('out_afip')));
			}
			try {
				$review->save();				
				return array('status' => 0 ,'response' => 'success', 'review' => $review->id);
			} catch (Exception $e) {
				dd( $e->getMessage());
				return array('status' => 1 ,'response' => $e->getMessage());	
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta un registro en Lugar, Días y Horarios de Trabajo');
		}
		
	}

	public function saveRole(){

		$input = Input::json();
		$trabajo=null;
		$revista=null;

		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){
				$revista= Review::where('work_file_id','=',$trabajo->id)->first();
				if (isset($revista)) {
					
				}else{
					return array('status' => 1, 'response' => 'Primero se tiene que dar de alta Situación de Revista');	
				}
			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que dar de alta un registro en Lugar, Días y Horarios de Trabajo');
			}	
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta Situación de Revista');
		}

						

			if ($input->get('var_id'))
				$role = ReviewRole::where('id_review_role', '=', $input->get('var_id'))->first();
			else
				$role = new ReviewRole;


			//$role->review_id = $input->get('id_review');
			$role->review_id=$revista->id;
			$role->role_id = $input->get('id_role');
			$role->start_date = date('Y-m-d', strtotime($input->get('start_date')));
			if($input->get('end_date'))
				$role->end_date = date('Y-m-d', strtotime($input->get('end_date')));
			

			$role->description = $input->get('description');

			try {
				$role->save();
				return array('status' => 0, 'response' => 'success',);
			} catch (Exception $e) {
				return array('status' => 1, 'response' => 'Se han detectado errores en el proceso de registro. Por favor intente nuevamente');
			}

	}

	public function saveEducation(){

		$input = Input::json();

		$trabajo=null;


		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}


		if ($input->get('var_id'))
			$education = Education::find($input->get('var_id'));
		else
			$education = new Education;

		$education->education_title = $input->get('title');
		$education->institution_id = $input->get('institution_id');
		$education->education_level_id = $input->get('education_level_id');
		$education->education_status_id = $input->get('education_status_id');
		$education->start_date = date('Y-m-d', strtotime($input->get('education_start')));

		$actually = $input->get('actually');
		if($actually == 0){
			$education->ended = 0;
			$education->end_date = date('Y-m-d', strtotime($input->get('education_end')));
		}else{
			$education->ended = 1;
		}
		
		try {
			$education->save();

			if (!$input->get('var_id')) {
				$education_file = new WorkFileEducation;

				$education_file->work_file_id = $trabajo->id;
				$education_file->education_id = $education->id;
				$education_file->save();
			}

				

			return array('status' => 0 ,'response' => 'success',);
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => 'Se han detectado errores en el proceso de registro. Por favor intente nuevamente');
		}
	}

	public function saveCourse(){

		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}



		if ($input->get('var_id'))
			$course = Course::find($input->get('var_id'));
		else
			$course = new Course;

		$course->name = $input->get('name');
		$course->certificate = $input->get('certificate');

		$actually = $input->get('actually');
		if($actually == 0){
			$course->ended = decbin(0);
			$course->end_date = date('Y-m-d', strtotime($input->get('end_date')));
		}
		else{
			$course->ended = decbin(1);
		}
		
		try {

			$course->save();

			if (!$input->get('var_id')){
				$course_file = new WorkFileCourse;
				$course_file->work_file_id = $trabajo->id;
				$course_file->course_id = $course->id;
				$course_file->save();
			}			

			return array('status' => 0 ,'response' => 'success');
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function saveCongress(){

		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}

		if ($input->get('var_id'))
			$congress = Congress::find($input->get('var_id'));
		else
			$congress = new Congress;

		$congress->name = $input->get('name');
		$congress->especiality = $input->get('especiality');
		$congress->certificate = $input->get('certificate');

		$actually = $input->get('actually');
		if($actually == "0"){
			$congress->ended = "1";
			$congress->end_date = date('Y-m-d', strtotime($input->get('end_date')));
		}else{
			$congress->ended = "0";
		}
		
		try {
			$congress->save();

			if (!$input->get('var_id')){
				$congress_file = new WorkFileCongress;
				$congress_file->work_file_id = $trabajo->id;
				$congress_file->congress_id = $congress->id;
				$congress_file->save();
			}

			return array('status' => 0 ,'response' => 'success',);
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function saveLanguage(){

		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}

		if ($input->get('var_id')){
			$workfile = WorkFileLanguage::where('work_file_id', '=', $input->get('var_review_id'))->where('language_id', '=', $input->get('var_id'))
			->update(['speak_level' => $input->get('speak_level'), 'write_level' => $input->get('write_level')]);
			return array('status' => 0 ,'response' => 'success');
		}else{
			$language = new WorkFileLanguage;
			try {
				$language->language_id = $input->get('id_language');
				$language->work_file_id = $trabajo->id;
				$language->speak_level = $input->get('speak_level');
				$language->write_level = $input->get('write_level');

				$language->save();

				return array('status' => 0 ,'response' => 'success');
			} catch (Exception $e) {
				return array('status' => 1 ,'response' => $e->getMessage());	
			}
		}
	}
	public function savePublicService(){
		$input = Input::json();
		$trabajo=null;
		$revista=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){
				$revista= Review::where('work_file_id','=',$trabajo->id)->first();
				if (isset($revista)) {

				}else{
					return array('status' => 1, 'response' => 'Primero se tiene que dar de alta Situación de Revista');
				}
			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}

		if ($input->get('var_id'))
			$public_service = PublicService::find($input->get('var_id'));
		else
			$public_service = new PublicService();

			try {
				$public_service->organism = $input->get('organismo');
				$public_service->review_id = $revista->id;
				$public_service->motivation = $input->get('motivo');
				$public_service->destination = $input->get('destino');
				$public_service->date_from =  date('Y-m-d', strtotime($input->get('desde')));
				$public_service->date_to = date('Y-m-d', strtotime($input->get('hasta')));
				$public_service->act_number = $input->get('numero');
				$public_service->act_date =date('Y-m-d', strtotime($input->get('fecha')));
				$public_service->work_file_id = $trabajo->id;
				$public_service->administrative_act_id = $input->get('acto');


				$public_service->save();



				return array('status' => 0 ,'response' => 'success');
			} catch (Exception $e) {
				return array('status' => 1 ,'response' => $e->getMessage());
			}

	}
	public function saveWorkFile(){

		$input = Input::json();
		if ($input->get('dias')=='')
			return array('status' => 1 ,'response' => 'Se tiene que seleccionar por lo menos un día de la semana');
		$work_file = new WorkFile;
		$work_file->start_date = date('Y-m-d', strtotime($input->get('ingreso')));
		$work_file->additionals = $input->get('have_additionals');
		
		/*if($input->get('have_additionals') == "1"){
			$work_file->additional_id = $input->get('additional');
			$work_file->supplement_id = $input->get('supplement');	
		}*/
		
		$work_file->area_id = $input->get('area');
		$work_file->office_id = $input->get('office');
		$work_file->employee_id = $input->get('employee_id');
		
		try {
			$work_file->save();	

			$work_file_status = new WorkFileJobStatus;
			$work_file_status->work_file_id = $work_file->id;
			$work_file_status->job_status_id = $input->get('job_status');
			$work_file_status->start_date = date('Y-m-d', strtotime($input->get('date_from')));
			if($input->get('date_to')!= '')
				$work_file_status->end_date = date('Y-m-d', strtotime($input->get('date_to')));

			$work_file_status->save();
		
			$schedule = new Schedule;
			$schedule->days = $input->get('dias');
			$schedule->time_in = $input->get('hour_from');
			$schedule->time_out = $input->get('hour_to');
			$schedule->save();

			$file_schedule = new WorkFileSchedule;
			$file_schedule->work_file_id = $work_file->id;
			$file_schedule->schedule_id = $schedule->id;
			$file_schedule->date_from = date('Y-m-d', strtotime($input->get('date_from')));
			if($input->get('date_to')!='')
				$file_schedule->date_to = date('Y-m-d', strtotime($input->get('date_to')));

			$file_schedule->save();

			return array('status' => 0 ,'response' => 'success', 'work_file' => $work_file->id);

		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function updateWorkFile(){
		$input = Input::json();
		if ($input->get('dias')=='')
			return array('status' => 1 ,'response' => 'Se tiene que seleccionar por lo menos un día de la semana');

		$work_file = WorkFile::find($input->get('id_work_file'));
		$work_file->start_date = date('Y-m-d', strtotime($input->get('ingreso')));
		$work_file->additionals = $input->get('have_additionals');
		if($input->get('have_additionals') == "1"){
			$work_file->additional_id = $input->get('additional');
			$work_file->supplement_id = $input->get('supplement');	
		}
		$work_file->area_id = $input->get('area');
		$work_file->office_id = $input->get('office');
		$work_file->employee_id = $input->get('employee_id');

		
		try {


			$work_file->save();	

			
			$work_file_status = WorkFileJobStatus::where('work_file_id', '=', $input->get('id_work_file'))->first();		

			$work_file_status->work_file_id = $input->get('id_work_file');
			$work_file_status->job_status_id = $input->get('job_status');
			$work_file_status->start_date = date('Y-m-d', strtotime($input->get('date_from')));
			$work_file_status->end_date = date('Y-m-d', strtotime($input->get('date_to')));
			$work_file_status->save();

			//obtengo el WorkFileSchedule para poder actualizarlo
			/*$file_schedule = WorkFileSchedule::where('work_file_id', '=', $input->get('id_work_file'))->first();
			$file_schedule->work_file_id = $work_file->id;
			$file_schedule->date_from = date('Y-m-d', strtotime($input->get('date_from')));
			if($input->get('date_to')!='')
				$file_schedule->date_to = date('Y-m-d', strtotime($input->get('date_to')));
			else
				$file_schedule->date_to = null;
			$file_schedule->update();*/
			$fin_dia=null;
			if ($input->get('date_to')!='')
				$fin_dia=date('Y-m-d', strtotime($input->get('date_to')));

			$file_schedule = WorkFileSchedule::where('work_file_id', '=', $input->get('id_work_file'))
				->update(['date_from' => date('Y-m-d', strtotime($input->get('date_from'))),
					'date_to' => $fin_dia]);

			$file_schedule = WorkFileSchedule::where('work_file_id', '=', $input->get('id_work_file'))->first();

			$schedule = Schedule::where('id','=',$file_schedule->schedule_id)->first();
			$schedule->days = $input->get('dias');
			$schedule->time_in = $input->get('hour_from');
			$schedule->time_out = $input->get('hour_to');
			$schedule->save();


			
			return array('status' => 0 ,'response' => 'success', 'work_file' => $work_file->id);

		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

/*	public function savePublicService(){
		$input = Input::json();

		try {
			
			$idlegajo = $input->get('idlegajo');

			$work_file = WorkFile::where('employee_id', '=', $idlegajo)->orderBy('id', 'desc')->first();

			$work_file_id = $work_file->id;

			if ($input->get('var_id'))
				$publicService = PublicService::find($input->get('var_id'));
			else
				$publicService = new PublicService;

			$publicService->organism = $input->get('organismo');
			$publicService->review_id = $input->get('situacion');
			$publicService->motivation = $input->get('motivo');
			$publicService->destination = $input->get('destino');
			$publicService->date_from = date('Y-m-d', strtotime($input->get('desde')));
			$publicService->date_to = date('Y-m-d', strtotime($input->get('hasta')));
			$publicService->act_number = $input->get('numero');
			$publicService->act_date = date('Y-m-d', strtotime($input->get('fecha')));
			$publicService->work_file_id = $work_file_id;
			$publicService->administrative_act_id = $input->get('acto');

			$publicService->save();

			return array('status' => 0 ,'response' => 'success', 'public_service' => $publicService->id);
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}*/
	
	public function savePrivateService(){
		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}
		try {
			


			if ($input->get('var_id'))
				$privateService = PrivateService::find($input->get('var_id'));
			else
				$privateService = new PrivateService;

			$privateService->institution_name = $input->get('institucion');
			$privateService->legal_adress = $input->get('domicilio');
			$privateService->charge_function = $input->get('cargo');
			$privateService->remunerated = $input->get('remunerado');
			$privateService->date_from = date('Y-m-d', strtotime($input->get('desde')));
			$privateService->date_to = date('Y-m-d', strtotime($input->get('hasta')));
			$privateService->out_motivation = $input->get('causa');
			$privateService->work_file_id = $trabajo->id;

			$privateService->save();

			return array('status' => 0 ,'response' => 'success', 'private_service' => $privateService->id);
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function saveCongratulation(){
		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}
		try {
			


			if ($input->get('var_id'))
				$mention = MentionsCongrats::find($input->get('var_id'));
			else
				$mention = new MentionsCongrats;
			
			$mention->jurisdiction = $input->get('jurisdiccion');
			$mention->organization = $input->get('organismo');
			$mention->motivation = $input->get('motivo');
			$mention->observation = $input->get('concepto');
			$mention->act_number = $input->get('numero');
			$mention->mention_date = date('Y-m-d', strtotime($input->get('fecha')));
			$mention->administrative_act_id = $input->get('acto');
			$mention->work_file_id = $trabajo->id;

			$mention->save();

			return array('status' => 0 ,'response' => 'success', 'mention' => $mention->id);
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function saveSeizure(){
		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}
		try {
			

			
			if ($input->get('var_id'))
				$seizure = Seizure::find($input->get('var_id'));
			else
				$seizure = new Seizure;

			$seizure->expedient_number = $input->get('expediente');
			$seizure->date_from = date('Y-m-d', strtotime($input->get('hasta')));
			$seizure->charter = $input->get('fuero');
			$seizure->tribunal = $input->get('juzgado');
			$seizure->secretary = $input->get('secretaria');
			$seizure->cars = $input->get('autos');
			$seizure->ammount = $input->get('monto');
			$seizure->worked = $input->get('trabajado');
			$seizure->earned = $input->get('levantado');
			$seizure->work_file_id = $trabajo->id;

			$seizure->save();

			return array('status' => 0 ,'response' => 'success', 'seizure' => $seizure->id);
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}

	public function saveSanction(){
		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}
		try {
			


			if ($input->get('var_id'))
				$sanction = Sanction::find($input->get('var_id'));
			else
				$sanction = new Sanction;

			$sanction->institution = $input->get('organismo');
			$sanction->act_number = $input->get('numero');
			$sanction->sanction_date = date('Y-m-d', strtotime($input->get('fecha')));
			$sanction->disciplinary_action = $input->get('medida');
			$sanction->cause = $input->get('motivo');
			$sanction->santion_from = date('Y-m-d', strtotime($input->get('desde')));
			$sanction->sanction_to = date('Y-m-d', strtotime($input->get('hasta')));
			$sanction->administrative_act_id = $input->get('acto');
			$sanction->work_file_id = $trabajo->id;

			$sanction->save();

			return array('status' => 0 ,'response' => 'success', 'sanction' => $sanction->id);
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function savePerformanceEvaluation(){
		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}
		try {
			


			if ($input->get('var_id'))
				$evaluation = PerformanceEvaluation::find($input->get('var_id'));
			else
				$evaluation = new PerformanceEvaluation;
			
			$evaluation->year_evaluation = $input->get('ano');
			$evaluation->qualification = $input->get('calificacion');
			$evaluation->used = $input->get('utilizada');
			$evaluation->level = $input->get('nivel');
			$evaluation->grade_evaluation = $input->get('grado');
			$evaluation->bonification = $input->get('bonificacion');
			$evaluation->notification = date('Y-m-d', strtotime($input->get('notificacion')));
			$evaluation->observations = $input->get('observaciones');
			$evaluation->work_file_id = $trabajo->id;
			
			$evaluation->save();

			return array('status' => 0 ,'response' => 'success', 'evaluation' => $evaluation->id);
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function saveCapacitationCredit(){
		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}

		try {
			


			if ($input->get('var_id'))
				$capacitation = CapacitationCredit::find($input->get('var_id'));
			else
				$capacitation = new CapacitationCredit;

			$capacitation->year_credit = $input->get('ano2');
			$capacitation->credit_quantity = $input->get('cantidad');
			$capacitation->credit_used = $input->get('utilizados2');
			$capacitation->credit_total = $input->get('total');
			$capacitation->validity_date = date('Y-m-d', strtotime($input->get('vigencia')));
			$capacitation->observations = $input->get('observaciones2');
			$capacitation->work_file_id = $trabajo->id;
			
			$capacitation->save();

			return array('status' => 0 ,'response' => 'success', 'capacitation' => $capacitation->id);
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	function obtenerWorkFile(){
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){
				return $trabajo;
			}else {
				return null;
			}
		}else{
			return null;
		}
	}
	public function saveAdministrativeHistory(){
		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}
		try {
			

			if ($input->get('var_id'))
				$administrative = AdministrativeHistory::find($input->get('var_id'));
			else
				$administrative = new AdministrativeHistory;
			
			$administrative->stretch_id = $input->get('escalafon');
			$administrative->grouping_id = $input->get('agrupamiento');
			$administrative->category_id = $input->get('nivel');
			$administrative->scale_id = $input->get('grado');
			$administrative->act_number = $input->get('numero');
			$administrative->act_date = date('Y-m-d', strtotime($input->get('fecha')));
			$administrative->date_from = date('Y-m-d', strtotime($input->get('desde')));
			$administrative->motivation = $input->get('motivo');
			$administrative->administrative_act_id = $input->get('acto');
			$administrative->work_file_id = $trabajo->id;
		
			//	INCONSISTENCIA--- CON VALOR TRAMO
			
			$administrative->save();

			return array('status' => 0 ,'response' => 'success', 'administrative' => $administrative->id);
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}

	public function saveOchestra(){
		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}
		try {
			


			if ($input->get('var_id'))
				$ochestra = Ochestra::find($input->get('var_id'));
			else
				$ochestra = new Ochestra;
			
			$ochestra->stretch_id = $input->get('escalafon');
			$ochestra->grouping_id = $input->get('agrupamiento');
			$ochestra->category_id = $input->get('nivel');
			$ochestra->scale_id = $input->get('grado');
			$ochestra->act_number = $input->get('numero');
			$ochestra->act_date = date('Y-m-d', strtotime($input->get('fecha')));
			$ochestra->date_from = date('Y-m-d', strtotime($input->get('desde')));
			$ochestra->motivation = $input->get('motivo');
			$ochestra->administrative_act_id = $input->get('acto');
			$ochestra->work_file_id = $trabajo->id;
				
			$ochestra->save();

			return array('status' => 0 ,'response' => 'success', 'ochestra' => $ochestra->id);
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}

	public function saveIT(){

		$input = Input::json();
		
		if ($input->get('var_id')){
			$course = ItCourse::find($input->get('var_id'));
			$course->it_level_id = $input->get('level');
			$course->it_area_id = $input->get('area');
			
			$course->save();
			return array('status' => 0 ,'response' => 'success');
		}else{
			$course = new ItCourse;
		
			$course->it_level_id = $input->get('level');
			$course->it_area_id = $input->get('area');

			try {
				$course->save();

				$course_file = new WorkFileItCourse;
				$course_file->work_file_id = $input->get('id_work_file');
				$course_file->it_course_id = $course->id;
				$course_file->save();

				return array('status' => 0 ,'response' => 'success');
			} catch (Exception $e) {
				return array('status' => 1 ,'response' => $e->getMessage());	
			}
		}
	}
	
	public function saveAdditionalKnowledge(){

		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}
		if ($input->get('var_id'))
			$additional = WorkFileAdditionalKnowledge::find($input->get('var_id'));
		else
			$additional = new WorkFileAdditionalKnowledge;
				
		$additional->publication		= $input->get('tiene-publicacion');
		$additional->publication_name	= $input->get('nombre-publicacion');
		$additional->publication_date	= date('Y-m-d', strtotime($input->get('fecha-publicacion')));
		$additional->teaching			= $input->get('docencia');
		$additional->education_level_id	= $input->get('n-educativo');
		$additional->departament		= $input->get('especialidad-materia');
		$additional->intitution			= $input->get('institucion');
		$additional->work_file_id		= $trabajo->id;
		
		try{
			$additional->save();
			
			return array('status' => 0 ,'response' => 'success');
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}
	
	public function saveLicenciaExamen(){
		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}
		if ($input->get('var_id')){
			$examen = LicenseExam::where('license_id', '=', $input->get('var_id'))->first();			
			$licencia = License::find($input->get('var_id'));	

		}else
			$licencia = new License;
				
		$licencia->license_scale_id	= $input->get('escalafon-le');
		$licencia->work_file_id		= $trabajo->id;
				
		try{
			$licencia->save();

			if (!$input->get('var_id'))
				$examen = new LicenseExam;	

			$examen->lastname = $input->get('apellido-le');
			$examen->firstname = $input->get('nombre-le');
			$examen->exam_date = date('Y-m-d', strtotime($input->get('fecha-examen-le')));
			$examen->exam_from = date('Y-m-d', strtotime($input->get('fecha-examen-desde-le')));
			$examen->exam_to = date('Y-m-d', strtotime($input->get('fecha-examen-hasta-le')));
			$examen->total_ability_days = $input->get('total-dias-le');
			$examen->matter = $input->get('materia-le');
			$examen->cathedra = $input->get('catedra-le');
			$examen->establishment = $input->get('nombre-establecimiento-le');
			$examen->license_id = $licencia->id;

			$examen->save();
			
			return array('status' => 0 ,'response' => 'success');
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}
	
	public function saveLicenciaAusencia(){
		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}
		if ($input->get('var_id')){
			$absent = LicenseAbsent::where('license_id', '=', $input->get('var_id'))->first();
			$licencia = License::find($input->get('var_id'));	
		}else
			$licencia = new License;
				
		$licencia->license_scale_id	= $input->get('escalafon-la');
		$licencia->work_file_id		= $trabajo->id;
				
		try{
			$licencia->save();

			if (!$input->get('var_id'))
				$absent = new LicenseAbsent;	
						
			$absent->lastname = $input->get('apellido-la');
			$absent->firstname = $input->get('nombre-la');
			$absent->absent_date = date('Y-m-d', strtotime($input->get('fecha-ausencia-la')));	
			$absent->license_id = $licencia->id;
			
			$absent->save();
			
			return array('status' => 0 ,'response' => 'success');
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}
	
	public function saveLicenciaMedica(){
		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}
		if ($input->get('var_id')){
			$medical = LicenseMedical::where('license_id', '=', $input->get('var_id'))->first();
			$licencia = License::find($input->get('var_id'));	
		}else
			$licencia = new License;
				
		$licencia->license_scale_id	= $input->get('escalafon-lm');
		$licencia->work_file_id		= $trabajo->id;
				
		try{
			$licencia->save();

			if (!$input->get('var_id'))
				$medical = new LicenseMedical;
						
			$medical->agent_firstname = $input->get('nombre-lm');
			$medical->agent_lastname = $input->get('apellido-lm');
			$medical->date_from = date('Y-m-d', strtotime($input->get('fecha-licencia-lm')));	
			$medical->matter = $input->get('materia-lm');	
			$medical->domicile = $input->get('domicilio-lm');	
			$medical->phone = $input->get('telefono-lm');	
			$medical->clinic_name = $input->get('nombre-centro-lm');	
			$medical->clinic_domicile = $input->get('domicilio-centro-lm');	
			$medical->clinic_phone = $input->get('tel-centro-lm');	
			$medical->license_id = $licencia->id;		
			
			$medical->save();
			
			return array('status' => 0 ,'response' => 'success');
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}
	
	public function saveLicenciaMedicaFamiliar(){
		$input = Input::json();
		$trabajo=null;
		//obtengo el empleado
		$empleado= Session::get('employee_id');
		if(isset( $empleado)){
			$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
			if(isset($trabajo)){

			}else {
				return array('status' => 1, 'response' => 'Primero se tiene que completar la seccion Laboral');
			}
		}else{
			return array('status' => 1, 'response' => 'Primero se tiene que dar de alta el empleado');
		}
		if ($input->get('var_id')){
			$medical = LicenseMedicalFamily::where('license_id', '=', $input->get('var_id'))->first();
			$licencia = License::find($input->get('var_id'));	
		}else
			$licencia = new License;
				
		$licencia->license_scale_id	= $input->get('escalafon-lf');
		$licencia->work_file_id		= $trabajo->id;
				
		try{
			$licencia->save();

			if (!$input->get('var_id'))
				$medical = new LicenseMedicalFamily;
						
			$medical->agent_firstname = $input->get('nombre-lf');
			$medical->agent_lastname = $input->get('apellido-lf');
			$medical->date_from = date('Y-m-d', strtotime($input->get('fecha-licencia-lf')));	
			$medical->family_fullname = $input->get('nombre-completo-familiar-lf');	
			$medical->family_parent = $input->get('relacion-lf');	
			$medical->family_domicile = $input->get('domicilio-lf');	
			$medical->family_phone = $input->get('telefono-familiar-lf');	
			$medical->clinic_name = $input->get('nombre-centro-lf');	
			$medical->clinic_domicile = $input->get('domicilio-centro-lf');	
			$medical->clinic_phone = $input->get('tel-centro-lf');	
			$medical->license_id = $licencia->id;		
			
			$medical->save();
			
			return array('status' => 0 ,'response' => 'success');
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}
	
	public function showEmployees(){

		$empleados = $this->employee->with('city', 'city.country', 'document_type', 'adresses', 'status', 'contactTypes', 'contactTypes.type', 'work_file', 'work_file.status', 'work_file.education', 'work_file.courses', 'work_file.languages')->get();
		
		return array('employees' => $empleados);
	}

	public function getCities(){
		$id = Input::get('id_pais');
		return City::where('country_id','=',$id)->get();
	}

	public function getOffices(){
		$id = Input::get('id_building');
		return Office::where('building_id','=',$id)->get();
	}


	public function getContactTypes(){
		try{
			$contactos = EmployeeContactType::where('employee_id','=',Input::get('id'))->with('contact_type')->get();
			return array('status' => 0 ,'contacts' => $contactos);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getAdressesByEmployee(){
		try{
			$employee_adress = EmployeeAdress::where('employee_id','=',Input::get('id'))->with('adresses', 'adresses.province','adresses.locality','adresses.split')->get();
			return array('status' => 0 ,'adresses' => $employee_adress);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getFamily(){
		try{
			$family = Family::where('employee_id','=', Input::get('id'))->with('kinship', 'disability')->get();
			return array('status' => 0 ,'family' => $family);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getSchedules(){
		try{
			$family = WorkFileSchedule::where('work_file_id','=', Input::get('id'))->with('schedules', 'work_file', 'work_file.area', 'work_file.office', 'work_file.office.building', 'work_file.workFileJobStatus')->get();
			return array('status' => 0 ,'schedules' => $family);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getReview(){
		try{
			$review = Review::where('work_file_id','=', Input::get('id'))->with('scale', 'grouping', 'stretch', 'category')->get();
			
			return array('status' => 0 ,'review' => $review);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}
 	
 	public function getRoles(){
		try{
			$trabajo=null;
			$revista=null;
			$roles=null;
			//obtengo el empleado
			$empleado= Session::get('employee_id');
			if(isset( $empleado)){
				$trabajo= WorkFile::where('employee_id', '=', $empleado)->first();
				if(isset($trabajo)){
					$revista= Review::where('work_file_id','=',$trabajo->id)->first();
					if (isset($revista)) {
						$roles = ReviewRole::where('review_id','=', $revista->id)->with('role')->get();
					}
				}
			}
			return array('status' => 0 ,'roles' => $roles);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getEducation(){
		try{
			$education = WorkFileEducation::where('work_file_id','=', Input::get('id'))->with('education', 'education.level', 'education.status')->get();
			return array('status' => 0 ,'education' => $education);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getCourses(){
		try{
			$courses = WorkFileCourse::where('work_file_id','=', Input::get('id'))->with('course')->get();
			return array('status' => 0 ,'courses' => $courses);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getCongresses(){
		try{
			$congresses = WorkFileCongress::where('work_file_id','=', Input::get('id'))->with('congress')->get();
			return array('status' => 0 ,'congresses' => $congresses);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getLanguages(){
		try{
			$languages = WorkFileLanguage::where('work_file_id','=', Input::get('id'))->with('language')->get();
			return array('status' => 0 ,'languages' => $languages);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getEmployeeStatus(){
		try{
			$statuses = EmployeeStatus::where('employee_id','=', Input::get('id'))->with('status', 'User')->get();
			return array('status' => 0 ,'statuses' => $statuses);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getEmployeeMedical(){
		try{
			$medical = MedicalData::where('employee_id','=', Input::get('id'))->with('medicaSocial', 'art', 'prepaid', 'disability', 'disability.disabilityType')->get();
						
			return array('status' => 0 ,'medical' => $medical);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}
	
	public function getDisabilitiesHistory(){
		try{
			$medical = MedicalData::where('employee_id','=', Input::get('id'))->get();
			$disability = Disability::where('medical_data_id', '=', $medical[0]->id)->with('disabilityType')->get();
		
			return array('status' => 0 ,'disability' => $disability);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}
	
	public function getPublicServicesHistory(){
		try{

			$work_file = WorkFile::where('employee_id', '=', Input::get('id'))->orderBy('id', 'desc')->first();
			
			$publicServices = PublicService::where('work_file_id','=', $work_file->id)->with('administrativeAct', 'review.grouping', 'review.scale')->get();

			return array('status' => 0 ,'publicServices' => $publicServices);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getPrivateServicesHistory(){
		try{

			$work_file = WorkFile::where('employee_id', '=', Input::get('id'))->orderBy('id', 'desc')->first();
			
			$privateServices = PrivateService::where('work_file_id','=', $work_file->id)->get();

			return array('status' => 0 ,'privateServices' => $privateServices);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getCongratulationsHistory(){
		try{

			$work_file = WorkFile::where('employee_id', '=', Input::get('id'))->orderBy('id', 'desc')->first();
			
			$congratulations = MentionsCongrats::where('work_file_id','=', $work_file->id)->with('administrativeAct')->get();
			
			return array('status' => 0 ,'congratulations' => $congratulations);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getSanctionsHistory(){
		try{

			$work_file = WorkFile::where('employee_id', '=', Input::get('id'))->orderBy('id', 'desc')->first();
			
			$sanctions = Sanction::where('work_file_id','=', $work_file->id)->with('administrativeAct')->get();
			
			return array('status' => 0 ,'sanctions' => $sanctions);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getSeizuresHistory(){
		try{

			$work_file = WorkFile::where('employee_id', '=', Input::get('id'))->orderBy('id', 'desc')->first();
			
			$seizure = Seizure::where('work_file_id','=', $work_file->id)->get();
			
			return array('status' => 0 ,'seizure' => $seizure);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getPerformanceEvaluationHistory(){
		try{

			$work_file = WorkFile::where('employee_id', '=', Input::get('id'))->orderBy('id', 'desc')->first();
			
			$evaluations = PerformanceEvaluation::where('work_file_id','=', $work_file->id)->get();
			
			return array('status' => 0 ,'evaluations' => $evaluations);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getCapacitationHistory(){
		try{

			$work_file = WorkFile::where('employee_id', '=', Input::get('id'))->orderBy('id', 'desc')->first();
			
			$capacitations = CapacitationCredit::where('work_file_id','=', $work_file->id)->get();
			
			return array('status' => 0 ,'capacitations' => $capacitations);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getAdministrativeCareerHistory(){
		try{

			$work_file = WorkFile::where('employee_id', '=', Input::get('id'))->orderBy('id', 'desc')->first();
			
			$careers = AdministrativeHistory::where('work_file_id','=', $work_file->id)->with('administrativeAct', 'scale', 'grouping', 'stretch')->get();
			
			return array('status' => 0 ,'careers' => $careers);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getExtraHistory(){
		try{

			$work_file = WorkFile::where('employee_id', '=', Input::get('id'))->orderBy('id', 'desc')->first();
			
			$extras = Ochestra::where('work_file_id','=', $work_file->id)->with('administrativeAct', 'scale', 'grouping', 'category')->get();
			
			return array('status' => 0 ,'extras' => $extras);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function getItCourses(){
		try{
			$courses = WorkFileItCourse::where('work_file_id','=', Input::get('id'))->with('course','course.level', 'course.area')->get();
			return array('status' => 0 ,'courses' => $courses);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}
	
	public function getAdditionalKnowledgeHistory(){
		try{
			$additional = WorkFileAdditionalKnowledge::where('work_file_id','=', Input::get('id'))->with('WorkFile', 'EducationLevel')->get();
			return array('status' => 0 ,'additional' => $additional);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}
	
	public function getLicenciaExamenHistory(){
		try{

			$examen = WorkFile::where('employee_id', '=', Input::get('id'))
						->join('license', 'license.work_file_id', '=', 'work_file.id')
						->join('license_exam', 'license_exam.license_id', '=', 'license.id')
						->join('license_scale', 'license_scale.id', '=', 'license.license_scale_id')->get();

			return array('status' => 0 ,'examen' => $examen);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}
	
	public function getLicenciaAvisoHistory(){
		try{

			$aviso = WorkFile::where('employee_id', '=', Input::get('id'))
						->join('license', 'license.work_file_id', '=', 'work_file.id')
						->join('license_absent', 'license_absent.license_id', '=', 'license.id')
						->join('license_scale', 'license_scale.id', '=', 'license.license_scale_id')->get();
		
			return array('status' => 0 ,'aviso' => $aviso);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}
	
	public function getLicenciaMedicaHistory(){
		try{

			$medical = WorkFile::where('employee_id', '=', Input::get('id'))
						->join('license', 'license.work_file_id', '=', 'work_file.id')
						->join('license_medical', 'license_medical.license_id', '=', 'license.id')
						->join('license_scale', 'license_scale.id', '=', 'license.license_scale_id')->get();
		
			return array('status' => 0 ,'medical' => $medical);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}
	
	public function getLicenciaMedicaFamiliarHistory(){
		try{

			$family = WorkFile::where('employee_id', '=', Input::get('id'))
						->join('license', 'license.work_file_id', '=', 'work_file.id')
						->join('license_medical_family', 'license_medical_family.license_id', '=', 'license.id')
						->join('license_scale', 'license_scale.id', '=', 'license.license_scale_id')->get();
		
			return array('status' => 0 ,'family' => $family);
		}
		catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function deleteContactType(){

		try {
			$contact_type = EmployeeContactType::where('id_employee_contact_type', '=', Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}

		
	}

	public function deleteAdress(){

		try {
			$adress = Adress::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}
	}

	public function deleteFamily(){

		try {
			$adress = Family::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch (Exception $e) {
			return array('status' => 1 ,'response' => $e->getMessage());	
		}	
	}

	public function deleteSchedule(){
		try{
			$schedule = Schedule::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}


	public function deleteDisability(){
		try{
			$disability = Disability::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}

	public function deletePublicService(){
		try{
			$publicService = PublicService::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}

	public function deletePrivateService(){
		try{
			$privateService = PrivateService::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}

	public function deleteCongrat(){
		try{
			$mentionsCongrats = MentionsCongrats::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}

	public function deleteSanction(){
		try{
			$sanction = Sanction::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}

	public function deleteSeizure(){
		try{
			$seizure = Seizure::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}

	public function deletePerformanceEvaluation(){
		try{
			$performanceEvaluation = PerformanceEvaluation::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}

	public function deleteCapacitation(){
		try{
			$capacitation = CapacitationCredit::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}

	public function deleteAdministrativeCareer(){
		try{
			$administrativeHistory = AdministrativeHistory::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}

	public function deleteExtra(){
		try{
			$ochestra = Ochestra::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}

	public function deleteReview(){
		try{

			$role = Review::find(Input::get('id'))->delete(); //find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function deleteRole(){
		try{

			$role = ReviewRole::where('id_review_role', '=', Input::get('id'))->delete(); //find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function deleteEducation(){
		try{

			$education = WorkFileEducation::where('id_work_file_education', '=', Input::get('id'))->delete();;
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function deleteCourse(){
		try{
			//dd(Input::get('id'));
			$course = WorkFileCourse::where('course_id','=', Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function deleteCongress(){
		try{
			//dd(Input::get('id'));
			$course = WorkFileCongress::where('congress_id','=', Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function deleteLanguage(){
		try{
			$language = WorkFileLanguage::where('language_id','=', Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function deleteItCourse(){
		try{
			$course = WorkFileItCourse::where('it_course_id','=', Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function deleteAdditionalKnowledge(){
		try{
			$additional = WorkFileAdditionalKnowledge::find(Input::get('id'))->delete();
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function deleteLicenciaExamen(){
		try{
			$exam = LicenseExam::where('license_id', Input::get('id'))->first();

			$license_id = $exam->license_id;
			
			$license = License::find($license_id);
			
			$exam->delete();
			$license->delete();
			
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function deleteLicenciaAviso(){
		try{
			$absent = LicenseAbsent::where('license_id', Input::get('id'))->first();

			$license_id = $absent->license_id;
			
			$license = License::find($license_id);
			
			$absent->delete();
			$license->delete();
			
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function deleteLicenciaMedica(){
		try{
			$medical = LicenseMedical::where('license_id', Input::get('id'))->first();

			$license_id = $medical->license_id;
			
			$license = License::find($license_id);
			
			$medical->delete();
			$license->delete();
			
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function deleteLicenciaMedicaFamiliar(){
		try{
			$medicalFamily = LicenseMedicalFamily::where('license_id', Input::get('id'))->first();

			$license_id = $medicalFamily->license_id;
			
			$license = License::find($license_id);
			
			$medicalFamily->delete();
			$license->delete();
			
			return array('status' => 0 ,'response' => 'Borrado con exito');
		} catch(Exception $e){
			return array('status' => 1 ,'response' => $e->getMessage());
		}
	}
	
	public function checkDocument(){
		$document = Input::get('document');
		$id_legajo = Input::get('id_legajo');
		if ($id_legajo != ""){
			$employee = Employee::find($id_legajo);
			
			if ($employee->document != $document){
				// VERIFICAR QUE NUEVO DOCUMENTO NO EXISTA
				$newEmployee = Employee::where('document', '=', $document)->get();
				if ($newEmployee->count() > 0)
					return "false";
				return "true";
			}else
				return "true";			
		}else{
			$employee = Employee::where('document', '=', $document)->get();
			if ($employee->count() > 0)
				return "false";
			return "true";
		}
	}

	public function checkCUIL(){
		$cuil = Input::get('cuil');

		$cadena = str_replace("-", "", $cuil);

		if (strlen($cadena) == 11){

	        $result = $cadena[0]*5;
	        $result += $cadena[1]*4;
	        $result += $cadena[2]*3;
	        $result += $cadena[3]*2;
	        $result += $cadena[4]*7;
	        $result += $cadena[5]*6;
	        $result += $cadena[6]*5;
	        $result += $cadena[7]*4;
	        $result += $cadena[8]*3;
	        $result += $cadena[9]*2;

	        $div = intval($result/11);
	        $resto = $result - ($div*11);

	        if($resto==0){
	            if($resto==$cadena[10]){
	                return "true";
	            }else{
	                return "false";
	            }
	        }elseif($resto==1){
	            if($cadena[10]==9 AND $cadena[0]==2 AND $cadena[1]==3){
	                return "true";
	            }elseif($cadena[10]==4 AND $cadena[0]==2 AND $cadena[1]==3){
	                return "true";
	            }
	        }elseif($cadena[10]==(11-$resto)){
	            return "true";
	        }else{
	            return "false";
	        }
    	}
    	return "false";
	}

	public function exportPDF($id){
		$empleado = $this->employee->with('city', 'city.country', 'document_type', 'adresses', 'contactTypes', 'contactTypes.type', 'work_file', 'status')->find($id);
	    
	    $employee_status = $this->employee_status->where('employee_id', '=', $id)->orderBy('id_employee_status', 'desc')->with('status')->first();
		$contactos = EmployeeContactType::where('employee_id','=', $id)->with('contact_type')->get();	
		$employee_address = EmployeeAdress::where('employee_id','=', $id)->with('adresses', 'adresses.province','adresses.locality','adresses.split')->get();
		
		$disabilities = MedicalData::where('employee_id', '=', $id)
							->join('disability', 'disability.medical_data_id', '=', 'medical_data.id')
							->join('disability_type', 'disability_type.id', '=', 'disability.disability_type_id')->get();
							
		$families = Family::where('employee_id','=', $id)->with('kinship', 'disability')->get();	
		$schedules = WorkFile::where('employee_id','=', $id)->with('area', 'office', 'office.building')
						->join('work_file_schedule', 'work_file_schedule.work_file_id', '=', 'work_file.id')
						->join('schedule', 'schedule.id', '=', 'work_file_schedule.schedule_id')
						->get(); 
		
		$ids = array();
		$workfiles = WorkFile::where('employee_id','=', $id)->get();
		foreach($workfiles as $workfile){
			array_push($ids, $workfile->id);
		}
		
		$reviews = Review::whereIn('work_file_id', $ids)->with('scale', 'grouping', 'stretch')->get();
		$educations = WorkFileEducation::whereIn('work_file_id', $ids)->with('education', 'education.level', 'education.status')->get();
		$courses = WorkFileCourse::whereIn('work_file_id', $ids)->with('course')->get();
		$congresses = WorkFileCongress::whereIn('work_file_id', $ids)->with('congress')->get();
		$languages = WorkFileLanguage::whereIn('work_file_id', $ids)->with('language')->get();
		$informatics = WorkFileItCourse::whereIn('work_file_id', $ids)->with('course', 'course.level', 'course.area')->get();
		$additionals = WorkFileAdditionalKnowledge::whereIn('work_file_id', $ids)->with('educationLevel')->get();
		$publicServices = PublicService::whereIn('work_file_id', $ids)->with('administrativeAct', 'reviewSituation')->get();
		$privateServices = PrivateService::whereIn('work_file_id', $ids)->get();
		$congratulations = MentionsCongrats::whereIn('work_file_id', $ids)->with('administrativeAct')->get();
		$sanctions = Sanction::whereIn('work_file_id', $ids)->with('administrativeAct')->get();
		$seizures = Seizure::whereIn('work_file_id', $ids)->get();
		$evaluations = PerformanceEvaluation::whereIn('work_file_id', $ids)->get();
		$capacitations = CapacitationCredit::whereIn('work_file_id', $ids)->get();
		$capacitations = CapacitationCredit::whereIn('work_file_id', $ids)->get();
		$historics = AdministrativeHistory::whereIn('work_file_id', $ids)->with('scale', 'grouping', 'stretch', 'administrativeAct')->get();
		$ochestras = Ochestra::whereIn('work_file_id', $ids)->with('administrativeAct', 'scale', 'grouping', 'category', 'stretch')->get();
		$exams = WorkFile::where('employee_id', '=', $id)
							->join('license', 'license.work_file_id', '=', 'work_file.id')
							->join('license_exam', 'license_exam.license_id', '=', 'license.id')
							->join('license_scale', 'license_scale.id', '=', 'license.license_scale_id')->get();

		$absents = WorkFile::where('employee_id', '=', $id)
							->join('license', 'license.work_file_id', '=', 'work_file.id')
							->join('license_absent', 'license_absent.license_id', '=', 'license.id')
							->join('license_scale', 'license_scale.id', '=', 'license.license_scale_id')->get();

		$medicals = WorkFile::where('employee_id', '=', $id)
							->join('license', 'license.work_file_id', '=', 'work_file.id')
							->join('license_medical', 'license_medical.license_id', '=', 'license.id')
							->join('license_scale', 'license_scale.id', '=', 'license.license_scale_id')->get();

		$medical_families = WorkFile::where('employee_id', '=', $id)
							->join('license', 'license.work_file_id', '=', 'work_file.id')
							->join('license_medical_family', 'license_medical_family.license_id', '=', 'license.id')
							->join('license_scale', 'license_scale.id', '=', 'license.license_scale_id')->get();

   		$html = View::make("export-legajo", compact('empleado', 'employee_status', 'contactos', 'employee_address', 'disabilities', 'families', 'schedules', 'reviews', 'educations', 'courses', 'congresses', 'languages', 'informatics', 'additionals', 'publicServices', 'privateServices', 'congratulations', 'sanctions', 'seizures', 'evaluations', 'capacitations', 'historics', 'ochestras', 'exams', 'absents', 'medicals', 'medical_families'));
    	
    	return PDF::load($html, 'Letter', 'portrait')->show();
	}
}
