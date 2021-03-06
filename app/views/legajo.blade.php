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
    </head>
    <body>  
        <div class="container">
            <div class="row bg-info navbar navbar-fixed-top" role="navigation">
                <div class="container" style="background-color: #d9edf7;padding-top: 10px;border: none">
                    <label id="employee-info"><?php echo (isset($empleado)) ? "Nombre del Empleado: " . $empleado->name . " " . $empleado->lastname . " | Legajo: " . $empleado->id  : "" ?></label>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane active" id="dotacion" style="margin-top:48px">
                
                @include('menu', array('some'=>'data')) 
                
                <div class="row">
                    <ul class="nav nav-tabs" id="menu">
                        <li role="presentation" class="active">
                            <a href="#datos-personales" aria-controls="datos-personales" role="tab" data-toggle="tab">Datos Personales</a>
                        </li>
                        <!-- <li role="presentation">
                            <a href="#datos-medicos" aria-controls="datos-medicos" role="tab" data-toggle="tab">Datos Médicos</a>
                        </li> -->
                        <li role="presentation">
                            <a  aria-controls="grupo-familiar" role="tab" data-toggle="tab">Grupo Familiar</a>
                            <!--
                            <a href="#grupo-familiar" aria-controls="grupo-familiar" role="tab" data-toggle="tab">Grupo Familiar</a>-->
                        </li>
                        <li role="presentation">
                            <!--
                            <a href="#laboral" aria-controls="laboral" role="tab" data-toggle="tab">Laboral</a>-->
                            <a  aria-controls="laboral" role="tab" data-toggle="tab">Laboral</a>
                        </li>
                        <li role="presentation">
                            <!--
                            <a href="#educacion" aria-controls="educacion" role="tab" data-toggle="tab">Educación</a>-->
                            <a  aria-controls="educacion" role="tab" data-toggle="tab">Educación</a>
                        </li>
                        <li role="presentation">
                        <!--
                            <a href="#carrera-administrativa" aria-controls="carrera-administrativa" role="tab" data-toggle="tab">Antecedentes Laborales</a>-->
                            <a aria-controls="carrera-administrativa" role="tab" data-toggle="tab">Antecedentes Laborales</a>
                        </li>
                         <li role="presentation">
                         <!--
                            <a href="#licencias" aria-controls="licencias" role="tab" data-toggle="tab">Licencias</a>-->
                            <a  aria-controls="licencias" role="tab" data-toggle="tab">Licencias</a>
                        </li>
                    </ul> 
                </div> 
                <div class="tab-content">

<!--Comienza datos personales-->
                    <div role="tabpanel" class="tab-pane active" id="datos-personales">
                        
                        <div class="panel panel-primary">
                            <div class="panel-heading">Legajo</div>
                            <form id="formPersonal">
                            {{ Form::open(array('id'=>'formPersonal','files' => 'true', 'url'=>'savedata' , 'name'=>'formPersonal')) }}

                                <div class="panel-body">

                                    <div class="row">
                                        
                                         <div class="col-md-3 text-left" >
                                            <img src="<?= (isset($empleado) && $empleado['photo']) ? "/upload/".$empleado['photo'] : '/img/male-female-profile-picture-vector-abstract-32171664.jpg' ?>" class="img-thumbnail" alt="photo" width="50%" height="50%">
                                        </div>
                                        <div class="col-md-3 col-md-offset-6 ">
                                            <div class="panel panel-default"  rows="3">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label for="legajo">Número de legajo</label>
                                                        <input type="text" readonly id="id_legajo" value="<?=(isset($empleado)) ? $empleado['id']: '';?>" class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                            
                                        
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="apellido">Apellido</label>
                                                <input type="text" class="form-control" value="<?=(isset($empleado)) ? $empleado['lastname']: '';?>" id="lastname" name="lastname">
                                            </div>                    
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="nombre">Nombre</label>
                                                <input type="text" class="form-control" value="<?=(isset($empleado)) ? $empleado['name']: '';?>" id="name" name="name">
                                            </div>                    
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="sexo">Sexo</label>
                                                <select class="form-control" name="sexo" id="sexo">
                                                  <option value="F" <?php if (isset($empleado) && $empleado['gender'] == 'F') echo "selected='selected'" ?>>Femenino</option>
                                                  <option value="M" <?php if (isset($empleado) && $empleado['gender'] == 'M') echo "selected='selected'" ?>>Masculino</option>
                                                  <option value="O" <?php if (isset($empleado) && $empleado['gender'] == 'O') echo "selected='selected'" ?>>Otro</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="cuil">CUIL</label>
                                                <input type="text" class="form-control" value="<?=(isset($empleado)) ? $empleado['cuil']: '';?>" id="cuil" name="cuil">
                                            </div>   
                                        </div>
                                        <div class="col-md-2">
                                            <label for="doc">Tipo de Doc.</label>
                                            {{ Form::select('document_type', $tdocs, (isset($empleado)) ? $empleado['document_type_id'] : '0', array('class' => 'form-control', 'id' => 'document_type'))}}
                                        </div>
                                        <div class="col-md-2">
                                            <label for="num.doc">Num. Doc </label>
                                            <input type="text" class="form-control" value="<?=(isset($empleado)) ? $empleado['document']: '';?>" id="document" name="document">
                                        </div>
                                     </div>
                                     <div class="row">
                                     <div class="col-md-2">
                                            <label for="nacionalidad">Foto</label>
                                            {{ Form::file('photo', array('id'=>'photo', 'class'=>'form-control', 'title'=>'Agregue una foto')) }}

                                        </div>
                                        <div class="col-md-2">
                                            <label for="nacionalidad">Nacionalidad</label>
                                                  {{ Form::select('country', $countries, (isset($city)) ? $city['country_id'] : '0', array('class' => 'form-control', 'id' => 'country'))}}

                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="estado-civil">Estado Civil</label>
                                                <select class="form-control" id="marital_status" name="marital_status">
                                                  <option value="soltero" <?php if (isset($empleado) && $empleado['marital_status'] == 'soltero') echo "selected='selected'" ?>>Soltero</option>
                                                  <option value="casado" <?php if (isset($empleado) && $empleado['marital_status'] == 'casado') echo "selected='selected'" ?>>Casado</option>
                                                  <option value="separado" <?php if (isset($empleado) && $empleado['marital_status'] == 'separado') echo "selected='selected'" ?>>Separado</option>
                                                  <option value="viudo" <?php if (isset($empleado) && $empleado['marital_status'] == 'viudo') echo "selected='selected'" ?>>Viudo</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-2">
                                            <div class="form-group">
                                                <label for="fecha-nacimiento">Fecha de Nacimiento</label>
                                                <div class='input-group date datetimepicker' >
                                                    <input type='text' class="form-control" id="fecha-nacimiento" name="fecha-nacimiento" value="<?= (isset($empleado)) ? date_format(new DateTime($empleado['birthdate']), "d-m-Y") : '' ?>" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar">
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>	

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="city">Lugar de Nacimiento</label>
                                                <div id ="ajax_cities">
                                                    {{ Form::select('city', $countries, (isset($empleado)) ? $empleado['city_id'] : '0', array('class' => 'form-control', 'id' => 'city'))}}
                                                </div>
                                            </div>                    
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="legajo">Estado Personal</label>
                                                {{ Form::select('status', $statuses, (isset($employee_status)) ? $employee_status['status_id'] : '0', array('class' => 'form-control', 'id' => 'status'))}}
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="estado-desde">Desde</label>
                                                <div class='input-group date datetimepicker'>
                                                    <input name="estado-desde" type='text' class="form-control" id="estado-desde" name="estado-desde" value="<?=(isset($employee_status) && $employee_status['from'] != "0000-00-00") ? date_format(new DateTime($employee_status['from']), "d-m-Y") : '' ?>" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar">
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="estado-hasta">Hasta</label>
                                                <div class='input-group date datetimepicker'>
                                                    <input type='text' class="form-control" id="estado-hasta" name="estado-hasta" value="<?=(isset($employee_status) && $employee_status['to'] != "0000-00-00") ? date_format(new DateTime($employee_status['to']), "d-m-Y") : '' ?>" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar">
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12 text-right">
                                            <button id="save" type="button" class="btn btn-primary" aria-label="Left Align">
                                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                            </button>
                                            <button id="historyPersonal" type="button" class="btn btn-primary" aria-label="Left Align">
                                                <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Historial
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            {{ Form::close() }}
                        </div>
                        <div class="panel panel-primary" id="contact-info">
                            <div class="panel-heading">Datos de Contacto</div>
                            <div class="panel-body">
                                <div class="row">
                                        <div class="col-md-6 borde-separacion">
                                         <form id="formContactPhone">
                                           <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="tipo-telefono">Teléfono Tipo</label>
                                                    {{ Form::select('tipo_telefono', $telefonos, '', array('class' => 'form-control', 'id' => 'tipo_telefono'))}}

                                                </div>
                                            </div>             
                                            <div class="col-md-6 ">
                                                <div class="form-group">
                                                    <label for="numero-tel">Número</label>
                                                    <input type="text" class="form-control" name="numero_tel" id="numero_tel">
                                                </div>                    
                                            </div>
                                             <div class="col-md-12 text-right">
                                                <div class="form-group">
                                                    <button type="button" id="savePhone" class="btn btn-primary" aria-label="Left Align">
                                                        <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                                    </button>
                                                </div>                    
                                            </div>
                                    </form>
                                    </div>
                                    <form id="formEmail"> 
                                        <div class="col-md-6">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="Email-tipo">Email Tipo</label>
                                                    {{ Form::select('tipo_email', $emails, '', array('class' => 'form-control', 'id' => 'tipo_email'))}}
                                                </div>
                                            </div>             
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="numero-tel">Email</label>
                                                    <input type="text" class="form-control" name="email" id="email">
                                                </div>                    
                                            </div>
                                            <div class="col-md-12 text-right">
                                                <div class="form-group">
                                                    <button type="button" id="saveMail" class="btn btn-primary" aria-label="Left Align">
                                                        <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                                    </button>
                                                </div>                    
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="contacts" style ="width:100%"class="table table-bordered">
                                        <thead>
                                          <tr class="info">
                                            <th>Tipo</th>
                                            <th>Dato</th>
                                            <th class="col-md-1">Editar/Eliminar</th>
                                            
                                          </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>                                        
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-primary" id="address-info">
                            <div class="panel-heading">Direcciones</div>
                            <form id="formAddress">
                                <div class="panel-body">
                                    
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="tipo-direccion">Tipo</label>
                                                <select id="tipo_direccion" class="form-control" name="tipo_direccion" >
                                                  <option value="Legal">Legal</option>
                                                  <option value="Real">Real</option>
                                                  <option value="envios">Envíos</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="Calle">Calle</label>
                                                <input type="text" class="form-control" id="calle" name="calle">
                                            </div>       
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="numero">Número</label>
                                                <input type="text" class="form-control" id="numero" name="numero">
                                            </div>       
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="piso">Piso</label>
                                                <input type="text" class="form-control" id="piso" name="piso">
                                            </div>       
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="departamento">Depto</label>
                                                <input type="text" class="form-control" id="departamento" name="departamento">
                                            </div>       
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="codigo-postal">Código postal</label>
                                                <input type="text" class="form-control" id="codigo-postal" name="codigo-postal">
                                            </div>       
                                        </div>
                                    </div>
                                    <div class="row">
                                        
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="provincia">Provincia</label>
                                                {{ Form::select('province', $provinces, '0', array('class' => 'form-control', 'id' => 'province'))}}
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <label for="partido">Partido</label>
                                                 {{ Form::select('locality', $localities, '0', array('class' => 'form-control', 'id' => 'locality'))}}
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="localidad">Localidad</label>
                                                {{ Form::select('split', $splits, '0', array('class' => 'form-control', 'id' => 'split'))}}
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <label for="barrio">Barrio</label>
                                                <input type="text" class="form-control" id="barrio" name="barrio">
                                            </div>       
                                        </div>
                                    </div>
                                    <div class="col-md-12 text-right">
                                        <div class="form-group">
                                            <button id="saveAdress" type="button" id="saveMail" class="btn btn-primary" aria-label="Left Align">
                                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                            </button>

                                            <button type="reset" id="resetAdress" class="btn btn-primary" aria-label="Left Align">
                                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Limpiar
                                            </button>
                                        </div>                 
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table id="direcciones" style ="width:100%"class="table table-bordered">
                                              <thead>
                                              <tr class="info">
                                                <th class="col-md-1">Tipo</th>
                                                <th class="col-md-1">Calle</th>
                                                <th class="col-md-1">Nº</th>     
                                                <th class="col-md-1">piso</th>
                                                <th class="col-md-1">Dpto</th>
                                                <th class="col-md-1">CP</th>
                                                <th class="col-md-1">Provincia</th>
                                                <th class="col-md-1">Partido</th>
                                                <th class="col-md-1">Localidad</th>
                                                <th class="col-md-1">Barrio</th>
                                                <th class="col-md-1">Editar/Eliminar</th>
                                              </tr>
                                              </thead>
                                              <tbody>
                                              </tbody>
                                              
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        
                    </div>
                
<!--fin datos personales-->
<!--Inicio Datos médicos-->
                    <div role="tabpanel" class="tab-pane" id="datos-medicos">
                    {{ Form::open(array('id'=>'medical-info','files' => 'true', 'url'=>'saveMedicalInfo' , 'name'=>'medical-info')) }}
                            <div class="panel panel-primary">
                                <div class="panel-heading">Datos Médicos</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-2 form-group">
                                            <label for="numero-carnet">Número Carnét</label>
                                            <input id="numero-carnet" name="numero-carnet" type="text" class="form-control" value="<?=(isset($medical_data['number'])) ? $medical_data['number']: '' ?>" >
                                        </div>
                                        <div class="col-md-2 form-group">
                                            <label for="tipo-sandre">Tipo de Sangre</label>
                                            <select id="tipo-sangre" name="tipo-sangre" class="form-control">
												<option value="0">- Seleccione -</option>
												<option value="O+" <?php if (isset($medical_data['blood_type']) && $medical_data['blood_type'] == "O+") echo "selected" ?>>O+</option>
												<option value="O-" <?php if (isset($medical_data['blood_type']) && $medical_data['blood_type'] == "O-") echo "selected" ?>>O-</option>
												<option value="A+" <?php if (isset($medical_data['blood_type']) && $medical_data['blood_type'] == "A+") echo "selected" ?>>A+</option>
												<option value="A-" <?php if (isset($medical_data['blood_type']) && $medical_data['blood_type'] == "A-") echo "selected" ?>>A-</option>
												<option value="AB+" <?php if (isset($medical_data['blood_type']) && $medical_data['blood_type'] == "AB+") echo "selected" ?>>AB+</option>
												<option value="AB-" <?php if (isset($medical_data['blood_type']) && $medical_data['blood_type'] == "AB-") echo "selected" ?>>AB-</option>
											</select>
                                        </div>
                                        <div class="col-md-2 form-group">
                                            <label for="legajo-medico"> Legajo Médico</label>
                                            <input type="hidden" name="medical_file_exists" value="<?=(isset($medical_data['medical_file'])) ? $medical_data['medical_file']: '' ?>" />
                                            {{ Form::file('image', array('id'=>'legajo-medico', 'name'=>'legajo-medico', 'class'=>'form-control', 'title'=>'Introduzca el legajo')) }} 
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3 form-group">
                                            <label for="fecha-apto-medico">Fecha Apto Médico</label>
                                            <div class='input-group date datetimepicker'>
                                                <input id="apto-medico" name="apto-medico" type='text' class="form-control" value="<?=(isset($medical_data['medical_apto'])) ? date_format(new DateTime($medical_data['medical_apto']), "d-m-Y") : '' ?>" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                            </div>

                                        </div>
                                        <div class="col-md-3 form-group">
                                            <label for="obra-social"> Obra Social</label>
                                            {{ Form::select('obra-social', $medical_socials, (isset($medical_data)) ? $medical_data['medical_social_id'] : '0', array('class' => 'form-control', 'id' => 'obra-social')) }}
                                        </div>
                                        <div class="col-md-3 form-group">
                                            <label for="art"> ART</label>
                                            {{ Form::select('art', $arts, (isset($medical_data)) ? $medical_data['art_id'] : '0', array('class' => 'form-control', 'id' => 'art')) }}
                                        </div>
                                        <div class="col-md-3 form-group">
                                            <label for="prepaga"> Prepaga</label>
                                            {{ Form::select('prepaga', $prepaids, (isset($medical_data)) ? $medical_data['prepaid_id'] : '0', array('class' => 'form-control', 'id' => 'prepaga')) }}
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h4>Discapacidad</h4>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="discapacidad">Discapacidad</label>
                                                <select id="discapacidad" name="discapacidad" class="form-control">
                                                    <option value="1" <?php if (isset($medical_data) && $disability['certificate_url'] != "") echo "selected='selected'" ?>>Si</option> 
                                                    <option value="0"  <?php if (isset($medical_data) && $disability['certificate_url'] == "") echo "selected='selected'" ?>>No</option>
                                                </select>
                                            </div>       
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="tipo-discapacidad">Tipo de discapacidad</label>
                                                {{ Form::select('tipo-discapacidad', $tdiscaps, (isset($tdiscap)) ? $tdiscap: '0', array('class' => 'form-control', 'id' => 'tipo-discapacidad')) }}
                                            </div> 
                                        </div> 
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="certificado-discapacidad">Certificado-Discapacidad</label>												
                                                {{ Form::file('image', array('id'=>'certificado-discapacidad', 'name'=>'certificado-discapacidad', 'class'=>'form-control', 'title'=>'Introduzca el certificado')) }}
                                            </div>     
                                        </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="fecha-cert-discapacidad">Fecha Emisión Certificado</label>
													<div class='input-group date datetimepicker'>
                                                        <input id="fecha-cert-discapacidad" name="fecha-cert-discapacidad" type='text' class="form-control" value="" />
                                                            <span class="input-group-addon">
																<span class="glyphicon glyphicon-calendar"></span>
                                                            </span>
                                                    </div>
                                                </div>       
                                            </div> 
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="vigencia-certificado">Vigencia Desde</label>
                                                    <div class='input-group date datetimepicker'>
                                                        <input id="vigencia-certificado" name="vigencia-certificado" type='text' class="form-control" value="" />
                                                            <span class="input-group-addon">
																<span class="glyphicon glyphicon-calendar"></span>
                                                            </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group">
                                                    <label for="vigencia-certificado-hasta">Vigencia Hasta</label>
                                                        <div class='input-group date datetimepicker'>
                                                            <input id="vigencia-certificado-hasta" name="vigencia-certificado-hasta" type='text' class="form-control" value="" />
                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-calendar">
                                                                </span>
                                                            </span>
                                                        </div>
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="entidad-certificado">Entidad que emite certificado</label>
                                                    <input id="entidad-certificado" name="entidad-certificado" type="text" class="form-control" name="entidad-certificado" value="<?=(isset($disability)) ? $disability['certificate_creator']: '' ?>">
                                                </div>       
                                            </div> 
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 text-right">
                                                <!-- <button type="button" class="btn btn-primary" aria-label="Left Align">
                                                     <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Editar
                                                </button> -->
                                                <button type="submit" id="save-medical-info" name="save-medical-info" class="btn btn-primary" aria-label="Left Align">
                                                    <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                                </button>
                                                <button type="button" id="historyMedical" class="btn btn-primary" aria-label="Left Align">
                                                    <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Historial
                                                </button>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <table id="tblDiscapacidades" style ="width:100%"class="table table-bordered">
                                                  <thead>
                                                  <tr class="info">
                                                    <th class="col-md-1">Discapacidad</th>
                                                    <th class="col-md-1">Tipo Discapacidad</th>
                                                    <!-- <th class="col-md-1">Certificado</th> -->
                                                    <th class="col-md-1">Fecha Emisión</th>
                                                    <th class="col-md-1">Desde</th>
                                                    <th class="col-md-1">Hasta</th>
                                                    <th class="col-md-2">Entidad Emisora</th>
                                                    <th class="col-md-1">Editar/Eliminar</th>
                                                  </tr>
                                                  </thead>
                                                  <tbody>
                                                  </tbody>
                                                  
                                                </table>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                        {{ Form::close() }}
                    </div>
<!--Termina datos médicos-->        
<!--datos familiares-->
                    <div role="tabpanel" class="tab-pane" id="grupo-familiar">
                        <form id="formGrupoFamiliar">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="parentesco">Parentesco</label>
                                        {{ Form::select('parentesco', $kinships, '0', array('class' => 'form-control', 'id' => 'parentesco'))}}

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="apellido">Apellido</label>
                                            <input type="text" class="form-control" name="family_lastname" id="family_lastname">
                                    </div>                    
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="nombre">Nombre</label>
                                        <input type="text" class="form-control" name="family_name" id="family_name">
                                    </div>                    
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="dni">DNI</label>
                                        <input type="text" class="form-control" name="family_dni" id="family_dni">
                                    </div>  
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="sexo">Sexo</label>
                                            <select class="form-control" name="family_sex" id="family_sex">
                                                <option value="F">Femenino</option>
                                                <option value="M">Masculino</option>
                                            </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="fecha-nacimiento">Fecha de Nacimiento</label>
                                        <div class='input-group date datetimepicker'>
                                            <input id="family_birthdate" name="family_birthdate" type='text' class="form-control" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                        </div>
                                    </div>                    
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="discapacidad">Discapacidad</label>
                                            <select class="form-control" name="family_disability" id="family_disability">
                                            <option value="1">Si</option>
                                            <option value="0">No</option>
                                            </select>
                                    </div>       
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="tipo-discapacidad">Tipo de discapacidad</label>
                                       {{ Form::select('family_disability_type', $tdiscaps, 0 , array('class' => 'form-control', 'id' => 'family_disability_type')) }}
                                    </div>       
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="convive">¿Convive?</label>
                                            <select class="form-control" name="family_alive" id="family_alive">
                                                <option value="1">Si</option>
                                                <option value="0">No</option>
                                            </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="jardin">¿Asignación Jardín?</label>
                                            <select class="form-control" name="family_garden" id="family_garden">
                                                <option value="1">Si</option>
                                                <option value="0">No</option>
                                            </select>
                                    </div>
                                </div>    
                            </div>
                            <div class="row">
                                <div class="col-md-12 text-right form-group">
                                    <button type="button" id="saveFamily" class="btn btn-primary" aria-label="Left Align">
                                        <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                    </button>
                                </div> 
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">Familiares</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="table table-bordered" id="table_family">
                                            <thead>
                                              <tr class="info">
                                                <th class="col-md-1">Apellido</th>
                                                <th class="col-md-1">Nombre</th>     
                                                <th class="col-md-1">Sexo</th>
                                                <th class="col-md-1">Fecha.Nacimiento</th>
                                                <th class="col-md-1">Parentesco</th>
                                                <th class="col-md-1">Discapacidad</th>
                                                <th class="col-md-1">Tipo.Discapacidad</th>
                                                <th class="col-md-1">Editar/Dar baja</th>
                                              </tr>
                                            </thead>
                                            <tbody> 
                                            </tbody>  
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
<!--termina datos familiares-->
<!--comienza datos laborales-->
                    <div role="tabpanel" class="tab-pane" id="laboral">
                        <form id="formLaboral">


                            <div class="panel panel-primary">
                                <div class="panel-heading">Lugar, Días y Horarios de Trabajo</div>
                                <div class="panel-body">
                                    <div class="form-group col-md-12 ">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-6 borde-separacion">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="legajo">Estado Laboral</label>
                                                                    {{ Form::select('job_status', $job_status, '0', array('class' => 'form-control', 'id' => 'job_status'))}}
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label for="fecha-inicio">Fecha de ingreso al Ministerio</label>
                                                                    <div class='input-group date datetimepicker'>
                                                                        <input type='text' class="form-control" id="date_in" name="date_in" value="<?=(isset($file['start_date'])) ? date_format(new DateTime($file['start_date']), "d-m-Y") : '';?>"/>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar">
                                                        </span>
                                                    </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--<div class="row">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for"adicionales-legajo"><h4>Adicionales y suplementos</h4></label>
                                                                    <select class="form-control" name="have_additionals" id="have_additionals">
                                                                        <option value="1">Si</option>
                                                                        <option value="0">No</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>-->
                                                        <!--<div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="legajo">Adicionales</label>
                                                {{ Form::select('additional', $additionals, '0', array('class' => 'form-control', 'id' => 'additional'))}}
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="legajo">Suplementos</label>
                                                                    {{ Form::select('supplement', $supplements, '0', array('class' => 'form-control', 'id' => 'supplement'))}}
                                                                </div>
                                                            </div>
                                                         </div>-->
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="row">
                                                            <div class="col-md-6 col-md-offset-6">
                                                                <div class="form-group">
                                                                    <label for="legajo">Estado de trabajo </label>
                                                                    <input type="text" id="id_work_file" readonly value="<?=(isset($file['id'])) ? $file['id']: '';?>" class="form-control">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--<div class="row">
                                                            <div class="col-md-12 col-xs-12">
                                                                <div class="form-group">
                                                                    <div class="panel panel-default"  rows="3">
                                                                        <div class="panel-body">
                                                                            <label for="herramientas-trabajo">Herramientas de Trabajo</label>
                                                                            <div class="checkbox">
                                                                                <label>
                                                                                    <input type="checkbox" value="" name="tool[]">
                                                                                    Notebook
                                                                                </label>
                                                                            </div>
                                                                            <div class="checkbox">
                                                                                <label>
                                                                                    <input type="checkbox" value="" name="tool[]">
                                                                                    Ipad
                                                                                </label>
                                                                            </div>
                                                                            <div class="checkbox">
                                                                                <label>
                                                                                    <input type="checkbox" value="" name="tool[]">
                                                                                    Celular
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>-->
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3 form-group">
                                                        <label for="cod-area">Área</label><!--CUANDO SE INSERTE EL CÓDIGO APARECERAN COMPLETADOS LOS SIGUIENTES CAMPOS DE ACUERDO A LA TABLA COD-DEPENDENCIA NUMÉRICO LLAVE 2-->
                                                        {{ Form::select('area', $areas, '0', array('class' => 'form-control', 'id' => 'area'))}}
                                                    </div>
                                                    <div class="col-md-3 form-group">
                                                        <label for="cod-Edificio">Edificio</label><!--CUANDO SE INSERTE EL CÓDIGO APARECERAN COMPLETADOS LOS SIGUIENTES CAMPOS DE ACUERDO A LA TABLA COD-DEPENDENCIA NUMÉRICO LLAVE 2-->
                                                        {{ Form::select('building', $buildings, '0', array('class' => 'form-control', 'id' => 'building'))}}
                                                    </div>
                                                    <div class="col-md-3 form-group">
                                                        <label for="oficinas">Oficinas</label><!--CUANDO SE INSERTE EL CÓDIGO DE LOCAL APARECERAN LAS OFICINAS CORRESPONDIENTES-->
                                                        {{ Form::select('office', $offices, '0', array('class' => 'form-control', 'id' => 'office'))}}
                                                    </div>
                                                </div>                    
                                                <br>                                           
                                        
                                                <div class="row">
                                                    <div class="col-md-12 text-center">
                                                        <label for="dias">Días Horario Fijo</label><br>
                                                        <label class="checkbox-inline">
                                                            <input name="dias[]" type="checkbox" id="lunes" value="lunes "> Lunes
                                                        </label>
                                                                
                                                        <label class="checkbox-inline">
                                                            <input name="dias[]" type="checkbox" id="martes" value="martes"> Martes
                                                        </label>
                                                                
                                                        <label class="checkbox-inline">
                                                            <input name="dias[]" type="checkbox" id="miercoles" value="miercoles">Miércoles
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input name="dias[]" type="checkbox" id="jueves" value="jueves"> Jueves
                                                        </label>
                                                        
                                                        <label class="checkbox-inline">
                                                            <input name="dias[]" type="checkbox" id="viernes" value="viernes">Viernes
                                                        </label>
                                                        <label class="checkbox-inline">
                                                            <input name="dias[]" type="checkbox" id="sabado" value="sabado"> Sábado
                                                        </label>
                                                            
                                                        <label class="checkbox-inline">
                                                            <input name="dias[]" type="checkbox" id="domingo" value="domingo">Domingo
                                                        </label>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="row">
                                                    <div class="col-md-3 form-group">
                                                        <label for="hora-entrada">Hora de Entrada</label>
                                                        <input type="text" class="form-control" id="hour_from" name="hour_from">
                                                    </div>
                                                    <div class="col-md-3 form-group">
                                                        <label for="hora-salida">Hora de Salida</label>
                                                        <input type="text" class="form-control" id="hour_to" name="hour_to">
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <div class="form-group">
                                                            <label for="desde-horario">¿Desde cuándo?</label>
                                                            <div class='input-group date datetimepicker'>
                                                                <input type='text' class="form-control" id="date_from" name="date_from" />
                                                                <span class="input-group-addon">
                                                                    <span class="glyphicon glyphicon-calendar">
                                                                    </span>
                                                                    </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-3">
                                                        <div class="form-group">
                                                            <label for="hasta-horario">¿Hasta cuándo?</label>
                                                            <div class='input-group date datetimepicker'>
                                                                <input type='text' class="form-control" id="date_to" name="date_to" />
                                                                <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-calendar">
                                                                    </span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <div class="col-md-12">
                                            <button type="button" id="saveWorkFile" class="btn btn-primary" aria-label="Left Align">
                                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                            </button>
                                        </div>
                                    </div> 
                                </div>

                                <div class="row">
                                    <div class="col-md-12">

                                        <div class="col-md-12">
                                            <table id="horarios" style="width:100%" class="table table-bordered ">
                                                <thead>
                                                <tr class="info">
                                                    <th>Área</th>
                                                    <th>Local</th>
                                                    <th>Oficina</th>     
                                                    <th>Días</th>
                                                    <th>Horario</th>
                                                    <th>Desde</th>
                                                    <th>Hasta</th>
                                                    <th class="col-md-1">Editar/Eliminar</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <!-- <tr>
                                                    <td>Cont.1</td>
                                                    <td>Cont.2</td>     
                                                    <td>Cont.3</td>
                                                    <td>Cont.4</td>
                                                    <td>Cont.5</td>
                                                    <td>Cont.6</td>
                                                    <td>Cont.7</td>
                                                    <td>Cont.8</td>
                                                    <td> 
                                                        <button type="button"  aria-label="Left Align">
                                                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                        </button>
                                                        <button type="button" aria-label="Left Align">
                                                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                        </button>
                                                    </td>
                                                </tr> -->
                                                </tbody>
                                            </table>
                                        </div>   
                                    </div>
                                </div>
                            </div>

                        </form>


                        <div class="panel panel-primary">


                            <div class="panel-heading">Situación de Revista</div>
                            <input type="hidden" id="id_review" value="<?=(isset($review['id'])) ? $review['id']: '';?>">
                            

                            <div class="panel-body">

                                <form id="formRevista">
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <div class="form-group">
                                                <label for="Escalafon">Escalafón</label>
                                                {{ Form::select('scales', $scales, (isset($review['scale_id'])) ? $review['scale_id']: '0', array('class' => 'form-control', 'id' => 'scale')) }}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 col-xs-12">
                                            <div class="form-group">
                                                <label for="agrupamiento">Agrupamiento</label>
                                                {{ Form::select('agrupamiento', $groupings, (isset($review['grouping_id'])) ? $review['grouping_id']: '0', array('class' => 'form-control', 'id' => 'agrupamiento')) }}
                                            </div>
                                        </div> 
                                        <div class="col-md-4 col-xs-12">
                                            <div class="form-group">
                                                <label for="Nivel">Nivel</label>
                                                <select class="form-control" name="grado" id="level">
                                                    <option value="0" <?=(isset($review['level']) && $review['level'] == "0") ? "selected" : "0"?> >No</option>
                                                    <option value="A" <?=(isset($review['level']) && $review['level'] == "A") ? "selected" : "0"?> >A</option>
                                                    <option value="B" <?=(isset($review['level']) && $review['level'] == "B") ? "selected" : "0"?>>B</option>
                                                    <option value="C" <?=(isset($review['level']) && $review['level'] == "C") ? "selected" : "0"?>>C</option>
                                                    <option value="D" <?=(isset($review['level']) && $review['level'] == "D") ? "selected" : "0"?>>D</option>
                                                    <option value="E" <?=(isset($review['level']) && $review['level'] == "E") ? "selected" : "0"?>>E</option>
                                                    <option value="F" <?=(isset($review['level']) && $review['level'] == "F") ? "selected" : "0"?>>F</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-xs-12">
                                            <div class="form-group">
                                                <label for="Grado">Grado</label>
                                                <select class="form-control" name="Tramo" id="grade">
                                                    <option value="0" <?=(isset($review['grade']) && $review['grade'] == "0") ? "selected" : "0"?>>No</option>
                                                    <option value="1" <?=(isset($review['grade']) && $review['grade'] == "1") ? "selected" : "0"?>>1</option>
                                                    <option value="1" <?=(isset($review['grade']) && $review['grade'] == "1") ? "selected" : "0"?>>1</option>
                                                    <option value="3" <?=(isset($review['grade']) && $review['grade'] == "3") ? "selected" : "0"?>>3</option>
                                                    <option value="4" <?=(isset($review['grade']) && $review['grade'] == "4") ? "selected" : "0"?>>4</option>
                                                    <option value="5" <?=(isset($review['grade']) && $review['grade'] == "5") ? "selected" : "0"?>>5</option>
                                                    <option value="6" <?=(isset($review['grade']) && $review['grade'] == "6") ? "selected" : "0"?>>6</option>
                                                    <option value="7" <?=(isset($review['grade']) && $review['grade'] == "7") ? "selected" : "0"?>>7</option>
                                                    <option value="8" <?=(isset($review['grade']) && $review['grade'] == "8") ? "selected" : "0"?>>8</option>
                                                    <option value="9" <?=(isset($review['grade']) && $review['grade'] == "9") ? "selected" : "0"?>>9</option>
                                                    <option value="10" <?=(isset($review['grade']) && $review['grade'] == "10") ? "selected" : "0"?>>10</option>
                                                    <option value="11" <?=(isset($review['grade']) && $review['grade'] == "11") ? "selected" : "0"?>>11</option>
                                                    <option value="12" <?=(isset($review['grade']) && $review['grade'] == "12") ? "selected" : "0"?>>12</option>
                                                    <option value="13" <?=(isset($review['grade']) && $review['grade'] == "13") ? "selected" : "0"?>>13</option>
                                                    <option value="14" <?=(isset($review['grade']) && $review['grade'] == "14") ? "selected" : "0"?>>14</option>
                                                    <option value="15" <?=(isset($review['grade']) && $review['grade'] == "15") ? "selected" : "0"?>>15</option>
                                                    <option value="16" <?=(isset($review['grade']) && $review['grade'] == "16") ? "selected" : "0"?>>16</option>
                                                    <option value="17" <?=(isset($review['grade']) && $review['grade'] == "17") ? "selected" : "0"?>>17</option>
                                                    <option value="18" <?=(isset($review['grade']) && $review['grade'] == "18") ? "selected" : "0"?>>18</option>
                                                    <option value="19" <?=(isset($review['grade']) && $review['grade'] == "19") ? "selected" : "0"?>>19</option>
                                                    <option value="20" <?=(isset($review['grade']) && $review['grade'] == "20") ? "selected" : "0"?>>20</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4 col-xs-12">
                                            <div class="form-group">
                                                <label for="Tramo">Tramo</label>
                                                {{ Form::select('stretchs', $stretchs, (isset($review['stretch_id'])) ? $review['stretch_id']: '0', array('class' => 'form-control', 'id' => 'stretch')) }}
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-xs-12">
                                            <div class="form-group">
                                                <label for="categoria">Categoría</label>
                                                {{ Form::select('categories', $categories, (isset($review['category_id'])) ? $review['category_id']: '0', array('class' => 'form-control', 'id' => 'review_category')) }}
                                            </div>
                                        </div> 
                                        <div class="col-md-4 col-xs-12">
                                            <div class="form-group">
                                                <label for="funcion-ejecutiva">Función Ejecutiva</label>
                                                <select class="form-control"  name="funcion-ejecutiva" id="executive_function" value="<?=(isset($review['executive_function'])) ? $review['executive_function'] : "0"?>">
                                                    <option value="I">I</option>
                                                    <option value="II">II</option>
                                                    <option value="III">III</option>
                                                    <option value="IV">IV</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="alta-afip">Alta AFIP</label>
                                                <div class='input-group date datetimepicker'>
                                                    <input type='text' class="form-control" id="in_afip" name="in_afip" value="<?=(isset($review['in_afip'])) ? date_format(new DateTime($review['in_afip']), "d-m-Y") : "0"?>" />
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar">
                                                            </span>
                                                        </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="baja-afip">Baja AFIP</label>
                                                    <div class='input-group date datetimepicker'>
                                                        <input type='text' class="form-control" id="out_afip" name="out_afip" value="<?=(isset($review['out_afip'])) ? date_format(new DateTime($review['out_afip']), "d-m-Y") : "0"?>"/>
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar">
                                                            </span>
                                                        </span>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="fecha-AFIP">Fecha AFIP</label>
                                                    <div class='input-group date datetimepicker'>
                                                        <input type='text' class="form-control" id="date_afip" name="date_afip" value="<?=(isset($review['date_afip'])) ? date_format(new DateTime($review['date_afip']), "d-m-Y") : "0"?>" />
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar">
                                                            </span>
                                                            </span>
                                                    </div>
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="row">
                                        <div class="col-md-12 text-right">
                                             <button type="button" id="saveReview" class="btn btn-primary" aria-label="Left Align">
                                                 <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                            </button>
                                           <!-- <button type="button" class="btn btn-primary" aria-label="Left Align">
                                                 <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Historial
                                             </button> -->
                                        </div>
                                    </div>  
                                </form>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="tblReview" style="width:100%" class="table table-bordered ">
                                            <thead>
                                                <tr class="info">
                                                    <th>Escalafón</th>
                                                    <th>Agrupamiento</th>
                                                    <th>Nivel</th>     
                                                    <th>Grado</th>
                                                    <th>Tramo</th>
                                                    <th>Categoría</th>
                                                    <th>Función Ejecutiva</th>
                                                    <th>Alta AFIP</th>
                                                    <th>Baja AFIP</th>
                                                    <th>Fecha AFIP</th>
                                                    <th class="col-md-1">Editar/Eliminar</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                         </table>
                                    </div>   
                                </div>
                                 
                            </div>
                        </div>                        


                        <div class="panel panel-primary">


                            <div class="panel-heading">Roles</div>
                            <input type="hidden" id="id_review" value="<?=(isset($review['id'])) ? $review['id']: '';?>">
                            

                            <div class="panel-body">

                                <form id="formRoles">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="rol-tipo">Rol</label>
                                                {{ Form::select('roles', $roles, (isset($roles['role_id'])) ? $roles['role_id']: '0', array('class' => 'form-control', 'id' => 'role')) }}
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="rol-tipo">Descripción</label>
                                                <input type="text" class="form-control" id="role_description" name="role_description">
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="Desde-rol">Desde</label>
                                                <div class='input-group date datetimepicker'>
                                                    <input type='text' class="form-control" id="role_from" name="role_from" />
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar">
                                                            </span>
                                                        </span>
                                                </div>     
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="hasta-rol">Hasta</label>
                                                <div class='input-group date datetimepicker'>
                                                    <input type='text' class="form-control" id="role_to" name="role_to" />
                                                        <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar">
                                                            </span>
                                                        </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="row">
                                        <div class="col-md-12 text-right form-group">
                                            <button type="button" id="saveRole" class="btn btn-primary" aria-label="Left Align">
                                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                                </button>
                                        </div> 
                                    </div>

                                </form>

                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="roles" style="width:100%" class="table table-bordered ">
                                            <thead>
                                                <tr class="info">
                                                    <th>Rol</th>
                                                    <th>Descripción</th>
                                                    <th>Desde</th>     
                                                    <th>Hasta</th>
                                                    <th class="col-md-1">Editar/Eliminar</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!-- <tr>
                                                    <td>Cont.1</td>
                                                    <td>Cont.2</td>     
                                                    <td>Cont.3</td>
                                                    <td>Cont.4</td>
                                                    <td> 
                                                        <button type="button"  aria-label="Left Align">
                                                         <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                        </button>
                                                        <button type="button" aria-label="Left Align">
                                                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                        </button>
                                                    </td>
                                                </tr> -->
                                            </tbody>
                                         </table>
                                    </div>   
                                </div> 
                            </div>
                        </div>






                            

                        
                    </div>
<!--termina datos laborales->
<!--comienza educación-->
                    <div role="tabpanel" class="tab-pane " id="educacion">
                        <div class="panel panel-primary">
                            <div class="panel-heading">Educación</div>
                            <form id="formEducacion">
                            <div class="panel-body">
                            <h6>(Empezar por el máximo título alcanzado)</h6>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="titulo-profesional">Título Profesional</label>
                                            <input type='text' class="form-control" id="titulo" name="titulo" />
                                        </div>
                                    </div>
                                    <div class="col-md-3 ">
                                        <div class="form-group">
                                            <label for="pais">País</label>
                                            {{ Form::select('countries', $countries, '0', array('class' => 'form-control', 'id' => 'education_country'))}}
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="Institución">Institución</label>
                                            {{ Form::select('institutions', $institutions, '0', array('class' => 'form-control', 'id' => 'institution'))}}
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="nivel">Nivel de Estudio</label>
                                            {{ Form::select('education_level', $education_levels, '0', array('class' => 'form-control', 'id' => 'education_level'))}}
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="fecha-inicio">Fecha de Inicio</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="education_start" name="education_start" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>                            
                                    
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="fecha-finalizacion">Fecha de Finalización</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="education_end" name="education_end" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                       
                                    
                                    <div class="col-md-3 ">
                                        <div class="form-group">
                                            <label for="estado">Estado</label>
                                            {{ Form::select('education_status', $education_statuses, '0', array('class' => 'form-control', 'id' => 'education_status'))}}
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="al-presente">&nbsp;</label><br>
                                        <label class="checkbox-inline ">
                                            <input type="checkbox" id="education_actually" value="1"> Actualmente 
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveEducation" class="btn btn-primary " aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        
                                        </button>       
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="tabla_educacion" style="width:100%" class="table table-bordered ">
                                        <thead>
                                          <tr class="info">
                                            <th>Título</th>
                                            <th>Fecha Egreso</th>     
                                            <th>Nivel Estudio</th>
                                            <th>Estado</th>
                                            <th class="col-md-1">Editar/Eliminar</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                       </table>
                                    </div>
                                </div>
                            </div>
                            </form>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">Cursos</div>
                            <form id="formCursos">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-3 col-xs-12">
                                        <div class="form-group">
                                            <label for="Institución">Institución</label>
                                            <input type="text" class="form-control" id="course_institution" name="course_institution">
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-xs-12">
                                        <div class="form-group">
                                            <label for="certificado">Certificado Obtenido</label>
                                            <input type="text" class="form-control" id="course_certificate" name="course_certificate">
                                            
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="fecha-finalizacion">Fecha de Finalización</label>
                                            <div class='input-group date datetimepicker'> 
                                                <input type='text' class="form-control" id="course_finalization" name="course_finalization" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="al-presente">&nbsp;</label><br>
                                        <label class="checkbox-inline ">
                                            <input type="checkbox" id="course_actually" value="1 " name="course_actually"> Actualmente 
                                        </label>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveCourse" class="btn btn-primary " aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        
                                        </button>       
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="cursos"  style="width:100%" class="table table-bordered ">
                                        <thead>
                                          <tr class="info">
                                            <th>Institución</th>
                                            <th>Certificado</th>     
                                            <th>Finalización</th>
                                            <th class="col-md-1"> Editar/Eliminar</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <!-- <tr>
                                            <td>Cont.1</td>
                                            <td>Cont.2</td>     
                                            <td>Cont.3</td>
                                            <td> 
                                                <button type="button"  aria-label="Left Align">
                                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                </button>
                                                <button type="button" aria-label="Left Align">
                                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                </button>
                                            </td>
                                          </tr> -->
                                        </tbody>  
                                       </table>
                                    </div>
                                </div>
                                
                            </div>
                            </form>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">Congresos</div>
                            <form id="formCongresos">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="titulo-congreso">Título del Congreso</label>
                                            <input type="text" class="form-control" id="congress_title" name="congress_title">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="especialidad">Especialidad</label>
                                            <input type="text" class="form-control" id="congress_specialization" name="congress_specialization">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="certificado">Certificado</label>
                                            <input type="text" class="form-control" id="congress_certificado" name="congress_certificado">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="fecha-finalizacion">Fecha de Finalización</label>
                                            <div class='input-group date datetimepicker' >
                                                <input type='text' class="form-control" id="congress_finalization" name="congress_finalization" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="al-presente">&nbsp;</label><br>
                                        <label class="checkbox-inline ">
                                            <input type="checkbox" id="congress_actually" value="1 "> Actualmente 
                                        </label>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveCongress" class="btn btn-primary " aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        
                                        </button>       
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="congresos" style="width:100%" class="table table-bordered">
                                        <thead>
                                          <tr class="info">
                                            <th>Congreso</th>
                                            <th>Especialidad</th>     
                                            <th>Certificado</th>
                                            <th>Fecha</th>
                                            <th class="col-md-1"> Editar/Eliminar</th>
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <!-- <tr>
                                            <td>Cont.1</td>
                                            <td>Cont.2</td>     
                                            <td>Cont.3</td>
                                            <td>Cont.4</td>
                                            <td> 
                                                <button type="button"  aria-label="Left Align">
                                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                </button>
                                                <button type="button" aria-label="Left Align">
                                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                </button>
                                            </td>
                                          </tr>
-->                                            </tbody>  
                                       </table>
                                    </div>
                                </div>
                                
                            </div>
                            </form>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">Idiomas</div>
                            <form id="formIdiomas">
                            <div class="panel-body">
                                <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="escrito">Idioma</label>
                                            {{ Form::select('language', $languages, '0', array('class' => 'form-control', 'id' => 'language'))}}
                                        </div>
                                </div>
                                <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="escrito">Nivel Escrito</label>
                                            <select class="form-control" name="escrito" id="escrito">
                                                <option value="Avanzado">Avanzado</option>
                                                <option value="Medio">Medio</option>
                                                <option value="Bajo">Bajo</option>
                                            </select>
                                        </div>
                                </div>  
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="oral">Nivel Oral</label>
                                        <select class="form-control" name="oral" id="oral">
                                            <option value="Avanzado">Avanzado</option>
                                            <option value="Medio">Medio</option>
                                            <option value="Bajo">Bajo</option>
                                        </select>
                                    </div>
                                </div>
                                
                                 <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveLanguage" class="btn btn-primary " aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar                                            
                                        </button>       
                                    </div> 
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table  id="idiomas"  style="width:100%" class="table table-bordered  ">
                                        <thead>  
                                          <tr class="info">
                                            <th>Idioma</th>
                                            <th>Nivel Escrito</th>     
                                            <th>Nivel Oral</th>
                                            <th class="col-md-1"> Editar/Eliminar</th>
                                          </tr>
                                          </thead>
                                          <tbody>
                                          <!-- <tr>
                                            <td>Cont.1</td>
                                            <td>Cont.2</td>     
                                            <td>Cont.3</td>
                                            <td> 
                                                <button type="button"  aria-label="Left Align">
                                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                </button>
                                                <button type="button" aria-label="Left Align">
                                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                </button>
                                            </td>
                                            
                                          </tr> -->
                                          </tbody>
                                       </table>
                                    </div>
                                </div>
                                
                            </div>
                            </form>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">Informática</div>
                            <form id="formInformatica">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6 ">
                                        <div class="form-group">
                                            <label for="area">Área</label>
                                            {{ Form::select('it_area', $it_areas, '0', array('class' => 'form-control', 'id' => 'it_area'))}}
                                        </div>
                                    </div>
                                    <div class="col-md-6 ">
                                        <div class="form-group">
                                            <label for="nivel">Nivel</label>
                                            {{ Form::select('it_level', $it_levels, '0', array('class' => 'form-control', 'id' => 'it_level'))}}
                                        </div>
                                    </div>
                                </div> 
                                <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveInformatica" name="saveInformatica" class="btn btn-primary " aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        
                                        </button>       
                                    </div> 
                                </div> 
                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="it_cursos" style="width:100%" class="table table-bordered">
                                        <thead>
                                          <tr class="info">
                                            <th>Área</th>
                                            <th>Nivel</th>
                                            <th class="col-md-1"> Editar/Eliminar</th>
                                          </tr>
                                        </thead>
                                        <tbody>  
                                          <!-- <tr>
                                            <td>Cont.1</td>
                                            <td>Cont.2</td>
                                            <td> 
                                                <button type="button"  aria-label="Left Align">
                                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                </button>
                                                <button type="button" aria-label="Left Align">
                                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                </button>
                                            </td>
                                          </tr> -->
                                        </tbody>
                                          
                                       </table>
                                    </div>
                                </div>                                    
                            </div>
                            </form>
                        </div>
                     <!--   <div class="panel panel-primary">
                            <div class="panel-heading">Conocimientos Adicionales</div>
                            <form id="formConocimientosAdicionales">
                            <div class="panel-body">
                                 <div class="row">
                                    <div class="col-md-4">
                                        <label for="nombre-publicacion">Nombre de la Publicación</label>
                                        <input type="text" class="form-control" id="nombre-publicacion" name="nombre-publicacion">
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="fecha-publicacion">Fecha de Publicación</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="fecha-publicacion" name="fecha-publicacion" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>  
                                <div class="row">
                                    <div class="col-md-3 col-xs-12">
                                        <div class="form-group">
                                            <label for="n-educativo">Nivel Educativo</label>
											{{ Form::select('n-educativo', $education_levels, '0', array('class' => 'form-control', 'id' => 'n-educativo'))}}
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="especialidad-materia">Especialidad o Materia</label>
                                        <input type="text" id="especialidad-materia" name="especialidad-materia" class="form-control">
                                    </div>
                                    <div class="col-md-3">
                                        <label for="institucion">Institución</label>
                                        <input type="text" id="institucion" name="institucion" class="form-control">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right">
                                        <button type="button" id="saveConocimientosAdicionales" class="btn btn-primary" aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        </button>
                                         <button type="button" class="btn btn-primary" aria-label="Left Align">
                                            <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Historial
                                        </button>
                                    </div>
                                 </div>
                            </div>
							<br>
							<div class="row">
								<div class="col-md-12">
									<table id="tblConocimientosAdicionales" style ="width:100%"class="table table-bordered">
									  <thead>
									  <tr class="info">
										<th class="col-md-1">Nombre Publicación</th>
										<th class="col-md-1">Fecha</th>     
										<th class="col-md-1">Nivel Educativo</th>
										<th class="col-md-1">Especialidad/Materia</th>
										<th class="col-md-1">Institucion</th>
										<th class="col-md-1">Editar/Eliminar</th>
									  </tr>
									  </thead>
									  <tbody>
									  </tbody>
									</table>
								</div>
							</div>
                            </form>
                        </div> -->

                    </div>
<!--fin de educación-->
<!--inicio de certificacion-->
                     <div role="tabpanel" class="tab-pane" id="carrera-administrativa">
                        <div class="panel panel-primary">
                            <div class="panel-heading">Servicios Públicos</div>
                            <form id="formServPublicos">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-4 form-group">
                                        <label for="organismo-publico">Organismo</label>
                                        <input type="text" class="form-control" id="organismo-publico" name="organismo-publico">
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="situacion-revista">Situación de Revista</label>                                          
                                        {{ Form::select('situacion-revista', $review_situation, '', array('class' => 'form-control', 'id' => 'situacion-revista')) }}
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="motivo">Motivo</label>
                                        <input type="text" class="form-control" id="motivo" name="motivo">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 form-group">
                                        <label for="destino">Destino</label>
                                        <input type="text" class="form-control" id="destino" name="destino"> 
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="desde">Desde</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="desde" name="desde" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="hasta">Hasta</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="hasta" name="hasta" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-xs-12">
                                        <div class="form-group">
                                            <label for="acto-administrativo">Acto Administrativo</label>
                                            {{ Form::select('acto-administrativo', $administrative_acts, '0', array('class' => 'form-control', 'id' => 'acto-administrativo')) }}
                                        </div>
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="numero-acto">Número de Acto</label>
                                        <input type="text" class="form-control" id="numero-acto" name="numero-acto">
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="fecha-acto">Fecha del Acto</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="fecha-acto" name="fecha-acto" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveServiciosPublicos" name="saveServiciosPublicos" class="btn btn-primary" aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        </button>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="tblServiciosPublicos" style ="width:100%"class="table table-bordered">
                                          <thead>
                                          <tr class="info">
                                            <th class="col-md-1">Organismo</th>
                                            <th class="col-md-1">Situacion Revista</th>
                                            <th class="col-md-1">Motivo</th>     
                                            <th class="col-md-1">Destino</th>
                                            <th class="col-md-1">Desde</th>
                                            <th class="col-md-1">Hasta</th>
                                            <th class="col-md-1">Acto Administrativo</th>
                                            <th class="col-md-1">Numero Acto</th>
                                            <th class="col-md-1">Fecha</th>
                                            <th class="col-md-1">Editar/Eliminar</th>
                                          </tr>
                                          </thead>
                                          <tbody>
                                          </tbody>
                                        </table>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">Servicios Privados</div>
                            <form id="formServPrivados">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-4 form-group">
                                        <label for="institucionPriv">Institución</label>
                                        <input type="text" class="form-control" id="institucionPriv" name="institucionPriv">
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="domicilio-legal">Domicilio Legal</label>
                                        <input type="text" class="form-control" id="domicilio-legal" name="domicilio-legal">
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="cargo">Cargo/Función</label>
                                        <input type="text" class="form-control" id="cargo" name="cargo">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-xs-12">
                                        <div class="form-group">
                                            <label for="remunerado">Remunerado</label>
                                            <select class="form-control" name="institución" id="remunerado" name="remunerado">
                                                <option value="1">Si</option>
                                                <option value="0">No</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="desde2">Desde</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="desde2" name="desde2" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="hasta2">Hasta</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="hasta2" name="hasta2" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-xs-12">
                                        <div class="form-group">
                                            <label for="causa-egreso">Causa Egreso</label>
                                            <textarea class="form-control" rows="3" id="causa-egreso" name="causa-egreso"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveServiciosPrivados" name="saveServiciosPrivados" class="btn btn-primary" aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        </button>
                                    </div>
                                </div>                               
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="tblServiciosPrivados" style ="width:100%"class="table table-bordered">
                                      <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Institución</th>
                                        <th class="col-md-1">Domicilio</th>
                                        <th class="col-md-1">Cargo Función</th>     
                                        <th class="col-md-1">Remunerado</th>
                                        <th class="col-md-1">Desde</th>
                                        <th class="col-md-1">Hasta</th>
                                        <th class="col-md-1">Causa/Egreso</th>
                                        <th class="col-md-1">Editar/Eliminar</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      </tbody>
                                      
                                    </table>
                                </div>
                            </div>
                            </form>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">Felicitaciones y Menciones</div>
                            <form id="formMenciones">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-4 form-group">
                                        <label for="jurisdiccion">Jurisdicción</label>
                                        <input type="text" class="form-control" id="jurisdiccion" name="jurisdiccion">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 form-group">
                                        <label for="organismo2">Organismo</label>
                                        <input type="text" class="form-control" id="organismo2" name="organismo2" >
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="concepto">Concepto</label>
                                        <input type="text" class="form-control" id="concepto" name="concepto">
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="motivo">Motivo</label>
                                        <input type="text" class="form-control" id="motivo1" name="motivo1">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-xs-12">
                                        <div class="form-group">
                                            <label for="acto-administrativo2">Acto Administrativo</label>
                                            {{ Form::select('acto-administrativo2', $administrative_acts, '0', array('class' => 'form-control', 'id' => 'acto-administrativo2')) }}
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label for="numero-acto2">Número de Acto</label>
                                            <input type="text" class="form-control" id="numero-acto2" name="numero-acto2">
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="fecha2">Fecha</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="fecha2" name="fecha2" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveFelicitaciones" name="saveFelicitaciones" class="btn btn-primary" aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="tblFelicitaciones" style ="width:100%"class="table table-bordered">
                                      <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Jurisdicción</th>
                                        <th class="col-md-1">Organismo</th>
                                        <th class="col-md-1">Concepto</th>     
                                        <th class="col-md-1">Motivo</th>
                                        <th class="col-md-1">Acto Administrativo</th>
                                        <th class="col-md-1">Numero Acto</th>
                                        <th class="col-md-1">Fecha</th>
                                        <th class="col-md-1">Editar/Eliminar</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      </tbody>
                                      
                                    </table>
                                </div>
                            </div>
                            </form>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">Sanciones</div>
                            <form id="formSanciones">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-3 form-group">
                                        <label for="organismo3">Organismo</label>
                                        <input type="text" class="form-control" id="organismo3" name="organismo3">
                                    </div>
                                    <div class="col-md-3 form-group">
                                        <label for="acto-administrativo1">Acto Administrativo</label>
                                        {{ Form::select('acto-administrativo1', $administrative_acts, '0', array('class' => 'form-control', 'id' => 'acto-administrativo1')) }}
                                    </div>
                                    <div class=" col-md-3 form-group">
                                            <label for="numero-acto3">Número de Acto</label>
                                            <input type="text" class="form-control" id="numero-acto3" name="numero-acto3">
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="fecha3">Fecha</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="fecha3" name="fecha3" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 col-xs-12">
                                        <div class="form-group">
                                            <label for="medida-disciplinaria">Medida Disciplinaria</label>
                                            {{ Form::select('medida-disciplinaria', $disciplinary_action, '0', array('class' => 'form-control', 'id' => 'medida-disciplinaria')) }}
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="motivo3">Motivo</label>
                                            <input type="text" class="form-control" id="motivo3" name="motivo3">
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="desde3">Desde</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="desde3" name="desde3" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="hasta3">Hasta</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="hasta3" name="hasta3" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveSanciones" name="saveSanciones" class="btn btn-primary" aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="tblSanciones" style ="width:100%"class="table table-bordered">
                                      <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Organismo</th>
                                        <th class="col-md-1">Acto Administrativo</th>
                                        <th class="col-md-1">Numero Acto</th>     
                                        <th class="col-md-1">Fecha</th>
                                        <th class="col-md-1">Medida Disciplinaria</th>
                                        <th class="col-md-1">Motivo</th>
                                        <th class="col-md-1">Desde</th>
                                        <th class="col-md-1">Hasta</th>
                                        <th class="col-md-1">Editar/Eliminar</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      </tbody>
                                      
                                    </table>
                                </div>
                            </div>
                            </form>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">Embargos</div>
                            <form id="formEmbargos">
                            <div class="panel-body">
                                <div class="row">
                                    <div class=" col-md-4 form-group">
                                            <label for="numero-expediente">Número de Expediente</label>
                                            <input type="text" class="form-control" id="numero-expediente" name="numero-expediente">
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="hasta4">Hasta</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="hasta4" name="hasta4" />
                                                <span class="input-group-addon"> 
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="fuero">Fuero</label>
                                        <input type="text" class="form-control" id="fuero" name="fuero">
                                    </div>
                                </div>
                                <div class="row">

                                    <div class="col-md-4 form-group">
                                        <label for="juzgado">Juzgado</label>
                                         <input type="text" class="form-control" id="juzgado" name="juzgado">
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="secretaria">Secretaría</label>
                                        <input type="text" class="form-control" id="secretaria" name="secretaria">
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="autos">Autos</label>
                                        <input type="text" class="form-control" id="autos" name="autos">
                                    </div>
                                </div>
                                <div class="row">
                                    
                                    <div class="col-md-4 form-group">
                                        <label for="monto">Monto</label>
                                        <input type="text" class="form-control" id="monto" name="monto">
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="trabajado">Trabajado</label>
                                        <select class="form-control" id="trabajado" name="trabajado">
                                            <option value="1">Si</option>
                                            <option value="0">No</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="levantado">Levantado</label>
                                        <select class="form-control" id="levantado" name="levantado">
                                            <option value="1">Si</option>
                                            <option value="0">No</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveEmbargo" name="saveEmbargo" class="btn btn-primary" aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="tblEmbargos" style ="width:100%"class="table table-bordered">
                                      <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Expediente</th>
                                        <th class="col-md-1">Hasta</th>
                                        <th class="col-md-1">Fuero</th>     
                                        <th class="col-md-1">Juzgado</th>
                                        <th class="col-md-1">Secretaria</th>
                                        <th class="col-md-1">Autos</th>
                                        <th class="col-md-1">Monto</th>
                                        <th class="col-md-1">Trabajado</th>
                                        <th class="col-md-1">Levantado</th>
                                        <th class="col-md-1">Editar/Eliminar</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      </tbody>
                                      
                                    </table>
                                </div>
                            </div>
                            </form>
                        </div>    
                        <div class="panel panel-primary">
                            <div class="panel-heading">Evaluación de Desempeño</div>
                            <form id="formEvaluacion">
                            <div class="panel-body">
                                <div class="row">
                                    <div class=" col-md-3 form-group">
                                            <label for="ano">Año</label>
                                            <input type="text" class="form-control" id="ano" name="ano">
                                    </div>
                                    <div class=" col-md-3 form-group">
                                            <label for="calificacion">Calificación</label>
                                            <select class="form-control" id="calificacion" name="calificacion">
                                                <option value="5">Muy Destadado</option>
                                                <option value="4">Destadado</option>
                                                <option value="3">Bueno</option>
                                                <option value="2">Regular</option>
                                                <option value="1">Deficiente</option>
                                            </select>
                                    </div>
                                    <div class="col-md-3 form-group">
                                        <label for="utilizada">Utilizada</label>
                                        <select class="form-control" id="utilizada" name="utilizada">
                                                <option value="1">Si</option>
                                                <option value="0">No</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3 form-group">
                                        <label for="nivelD">Nivel</label>
                                        <select class="form-control" id="nivelD" name="nivelD">
                                            <?php for($i = 'A'; $i <= 'F'; $i++) { ?>
                                            <option value="<?=$i?>"><?=$i?></option>
                                            <?php } ?>>
                                        </select>
                                    </div>
                                    
                                </div>
                                <div class="row">
                                    <div class="col-md-3 form-group">
                                        <label for="grado">Grado</label>
                                        <select class="form-control" id="grado" name="grado">
                                            <?php for($i = 0; $i <= 25; $i++) { ?>
                                                <option value="<?=$i?>"><?=$i?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class="col-md-3 form-group">
                                        <label for="bonificacion">Bonificación</label>
                                        <select class="form-control" id="bonificacion" name="bonificacion">
                                                <option value="1">Si</option>
                                                <option value="0">No</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="notificacion">Notificación</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="notificacion" name="notificacion" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="observaciones">Observaciones</label>
                                        <textarea class="form-control" id="observaciones" name="observaciones"></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveEvaluacion" name="saveEvaluacion" class="btn btn-primary" aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="tblEvaluacion" style ="width:100%"class="table table-bordered">
                                      <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Año</th>
                                        <th class="col-md-1">Calificacion</th>
                                        <th class="col-md-1">Utilizada</th>     
                                        <th class="col-md-1">Nivel</th>
                                        <th class="col-md-1">Grado</th>
                                        <th class="col-md-1">Bonificacion</th>
                                        <th class="col-md-1">Notificacion</th>
                                        <th class="col-md-1">Observaciones</th>
                                        <th class="col-md-1">Editar/Eliminar</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      </tbody>
                                      
                                    </table>
                                </div>
                            </div>
                        </form>
                        </div>
<!--                        <div class="panel panel-primary">
                            <div class="panel-heading">Créditos de Capacitación</div>
                            <form id="formCapacitacion">
                            <div class="panel-body">
                                <div class="row">
                                    <div class=" col-md-4 form-group">
                                            <label for="ano2">Año</label>
                                            <input type="text" class="form-control" id="ano2" name="ano2">
                                    </div>
                                    <div class=" col-md-4 form-group">
                                            <label for="cantidad">Cantidad</label>
                                            <input type="text" class="form-control" id="cantidad" name="cantidad">
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="utilizados2">Utilizados</label>
                                        <select class="form-control" id="utilizados2" name="utilizados2">
                                                <option value="1">Si</option>
                                                <option value="0">No</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class=" col-md-4 form-group">
                                            <label for="total">Total</label>
                                            <input type="text" class="form-control" id="total" name="total">
                                    </div>
                                    
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="vigencia">Vigencia</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="vigencia" name="vigencia" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label for="observaciones2">Observaciones</label>
                                        <textarea class="form-control" id="observaciones2" name="observaciones2"></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveCapacitacion" name="saveCapacitacion" class="btn btn-primary" aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="tblCreditos" style ="width:100%"class="table table-bordered">
                                      <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Año</th>
                                        <th class="col-md-1">Cantidad</th>
                                        <th class="col-md-1">Utilizados</th>     
                                        <th class="col-md-1">Total</th>
                                        <th class="col-md-1">Vigencia</th>
                                        <th class="col-md-1">Observaciones</th>
                                        <th class="col-md-1">Editar/Eliminar</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      </tbody>
                                      
                                    </table>
                                </div>
                            </div>
                            </form>
                        </div>-->
                        <div class="panel panel-primary">
                            <div class="panel-heading">Historial de Carrera</div>
                            <form id="formHistoriaCarrera">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-4 form-group">
                                        <label for="escalafon">Escalafón</label>
                                        <!-- <select class="form-control" id="escalafon" name="escalafon">
                                                <option value="1">Opción 1</option>
                                        </select> -->
										{{ Form::select('escalafon', $scales, (isset($review['scale_id'])) ? $review['scale_id']: '0', array('class' => 'form-control', 'id' => 'escalafon')) }}
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="agrupamiento3">Agrupamiento</label>
										{{ Form::select('agrupamiento3', $groupings, '0', array('class' => 'form-control', 'id' => 'agrupamiento3')) }}
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="nivel4">Nivel</label>
                                        <select class="form-control" id="nivel4" name="nivel4">
											<option value="1">A</option>
											<option value="2">B</option>
											<option value="3">C</option>
											<option value="4">D</option>
											<option value="5">E</option>
											<option value="6">F</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 form-group">
                                        <label for="grado4">Grado</label>
                                        <select class="form-control" id="grado4" name="grado4">
                                            <?php for($i = 0; $i <= 25; $i++) { ?>
                                            <option value="<?=$i + 1 ?>"><?=$i?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="tramo4">Tramo</label>
										{{ Form::select('tramo4', $stretchs, '0', array('class' => 'form-control', 'id' => 'tramo4')) }}
                                    </div>
                                    <div class="col-md-4 form-group">
                                        <label for="acto-administrativo4">Acto Administrativo</label>
                                        {{ Form::select('acto-administrativo4', $administrative_acts, '0', array('class' => 'form-control', 'id' => 'acto-administrativo4')) }}
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 form-group">
                                        <label for="numero-acto4">Número de Acto</label>
                                        <input type="text" id="numero-acto4" name="numero-acto4" class="form-control">
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="fecha-acto4">Fecha Acto</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' id="fecha-acto4" name="fecha-acto4" class="form-control" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label for="desde4">Desde</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="desde4" name="desde4" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">    
                                    
                                    <div class="col-md-12 form-group">
                                        <label for="motivo4">Motivo</label>
                                        <textarea class="form-control" id="motivo4" name="motivo4" rows="3"></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveHistoriaCarrera" name="saveHistoriaCarrera" class="btn btn-primary" aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="tblHistorial" style ="width:100%"class="table table-bordered">
                                      <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Escalafon</th>
                                        <th class="col-md-1">Agrupamiento</th>
                                        <th class="col-md-1">Nivel</th>     
                                        <th class="col-md-1">Grado</th>
                                        <th class="col-md-1">Tramo</th>
                                        <th class="col-md-1">Acto Administrativo</th>
                                        <th class="col-md-1">Numero Acto</th>
                                        <th class="col-md-1">Fecha</th>
                                        <th class="col-md-1">Desde</th>
                                        <th class="col-md-1">Motivo</th>
                                        <th class="col-md-1">Editar/Eliminar</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      </tbody>
                                      
                                    </table>
                                </div>
                            </div>
                            </form>
                        </div>
<!--                        <div class="panel panel-primary">
                            <div class="panel-heading">Orquesta, Coros, Ballet</div>
                            <form id="formExtracurricular">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-3 form-group">
                                        <label for="escalafon2">Escalafón</label>
										{{ Form::select('escalafon2', $scales, (isset($review['scale_id'])) ? $review['scale_id']: '0', array('class' => 'form-control', 'id' => 'escalafon2')) }}
                                    </div>
                                    <div class="col-md-3 form-group">
                                        <label for="agrupamiento2">Agrupamiento</label>
										{{ Form::select('agrupamiento2', $groupings, '0', array('class' => 'form-control', 'id' => 'agrupamiento2')) }}
                                    </div>
                                    <div class="col-md-3 form-group">
                                        <label for="categoria2">Categoría</label>
										{{ Form::select('categoria2', $categories, '0', array('class' => 'form-control', 'id' => 'categoria2')) }}
                                    </div>
                                    <div class="col-md-3 form-group">
                                        <label for="grado5">Grado</label>
                                        <select class="form-control" id="grado4" name="grado4">
                                            <?php for($i = 0; $i <= 25; $i++) { ?>
                                            <option value="<?=$i + 1 ?>"><?=$i?></option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-md-3 form-group">
                                        <label for="acto-administrativo3">Acto Administrativo</label>
                                         {{ Form::select('acto-administrativo3', $administrative_acts, '0', array('class' => 'form-control', 'id' => 'acto-administrativo3')) }}

                                    </div>
                                    <div class="col-md-3 form-group">
                                        <label for="numero-acto5">Número de Acto</label>
                                        <input type="text" class="form-control" id="numero-acto5" name="numero-acto5">
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="fecha-acto2">Fecha Acto</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="fecha-acto2" name="fecha-acto2" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label for="desde5">Desde</label>
                                            <div class='input-group date datetimepicker'>
                                                <input type='text' class="form-control" id="desde5" name="desde5" />
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="row">    
                                    
                                    <div class="col-md-3 form-group">
                                        <label for="motivo5">Motivo</label>
                                        <input type="text" class="form-control" rows="3" id="motivo5" name="motivo5">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 text-right form-group">
                                        <button type="button" id="saveExtra" name="saveExtra" class="btn btn-primary" aria-label="Left Align">
                                            <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="tblOrquesta" style ="width:100%"class="table table-bordered">
                                      <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Escalafon</th>
                                        <th class="col-md-1">Agrupamiento</th>
                                        <th class="col-md-1">Categoria</th>     
                                        <th class="col-md-1">Grado</th>
                                        <th class="col-md-1">Acto Administrativo</th>
                                        <th class="col-md-1">Numero Acto</th>
                                        <th class="col-md-1">Fecha</th>
                                        <th class="col-md-1">Desde</th>
                                        <th class="col-md-1">Motivo</th>
                                        <th class="col-md-1">Editar/Eliminar</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      </tbody>
                                      
                                    </table>
                                </div>
                            </div>
                            </form>
                        </div>-->
                    </div>
                  </div>



<!-- fin de certificacion-->

<!--Inicio licencias-->
                    <div role="tabpanel" class="tab-pane" id="licencias">
                        <form id="formLicenciaExamen">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Licencia por exámen</div>
                                <div class="panel-body">
                                    <div class="row">
                                       
                                        <div class="col-md-4 form-group">
                                            <label for="apellido-le">Apellido</label>
                                            <input type="text" class="form-control" name="apellido-le" id="apellido-le">
                                        </div>
                                        <div class="col-md-4 form-group">
                                            <label for="nombre-le">Nombre</label>
                                            <input type="text" class="form-control" name="nombre-le" id="nombre-le">
                                        </div>
                                        
                                        <div class="col-md-4 form-group">
                                            <label for="escalafon-le">Escalafón</label>
                                            {{ Form::select('escalafon-le', $license_scale, '0', array('class' => 'form-control', 'id' => 'escalafon-le')) }}
                                        </div>
                                    </div>
                                    
                                    <div class="row"> 
                                    
                                    	<div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="fecha-examen-le">Fecha del examen:</label>
                                                <div class='input-group date datetimepicker' >
                                                    <input type='text' class="form-control" name="fecha-examen-le" id="fecha-examen-le" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar">
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    	 
                                         <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="fecha-examen-desde-le">Desde:</label>
                                                <div class='input-group date datetimepicker' >
                                                    <input type='text' class="form-control" name="fecha-examen-desde-le" id="fecha-examen-desde-le" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar">
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="fecha-examen-hasta-le">Hasta:</label>
                                                <div class='input-group date datetimepicker' >
                                                    <input type='text' class="form-control" name="fecha-examen-hasta-le" id="fecha-examen-hasta-le" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar">
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>  
                                        
                                        <div class="col-md-3 form-group">
                                            <label for="total-dias-le">Total días hábiles</label>
                                            <input type="text" class="form-control" name="total-dias-le" id="total-dias-le" >
                                        </div>                                                  
 									</div>
                                    
                                    <div class="row"> 
                                    	 <div class="col-md-12 form-group">
                                            <label for="materia-le">Materia</label>
                                            <input type="text" class="form-control" name="materia-le" id="materia-le" >
                                        </div>                                                              
 									</div>
                                    
                                    <div class="row"> 
                                    	 <div class="col-md-12 form-group">
                                            <label for="catedra-le">Catedra</label>
                                            <input type="text" class="form-control" name="catedra-le" id="catedra-le">
                                        </div>                                                              
 									</div>
                                    
                                    <div class="row"> 
                                    	 <div class="col-md-12 form-group">
                                            <label for="nombre-establecimiento-le">Nombre del establecimiento</label>
                                            <input type="text" class="form-control" name="nombre-establecimiento-le" id="nombre-establecimiento-le">
                                        </div>                                                              
 									</div>
                                  	
                                    <div class="row">
                                        <div class="col-md-12 text-right">
                                            <button id="saveLicExamen" type="button" class="btn btn-primary" aria-label="Left Align">
                                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
							<br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="tblLicenciaExamen" style ="width:100%"class="table table-bordered">
                                      <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Apellido</th>
                                        <th class="col-md-1">Nombre</th>
                                        <th class="col-md-1">Escalafón</th>     
                                        <th class="col-md-1">Fecha Examen</th>
                                        <th class="col-md-1">Desde</th>
                                        <th class="col-md-1">Hasta</th>
                                        <th class="col-md-1">Total Dias Habiles</th>
                                        <th class="col-md-1">Materia</th>
                                        <th class="col-md-1">Catedra</th>
                                        <th class="col-md-1">Establecimiento</th>
                                        <th class="col-md-1">Editar/Eliminar</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      </tbody>
                                      
                                    </table>
                                </div>
                            </div>
                        </form>
                        
                        
                        <form id="formAusencia">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Ausente con aviso</div>
                                <div class="panel-body">
                                    <div class="row">
                                       
                                        <div class="col-md-4 form-group">
                                            <label for="apellido-la">Apellido</label>
                                            <input type="text" class="form-control" name="apellido-la" id="apellido-la">
                                        </div>
                                        <div class="col-md-4 form-group">
                                            <label for="nombre-la">Nombre</label>
                                            <input type="text" class="form-control" name="nombre-la" id="nombre-la">
                                        </div>
                                        
                                        <div class="col-md-4 form-group">
                                            <label for="escalafon-la">Escalafón</label>
                                            {{ Form::select('escalafon-la', $license_scale, '0', array('class' => 'form-control', 'id' => 'escalafon-la')) }}

                                        </div>
                                    </div>

                                    <div class="row"> 
                                    
                                    	<div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="fecha-ausencia-la">Fecha de la ausencia:</label>
                                                <div class='input-group date datetimepicker' >
                                                    <input type='text' class="form-control" name="fecha-ausencia-la" id="fecha-ausencia-la"/>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar">
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>                                                  
 									</div>

                                    <div class="row">
                                        <div class="col-md-12 text-right">
                                            <button id="saveLicAviso" type="button" class="btn btn-primary" aria-label="Left Align">
                                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                            </button>
                                        </div>
                                    </div>
                                    
                                    

                                </div>
                            </div>
							
							<br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="tblLicenciaAviso" style ="width:100%"class="table table-bordered">
                                      <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Apellido</th>
                                        <th class="col-md-1">Nombre</th>
                                        <th class="col-md-1">Escalafón</th>     
                                        <th class="col-md-1">Fecha Examen</th>
										<th class="col-md-1">Editar/Eliminar</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      </tbody>
                                      
                                    </table>
                                </div>
                            </div>
                        </form>
                        
                        <form id="formLicenciaMedica">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Licencia Médica</div>
                                <div class="panel-body">
                                    <div class="row">
                                       
                                        <div class="col-md-4 form-group">
                                            <label for="apellido-agente-lm">Apellido del agente</label>
                                            <input type="text" class="form-control" name="apellido-lm" id="apellido-lm">
                                        </div>
                                        <div class="col-md-4 form-group">
                                            <label for="nombre-agente-lm">Nombre del agente</label>
                                            <input type="text" class="form-control" name="nombre-lm" id="nombre-lm">
                                        </div>
                                        
                                        <div class="col-md-4 form-group">
                                            <label for="escalafon-lm">Escalafón</label>
                                            {{ Form::select('escalafon-lm', $license_scale, '0', array('class' => 'form-control', 'id' => 'escalafon-lm')) }}

                                        </div>
                                    </div>

                                    <div class="row"> 
                                    	<div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="fecha-licencia-lm">Fecha inicio de la licencia:</label>
                                                <div class='input-group date datetimepicker' >
                                                    <input type='text' class="form-control" name="fecha-licencia-lm" id="fecha-licencia-lm"/>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar">
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
										
										<div class="col-md-9 form-group">
                                            <label for="materia-lm">Materia</label>
                                            <input type="text" class="form-control" name="materia-lm" id="materia-lm">
                                        </div>
                                    	 
                                                                                        
 									</div>
                                    
                                    <div class="row"> 
                                    	 <div class="col-md-6 form-group">
                                            <label for="domicilio-lm">Domicilio</label>
                                            <input type="text" class="form-control" name="domicilio-lm" id="domicilio-lm">
                                        </div>  
                                        
                                        <div class="col-md-6 form-group">
                                            <label for="telefono-lm">Teléfono</label>
                                            <input type="text" class="form-control" name="telefono-lm" id="telefono-lm">
                                        </div>                                                             
 									</div>
                                    
                                    <div class="row"> 
                                    	 <div class="col-md-12 form-group">
                                            <label for="nombre-centro-lm">Centro de salud donde se encuentra internado: (cuando corresponda)</label>
                                            <input type="text" class="form-control" name="nombre-centro-lm" id="nombre-centro-lm">
                                        </div>                                                              
 									</div>
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                                <label for="domicilio-centro-lm">Domicilio</label>
                                                <input type="text" class="form-control" name="domicilio-centro-lm" id="domicilio-centro-lm">
                                        </div> 
                                        <div class="col-md-6 form-group">
                                            <label for="tel-centro-lm">Teléfono</label>
                                            <input type="text" class="form-control" name="tel-centro-lm" id="tel-centro-lm">
                                        </div> 
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12 text-right">
                                            <button id="saveLicMedica" type="button" class="btn btn-primary" aria-label="Left Align">
                                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                            </button>
                                        </div>
                                    </div>
                                   
                                </div>
                            </div>
							
							<br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="tblLicenciaMedica" style ="width:100%"class="table table-bordered">
                                      <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Apellido Agente</th>
                                        <th class="col-md-1">Nombre Agente</th>
                                        <th class="col-md-1">Escalafón</th>     
                                        <th class="col-md-1">Fecha Inicio</th>
                                        <th class="col-md-1">Materia</th>
                                        <th class="col-md-1">Domicilio</th>
                                        <th class="col-md-1">Teléfono</th>
                                        <th class="col-md-1">Centro Salud</th>
                                        <th class="col-md-1">Domicilio</th>
                                        <th class="col-md-1">Teléfono</th>
                                        <th class="col-md-1">Editar/Eliminar</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      </tbody>
                                      
                                    </table>
                                </div>
                            </div>
                        </form>
                        
                        <form id="formLicenciaMedicaFamiliar">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Licencia Médica(Familiar)</div>
                                <div class="panel-body">
                                    <div class="row">
                                       
                                        <div class="col-md-4 form-group">
                                            <label for="apellido-lf">Apellido del agente</label>
                                            <input type="text" class="form-control" name="apellido-lf" id="apellido-lf">
                                        </div>
                                        <div class="col-md-4 form-group">
                                            <label for="nombre-lf">Nombre del agente</label>
                                            <input type="text" class="form-control" name="nombre-lf" id="nombre-lf">
                                        </div>
                                        
                                        <div class="col-md-4 form-group">
                                            <label for="escalafon-lf">Escalafón</label>
                                            {{ Form::select('escalafon-lf', $license_scale, '0', array('class' => 'form-control', 'id' => 'escalafon-lf')) }}

                                        </div>
                                    </div>

                                    <div class="row"> 
                                    	<div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="fecha-licencia-lf">Fecha inicio de la licencia:</label>
                                                <div class='input-group date datetimepicker' >
                                                    <input type='text' class="form-control" name="fecha-licencia-lf" id="fecha-licencia-lf" />
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar">
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
										<div class="col-md-9 form-group">
                                            <label for="nombre-completo-familiar-lf">Nombre y apellido del familiar enfermo</label>
                                            <input type="text" class="form-control" name="nombre-completo-familiar-lf" id="nombre-completo-familiar-lf">
                                        </div>
                                    	                                                   
 									</div>

                                    <div class="row"> 
                                    	 <div class="col-md-4 form-group">
                                            <label for="relacion-lf">Relación de parentesco con el enfermo</label>
                                            <input type="text" class="form-control" name="relacion-lf" id="relacion-lf">
                                        </div>   
                                        
                                        <div class="col-md-4 form-group">
                                            <label for="domicilio-lf">Domicilio del familiar enfermo</label>
                                            <input type="text" class="form-control" name="domicilio-lf" id="domicilio-lf">
                                        </div>  
                                        
                                        <div class="col-md-4 form-group">
                                            <label for="telefono-familiar-lf">Teléfono del familiar enfermo</label>
                                            <input type="text" class="form-control" name="telefono-familiar-lf" id="telefono-familiar-lf">
                                        </div>                                                             
 									</div>
                                    
                                    <div class="row"> 
                                    	 <div class="col-md-12 form-group">
                                            <label for="nombre-centro-lf">Centro de salud donde se encuentra internado: (cuando corresponda)</label>
                                            <input type="text" class="form-control" name="nombre-centro-lf" id="nombre-centro-lf">
                                        </div>                                                              
 									</div>
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                                <label for="domicilio-centro-lf">Domicilio</label>
                                                <input type="text" class="form-control" name="domicilio-centro-lf" id="domicilio-centro-lf">
                                        </div> 
                                        <div class="col-md-6 form-group">
                                            <label for="tel-centro-lf">Teléfono</label>
                                            <input type="text" class="form-control" name="tel-centro-lf" id="tel-centro-lf">
                                        </div> 
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 text-right">
                                            <button id="saveLicFamiliar" type="button" class="btn btn-primary" aria-label="Left Align">
                                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Guardar
                                            </button>

                                        </div>
                                    </div>
                                  
                                </div>
                            </div>
							
							<br>
                            <div class="row">
                                <div class="col-md-12">
                                    <table id="tblLicenciaMedicaFamiliar" style ="width:100%"class="table table-bordered">
                                      <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Apellido Agente</th>
                                        <th class="col-md-1">Nombre Agente</th>
                                        <th class="col-md-1">Escalafón</th>     
                                        <th class="col-md-1">Fecha Inicio</th>
										<th class="col-md-1">Familiar</th>
                                        <th class="col-md-1">Relacion</th>
                                        <th class="col-md-1">Domicilio</th>
                                        <th class="col-md-1">Teléfono</th>
                                        <th class="col-md-1">Centro Salud</th>
                                        <th class="col-md-1">Domicilio</th>
                                        <th class="col-md-1">Teléfono</th>
                                        <th class="col-md-1">Editar/Eliminar</th>
                                      </tr>
                                      </thead>
                                      <tbody>
                                      </tbody>
                                      
                                    </table>
                                </div>
                            </div>
						
                        </form>
                        
                        
                    </div>

<!-- fin licencias -->

<!--Inicio archivos-->
                    <div role="tabpanel" class="tab-pane" id="archivos">
                        <form id="formArchivos">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Archivos</div>
                                <div class="panel-body">
                                    <div class="row">
                                       
                                        <div class="col-md-12 form-group">
                                            <label for="archivo">Archivo</label>
                                            <input type="file" class="form-control" name="archivo" id="archivo">
                                        </div>                           
                                    </div>
                                    
                                    <div class="row">                                    
                                    	<div class="col-md-12 form-group">
                                            <label for="descripcion">Descripción</label>
                                            <input type="text" class="form-control" name="descripcion" id="descripcion">
                                        </div>                                               
 									</div>
                                    
                                    <div class="row">
                                        <div class="col-md-12 text-right">
                                            <button id="agregar_archivo" type="button" class="btn btn-primary" aria-label="Left Align">
                                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Agregar
                                            </button>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-8 col-md-offset-2">
                                            <table style ="width:100%"class="table table-bordered">
                                              <tr class="info">
                                                <th>Fecha</th>
                                                <th>Usuario</th>
                                                <th>Archivo</th>
                                                <th>Titulo</th>
                                                <th>Editar</th>
                                                <th>Eliminar</th>
                                                <th class="col-md-1">Descargar</th>
                                                
                                              </tr>
                                              <tr>
                                                <td>30/09/2015</td>
                                                <td>Juan Perez</td> 
                                                <td>archivo.txt</td> 
                                                <td>Certificado</td> 
                                                <td align="center"><button type="button"  aria-label="Left Align" name="edit_archivo" id="edit_archivo">
                                                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                    </button>
                                                </td> 
                                                <td align="center"><button type="button" aria-label="Left Align" name="eliminar_archivo" id="eliminar_archivo">
                                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                    </button>
                                                </td> 
                                                <td align="center"><button type="button" aria-label="Left Align" name="descargar_archivo" id="descargar_archivo">
                                                        <span class="glyphicon glyphicon-download" aria-hidden="true"></span>
                                                    </button>
                                                 </td>                                               
                                              </tr>
                                              <tr>
                                                <td>30/09/2015</td>
                                                <td>Juan Perez</td> 
                                                <td>archivo.txt</td> 
                                                <td>Certificado</td> 
                                                <td align="center"><button type="button"  aria-label="Left Align" name="edit_archivo" id="edit_archivo">
                                                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                                    </button>
                                                </td> 
                                                <td align="center"><button type="button" aria-label="Left Align" name="eliminar_archivo" id="eliminar_archivo">
                                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                    </button>
                                                </td> 
                                                <td align="center"><button type="button" aria-label="Left Align" name="descargar_archivo" id="descargar_archivo">
                                                        <span class="glyphicon glyphicon-download" aria-hidden="true"></span>
                                                    </button>
                                                 </td>                                              
                                              </tr>
                                              
                                            </table>
                                        </div>
                                    </div>
                                  	
                                    
                                </div>
                            </div>
                        </form>
                      
                        
                        
                    </div>

<!-- fin archivos -->




                </div><!--content-->
            </div><!--dotación-->

        </div><!--container-->

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    {{ HTML::script('js/jquery.min.js') }}
    {{ HTML::script('js/bootstrap.min.js') }}
    {{ HTML::script('js/moment.min.js') }}
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


