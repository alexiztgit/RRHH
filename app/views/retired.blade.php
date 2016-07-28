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

            	 @include('menu', array('some'=>'data')) 
                
                <div class="tab-content">
                  <!--Comienza Estructura-->
                    <div role="tabpanel" class="tab-pane active" id="personal-activo">
                       <div class="panel panel-primary">
                            <div class="panel-heading">Personal Inactivo</div>
                                <div class="panel-body">
                                	<div class="container-fluid">

                                      <row>
                                      <div class="col-md-12" id="active-employee">
                                        <table class="table table-hover" id="tblPersonalActivo">
                                          <thead>
                                            <tr>
                                              <th>Legajo</th>
                                              <th>Nombres</th>
                                              <th>Apellidos</th>
                                              <th>Documento de Identidad</th>
                                              <th class="col-md-3" align="center">Opciones</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                            <?php 
                                            foreach ($empleados as $e) { 
                                              if (@$e->last_status->status_id == 2){ ?>
                                              <tr>
                                                <td><?=$e['id']?></td>
                                                <td><?=$e['name']?></td>
                                                <td><?=$e['lastname']?></td>
                                                <td><?=$e['document']?></td>
                                                <td class="col-md-3">
                                                    
                                                    <!--<a href='/legajo/?=$e['id']?>/exportPDF' target="_blank" class="btn btn-primary" aria-label="Left Align"> -->
                                                    <a  target="_blank" class="btn btn-primary" aria-label="Left Align">
                                                      <span class="glyphicon glyphicon-print" aria-hidden="true"></span> Imp
                                                    </a>
                                                    <button id="edit" onclick="location.href='/legajo/<?=$e['id']?>/edit';" type="button" class="btn btn-primary" aria-label="Left Align">
                                                      <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Editar
                                                    </button>
                                                    <button id="see" onclick="location.href='/legajo/<?=$e['id']?>/view';" type="button" class="btn btn-primary" aria-label="Left Align">
                                                      <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> Ver
                                                    </button>
                                                </td>
                                              </tr>
                                              <?php
                                              }
                                            }
                                            ?>
                                          </tbody>
                                        </table>
                                      </div>
                                      </row> 
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
	
	<script>
	$(document).ready(function(){
		$("#tblPersonalActivo").DataTable({
			"paging":   true,
			"ordering": true,
			"info":     true,
			"language": {
				"url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
			}
		})
	})
	</script>
    </body>
</html>

