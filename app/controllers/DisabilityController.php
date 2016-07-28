<?php 

class DisabilityController extends BaseController {

  /**
   * Display a listing of the resource.
   *
   * @return Response
   */

protected $disability;

public function __construct(Disability $disability)
  {
    $this->disabilityT = $disability;
  }

  public function index()
  {
	  return $this->disability->all(); 
  }

  /**
   * Show the form for creating a new resource.
   *
   * @return Response
   */
  public function create()
  {
   return View::make('disability.create'); 
  }

  /**
   * Store a newly created resource in storage.
   *
   * @return Response
   */
  public function store()
  {
  	var_dump(Input::all());
  	$disability = new Disability;
  	$disability->name = Input::get('name');
  	$disability->save();

  }

  /**
   * Display the specified resource.
   *
   * @param  int  $id
   * @return Response
   */
  public function show($id)
  {
    $disability = Disability::find($id);
    return $disability;
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
