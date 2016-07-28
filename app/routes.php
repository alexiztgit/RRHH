<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', array(
    'as' => 'Admin',
    'before' => 'basicAuth|hasPermissions:viewlegajo',
    'uses' => 'HomeController@actived'
    )
);

Route::get('/legajo/new', 'HomeController@legajo');

Route::get('/actived', array(
	    'as' => 'actived',
	    'before' => 'basicAuth|hasPermissions:user.create',
	    'uses' => 'HomeController@actived'
	)
);

Route::get('/retired', array(
	    'as' => 'retired',
	    'before' => 'basicAuth|hasPermissions:user.create',
	    'uses' => 'HomeController@retired'
	)
);

Route::get('/structure', array(
	    'as' => 'structure',
	    'before' => 'basicAuth|hasPermissions:user.create',
	    'uses' => 'HomeController@structure'
	)
);

Route::get('/legajo/{id}/view', array(
	    'as' => 'view',
	    'before' => 'basicAuth|hasPermissions:user.create',
	    'uses' => 'HomeController@view'
	)
);

Route::get('/legajo/{id}/edit', array(
	    'as' => 'edit',
	    'before' => 'basicAuth|hasPermissions:user.create',
	    'uses' => 'EmployeeController@edit'
	)
);

Route::get('/legajo/{id}/exportPDF', array(
	    'as' => 'exportPDF',
	    'before' => 'basicAuth|hasPermissions:user.create',
	    'uses' => 'HomeController@exportPDF'
	)
);

Route::post('/deleteContactType', 'HomeController@deleteContactType');
Route::post('/deleteAdress', 'HomeController@deleteAdress');
Route::post('/deleteFamily', 'HomeController@deleteFamily');
Route::post('/deleteDisability', 'HomeController@deleteDisability');
Route::post('/deletePublicService', 'HomeController@deletePublicService');
Route::post('/deletePrivateService', 'HomeController@deletePrivateService');
Route::post('/deleteCongrat', 'HomeController@deleteCongrat');
Route::post('/deleteSanction', 'HomeController@deleteSanction');
Route::post('/deleteSeizure', 'HomeController@deleteSeizure');
Route::post('/deletePerformanceEvaluation', 'HomeController@deletePerformanceEvaluation');
Route::post('/deleteCapacitation', 'HomeController@deleteCapacitation');
Route::post('/deleteAdministrativeCareer', 'HomeController@deleteAdministrativeCareer');
Route::post('/deleteExtra', 'HomeController@deleteExtra');
Route::post('/deleteSchedule', 'HomeController@deleteSchedule');
Route::post('/deleteRole', 'HomeController@deleteRole');
Route::post('/deleteEducation', 'HomeController@deleteEducation');
Route::post('/deleteCourse', 'HomeController@deleteCourse');
Route::post('/deleteCongress', 'HomeController@deleteCongress');
Route::post('/deleteLanguage', 'HomeController@deleteLanguage');
Route::post('/deleteItCourse', 'HomeController@deleteItCourse');
Route::post('/deleteReview', 'HomeController@deleteReview');
Route::post('/deleteAdditionalKnowledge', 'HomeController@deleteAdditionalKnowledge');
Route::post('/deleteLicenciaExamen', 'HomeController@deleteLicenciaExamen');
Route::post('/deleteLicenciaAviso', 'HomeController@deleteLicenciaAviso');
Route::post('/deleteLicenciaMedica', 'HomeController@deleteLicenciaMedica');
Route::post('/deleteLicenciaMedicaFamiliar', 'HomeController@deleteLicenciaMedicaFamiliar');

Route::post('/savedata', 'HomeController@savePersonal');
Route::post('/savedata/{id}', 'HomeController@savePersonal');
Route::post('/savePhone', 'HomeController@savePhone');
Route::post('/saveAdress', 'HomeController@saveAdress');
Route::post('/saveMail', 'HomeController@saveMail');
Route::post('/saveMedicalInfo', 'HomeController@saveMedicalInfo');
Route::post('/saveMedicalInfo/{id}', 'HomeController@saveMedicalInfo');
Route::post('/saveFamily', 'HomeController@saveFamily');
Route::post('/saveWorkFile', 'HomeController@saveWorkFile');
Route::post('/saveReview', 'HomeController@saveReview');
Route::post('/saveRole', 'HomeController@saveRole');
Route::post('/saveEducation', 'HomeController@saveEducation');
Route::post('/saveCourse', 'HomeController@saveCourse');
Route::post('/saveCongress', 'HomeController@saveCongress');
Route::post('/saveLanguage', 'HomeController@saveLanguage');
Route::post('/savePublicService', 'HomeController@savePublicService');
Route::post('/savePrivateService', 'HomeController@savePrivateService');
Route::post('/saveCongratulation', 'HomeController@saveCongratulation');
Route::post('/saveSanction', 'HomeController@saveSanction');
Route::post('/saveSeizure', 'HomeController@saveSeizure');
Route::post('/savePerformanceEvaluation', 'HomeController@savePerformanceEvaluation');
Route::post('/saveCapacitationCredit', 'HomeController@saveCapacitationCredit');
Route::post('/saveAdministrativeHistory', 'HomeController@saveAdministrativeHistory');
Route::post('/saveOchestra', 'HomeController@saveOchestra');
Route::post('/saveIT', 'HomeController@saveIT');
Route::post('/saveAdditionalKnowledge', 'HomeController@saveAdditionalKnowledge');
Route::post('/saveLicenciaExamen', 'HomeController@saveLicenciaExamen');
Route::post('/saveLicenciaAusencia', 'HomeController@saveLicenciaAusencia');
Route::post('/saveLicenciaMedica', 'HomeController@saveLicenciaMedica');
Route::post('/saveLicenciaMedicaFamiliar', 'HomeController@saveLicenciaMedicaFamiliar');

Route::post('/updateWorkFile', 'HomeController@updateWorkFile');
Route::post('/updateReview', 'HomeController@updateReview');


//Mostrar empleados JSON

Route::get('/showEmployees', 'HomeController@showEmployees');
Route::get('/getEmployee/{id}', function($id)
{
	return Employee::where('id','=',$id)->get();
});

Route::post('/checkDocument', 'HomeController@checkDocument');
Route::post('/checkCUIL', 'HomeController@checkCUIL');

//Get contact types by EmployeeID 
Route::post('/getContactTypes','HomeController@getContactTypes');
Route::post('/getAdresses','HomeController@getAdressesByEmployee');	
Route::post('/getFamily','HomeController@getFamily');	
Route::post('/getSchedules','HomeController@getSchedules');	
Route::post('/getReview','HomeController@getReview');	
Route::post('/getRoles','HomeController@getRoles');	
Route::post('/getEducation','HomeController@getEducation');	
Route::post('/getCourses','HomeController@getCourses');	
Route::post('/getCongresses','HomeController@getCongresses');	
Route::post('/getLanguages','HomeController@getLanguages');	
Route::post('/getEmployeeStatus','HomeController@getEmployeeStatus');	
Route::post('/getEmployeeMedical','HomeController@getEmployeeMedical');	
Route::post('/getPublicServicesHistory','HomeController@getPublicServicesHistory');	
Route::post('/getPrivateServicesHistory','HomeController@getPrivateServicesHistory');	
Route::post('/getCongratulationsHistory','HomeController@getCongratulationsHistory');	
Route::post('/getSanctionsHistory','HomeController@getSanctionsHistory');	
Route::post('/getSeizuresHistory','HomeController@getSeizuresHistory');	
Route::post('/getPerformanceEvaluationHistory','HomeController@getPerformanceEvaluationHistory');	
Route::post('/getCapacitationHistory','HomeController@getCapacitationHistory');	
Route::post('/getAdministrativeCareerHistory','HomeController@getAdministrativeCareerHistory');	
Route::post('/getExtraHistory','HomeController@getExtraHistory');	
Route::post('/getItCourses','HomeController@getItCourses');	
Route::post('/getDisabilitiesHistory','HomeController@getDisabilitiesHistory');	
Route::post('/getAdditionalKnowledgeHistory','HomeController@getAdditionalKnowledgeHistory');	
Route::post('/getLicenciaExamenHistory','HomeController@getLicenciaExamenHistory');
Route::post('/getLicenciaAvisoHistory','HomeController@getLicenciaAvisoHistory');
Route::post('/getLicenciaMedicaHistory','HomeController@getLicenciaMedicaHistory');
Route::post('/getLicenciaMedicaFamiliarHistory','HomeController@getLicenciaMedicaFamiliarHistory');

Route::post('/showContact/{id}','EmployeeContactTypeController@show');
Route::post('/showAddress/{id}','AdressController@show');
Route::post('/showDisability/{id}','DisabilityController@show');
Route::post('/showPublicServices/{id}','PublicServicesController@show');

//Todos los paises
Route::get('/getCountries', function()
{
	return Country::all();
});
//Obtener ciudades x Pais
Route::post('/getCities', 'HomeController@getCities');
Route::post('/getOffices', 'HomeController@getOffices');

//Route::resource('test', 'TestController');

Route::resource('city', 'CityController');
Route::resource('country', 'CountryController');

Route::post('country/store', 'CountryController@store');

