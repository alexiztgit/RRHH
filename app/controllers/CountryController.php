<?php 

class CountryController extends BaseController {

  /**
   * Display a listing of the resource.
   *
   * @return Response
   */

protected $country;

public function __construct(Country $country)
  {
    $this->country = $country;
  }

  public function index()
  {
    $paises = $this->country->all();
	  return $paises;
  }

  /**
   * Show the form for creating a new resource.
   *
   * @return Response
   */
  public function create()
  {
   return View::make('country.create'); 
  }

  /**
   * Store a newly created resource in storage.
   *
   * @return Response
   */
  public function store()
  {
	var_dump(Input::all());
	$country = new Country;
	$country->name = Input::get('name');
	$country->save();

//	$this->country->create(array('id' => '2', 'name' => 'Argentina'));
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
