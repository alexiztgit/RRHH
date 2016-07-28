<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Hospital Posadas</title>
        <meta name="description" content="Login">
        <link rel="stylesheet" href="{{ URL::asset('css/bootstrap.css'); }}">
        <link rel="stylesheet" href="{{ URL::asset('css/bootstrap-datetimepicker.min.css'); }}">
        <link rel="stylesheet" href="{{ URL::asset('css/main.css'); }}">
        <link rel="stylesheet" href="{{ URL::asset('css/datatables.min.css'); }}">
    </head>
    <body>
           
        <div class="container">
            <div role="tabpanel" class="tab-pane active" id="dotacion">

            	 @include('menu', array('page'=>'structure')) 

                <div class="tab-content">
<!--Comienza Estructura-->
                    <div role="tabpanel" class="tab-pane" id="estructura">
                       <div class="panel panel-primary">
                          <div class="panel-heading">Estructura</div>
                            <div class="panel-body">
								              <div class="row">
                                <div class="col-md-2">
                                                          
                                </div>
                                <div class="col-md-2">
                                                     
                                </div>
                                <div class="col-md-2">
                                    
                                </div>
                                <div class="col-md-2">
                                    
                                </div>
                                <div class="col-md-2">
                                    
                                </div>
                                <div class="col-md-2">
                                    
                                </div>
                             </div>
                                   
                              </div>
                          </div>
                     </div>
<!--FIN Estructura-->      
        		</div><!--content-->
          </div><!--dotación-->


        </div><!--container-->


    <!-- Include all compiled plugins (below), or include individual files as needed -->
    {{ HTML::script('js/jquery.min.js') }}
    {{ HTML::script('js/bootstrap.min.js') }}
    {{ HTML::script('js/moment.min.js') }}
    {{ HTML::script('js/datatables.min.js') }}
    {{ HTML::script('js/bootstrap-datetimepicker.min.js') }}
    {{ HTML::script('js/jquery.validate.min.js') }}
    {{ HTML::script('js/bootstrap.file-input.js') }}
    {{ HTML::script('js/jquery.mask.min.js') }}
    {{ HTML::script('js/jquery.form.js') }}
    {{ HTML::script('js/jquery.price_format.2.0.min.js') }}
    {{ HTML::script('js/bootbox.min.js') }}
    {{ HTML::script('js/functions.js') }}
    {{ HTML::script('js/validations.js') }}

    </body>
</html>

