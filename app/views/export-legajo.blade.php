<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Hospital Posadas</title>
        <meta name="description" content="Login">
        <link rel="stylesheet" href="{{ URL::asset('css/main.css'); }}"> 
        <style type="text/css">

        	.panel {
			  margin-bottom: 20px;
			  background-color: #fff;
			  border: 1px solid transparent;
			  border-radius: 4px;
			  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
			          box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
			}
			.panel-body {
			  padding: 15px;
			}
			.panel-heading {
			  padding: 10px 15px;
			  border-bottom: 1px solid transparent;
			  border-top-left-radius: 3px;
			  border-top-right-radius: 3px;
			}
			.panel-heading > .dropdown .dropdown-toggle {
			  color: inherit;
			}
			.panel-title {
			  margin-top: 0;
			  margin-bottom: 0;
			  font-size: 16px;
			  color: inherit;
			}
			.panel-title > a,
			.panel-title > small,
			.panel-title > .small,
			.panel-title > small > a,
			.panel-title > .small > a {
			  color: inherit;
			}
			table {
			  border-spacing: 0;
			  border: 1px;
			}
			td,
			th {
			  padding: 0;
			  text-align: left;
			}

			table thead tr {
				background-color: #ccc;
			}

			table tbody tr:nth-child(odd) td {
			    background-color: #F5F2E4;
			}

			/* para las filas paras */
			table tbody tr:nth-child(even) td {
			    background-color: #f6f6f6;
			}

			h1 {
				margin: 0;
				padding: 0;
			}

			h2{
				background-color: #CCC;
				display: block;
			}

			.page-break { display: block; page-break-before: always; }

			.container {
				border: 0;
			}

        </style>
    </head>
    <body>
        <div class="container">
            <div role="tabpanel" class="tab-pane active" style="margin-top:48px">

                <div class="tab-content">  
                <h1>Legajo de <?= $empleado->name . " " . $empleado->lastname ?></h1>
                	<div class="panel panel-primary">
						<h2 class="panel-heading">Datos Personales</h2>                            
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%"class="table table-bordered">
										<tbody>
											<tr>
												<td><label>Número de Legajo</label></td>
												<td><?= $empleado->id ?></td>
											</tr>
											<tr>
												<td><label>Nombres y Apellidos</label></td>
												<td><?= $empleado->name . " " . $empleado->lastname ?></td>
											</tr>
											<tr>
												<td><label>Sexo</label></td>
												<td><?= $empleado->gender ?></td>
											</tr>
											<tr>
												<td><label>CUIL</label></td>
												<td><?= $empleado->cuil ?></td>
											</tr>
											<tr>
												<td><label>Tipo de Documento</label></td>
												<td><?= $empleado->document_type->name ?></td>
											</tr>
											<tr>
												<td><label>Número de Documento</label></td>
												<td><?= $empleado->document ?></td>
											</tr>
											<tr>
												<td><label>Nacionalidad</label></td>
												<td><?= $empleado->city->country->name ?></td>
											</tr>
											<tr>
												<td><label>Estado Civil</label></td>
												<td><?= $empleado->marital_status ?></td>
											</tr>
											<tr>
												<td><label>Fecha de Nacimiento</label></td>
												<td><?= DateTime::createFromFormat('Y-m-d', $empleado->birthdate)->format('d-m-Y') ?></td>
											</tr>
											<tr>
												<td><label>Lugar de Nacimiento</label></td>
												<td><?= $empleado->city->name ?></td>
											</tr>
											<tr>
												<td><label>Estado Personal</label></td>
												<td><?= $employee_status->status->name ?></td>
											</tr>
											<tr>
												<td><label>Desde</label></td>
												<td><?= ($employee_status->from != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $employee_status->from)->format('d-m-Y') : "" ?></td>
											</tr>
											<tr>
												<td><label>Hasta</label></td>
												<td><?= ($employee_status->to != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $employee_status->to)->format('d-m-Y') : "" ?></td>
											</tr>
										</tbody>                                        
									</table>
								</div>
							</div>
						</div>
					</div>
				
					<div class="panel panel-primary">
						<h2 class="panel-heading">Datos de Contacto</h2>                            
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%" class="table table-bordered">
									<thead>
									  <tr class="info">
										<th>Tipo</th>
										<th>Dato</th>
										
									  </tr>
									</thead>
									<tbody>
									<?php foreach ($contactos as $contacto){ ?>
										<tr>
											<td><?= $contacto->value ?></td>
											<td><?= $contacto->contact_type->name ?></td>
										</tr>
									<?php } ?>
									</tbody>                                        
									</table>
								</div>
							</div>
						</div>
					</div>

					<div class="page-break"></div>

					<div class="panel panel-primary">
						<h2 class="panel-heading">Direcciones</h2>                            
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%"class="table table-bordered">
                                  <thead>
                                  <tr class="info">
                                    <th class="col-md-1" >Tipo</th>
                                    <th class="col-md-1">Calle</th>
                                    <th class="col-md-1">Nº</th>     
                                    <th class="col-md-1">piso</th>
                                    <th class="col-md-1">Dpto</th>
                                    <th class="col-md-1">CP</th>
                                    <th class="col-md-1">Provincia</th>
                                    <th class="col-md-1">Partido</th>
                                    <th class="col-md-1">Localidad</th>
                                    <th class="col-md-1">Barrio</th>
                                    <th class="col-md-1">Teléfono</th>
                                  </tr>
                                  </thead>
                                  <tbody>
										<?php foreach ($employee_address as $address){ ?>
										<tr>
											<td><?php echo (isset($address->adresses)) ? $address->adresses->type : '' ?></td>
											<td><?php echo (isset($address->adresses)) ? $address->adresses->street : '' ?></td>
											<td><?php echo (isset($address->adresses)) ? $address->adresses->number : '' ?></td>
											<td><?php echo (isset($address->adresses)) ? $address->adresses->floor : '' ?></td>
											<td><?php echo (isset($address->adresses)) ? $address->adresses->department : '' ?></td>
											<td><?php echo (isset($address->adresses)) ? $address->adresses->postal_code : '' ?></td>
											<td><?php echo (isset($address->adresses)) ? $address->adresses->province->name : '' ?></td>
											<td><?php echo (isset($address->adresses)) ? $address->adresses->neighborhood : '' ?></td>
											<td><?php echo (isset($address->adresses)) ? $address->adresses->locality->name : '' ?></td>
											<td><?php echo (isset($address->adresses)) ? $address->adresses->split->name : '' ?></td>
											<td><?php echo (isset($address->adresses)) ? $address->adresses->phone : '' ?></td>
										</tr>
										<?php } ?>
                                  </tbody>
                                  
                                </table>
								</div>
							</div>
						</div>
					</div>

					
					<div class="panel panel-primary">
                        <h2 class="panel-heading">Datos Médicos</h2>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <table style ="width:100%" class="table table-bordered">
                                      <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Tipo Discapacidad</th>
                                        <th class="col-md-1">Fecha Emisión</th>
                                        <th class="col-md-1">Desde</th>
                                        <th class="col-md-1">Hasta</th>
                                        <th class="col-md-2">Entidad Emisora</th>
                                      </tr>
                                      </thead>
                                      <tbody>
											<?php foreach ($disabilities as $disability){ ?>
											<tr>
												<td><?php echo $disability->name ?></td>														
												<td><?= ($disability->generated_date != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $disability->generated_date)->format('d-m-Y') : "" ?></td>														
												<td><?= ($disability->start_date != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $disability->start_date)->format('d-m-Y') : "" ?></td>														
												<td><?= ($disability->end_date != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $disability->end_date)->format('d-m-Y') : "" ?></td>	
												<td><?php echo $disability->certificate_creator ?></td>	
											</tr>
											<?php } ?>
									  </tbody>
                                      
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="page-break"></div>

                    <div class="panel panel-primary">
                        <h2 class="panel-heading">Familiares</h2>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <table style ="width:100%" class="table table-bordered">
                                    <thead>
                                      <tr class="info">
                                        <th class="col-md-1">Apellido</th>
                                        <th class="col-md-1">Nombre</th>     
                                        <th class="col-md-1">Sexo</th>
                                        <th class="col-md-1">Fecha Nacimiento</th>
                                        <th class="col-md-1">Parentesco</th>
                                      </tr>
                                    </thead>
                                    <tbody> 
										<?php foreach ($families as $family){ ?>
										<tr>
											<td><?= $family->lastname ?></td>														
											<td><?= $family->name ?></td>														
											<td><?= $family->gender	 ?></td>														
											<td><?= ($family->birthdate != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $family->birthdate)->format('d-m-Y') : "" ?></td>	
											<td><?= $family->kinship->name ?></td>	
										</tr>
										<?php } ?>
                                    </tbody>  
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-primary">
                        <h2 class="panel-heading">Laboral</h2>
                        <div class="panel-body">
							<div class="row">
								<div class="col-md-12">

									<div class="col-md-12">
										<table style="width:100%" class="table table-bordered ">
											<thead>
											<tr class="info">
												<th>Área</th>
												<th>Local</th>
												<th>Oficina</th>     
												<th>Días</th>
												<th>Horario</th>
												<th>Desde</th>
												<th>Hasta</th>
											</tr>
											</thead>
											<tbody>
												<?php foreach ($schedules as $schedule){ ?>
												<tr>
													<td><?= $schedule->area->name ?></td>														
													<td><?= $schedule->office->name ?></td>														
													<td><?= $schedule->office->building->name ?></td>		
													<td><?= $schedule->days ?></td>	
													<td><?= $schedule->time_in . " - " . $schedule->time_out ?></td>
													<td><?= ($schedule->date_from) ? DateTime::createFromFormat('Y-m-d', $schedule->date_from)->format('d-m-Y') : "" ?></td>
													<td><?= ($schedule->date_to) ? DateTime::createFromFormat('Y-m-d', $schedule->date_to)->format('d-m-Y') : "" ?></td>
												</tr>
												<?php } ?>
											</tbody>
										</table>
									</div>   
								</div>
							</div>
						</div>
                    </div>
					
					<div class="page-break"></div>

					<div class="panel panel-primary">
						<h2 class="panel-heading">Situación de Revista</h2>
                        <div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style="width:100%" class="table table-bordered ">
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
											</tr>
										</thead>
										<tbody>
											<?php foreach ($reviews as $review){ ?>
											<tr>
												<td><?= $review->scale->name ?></td>														
												<td><?= $review->grouping->name ?></td>
												<td><?= $review->level ?></td>
												<td><?= $review->grade ?></td>
												<td><?= $review->stretch->name ?></td>
												<td><?= $review->category->name ?></td>
												<td><?= $review->executive_function ?></td>
												<td><?= ($review->in_afip != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $review->in_afip)->format('d-m-Y') : "" ?></td>
												<td><?= ($review->out_afip != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $review->out_afip)->format('d-m-Y') : "" ?></td>
												<td><?= ($review->date_afip != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $review->date_afip)->format('d-m-Y') : "" ?></td>
											</tr>
											<?php } ?>
										</tbody>
									 </table>
								</div>   
							</div>
                        </div> 
                    </div>                                      

					<div class="panel panel-primary">
						<h2 class="panel-heading">Roles</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style="width:100%" class="table table-bordered ">
										<thead>
											<tr class="info">
												<th>Rol</th>
												<th>Descripción</th>
												<th>Desde</th>     
												<th>Hasta</th>
											</tr>
										</thead>
										<tbody>
										   
										</tbody>
									 </table>
								</div>   
							</div> 
						</div>
					</div>

					<div class="page-break"></div>
					
					<div class="panel panel-primary">
						<h2 class="panel-heading">Educación</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style="width:100%" class="table table-bordered ">
									<thead>
									  <tr class="info">
										<th>Institución</th>
										<th>Título</th>
										<th>Fecha Egreso</th>     
										<th>Nivel Estudio</th>
										<th>Estado</th>
									  </tr>
									</thead>
									<tbody>
									<?php foreach ($educations as $education){ ?>
									<tr>
										<td><?= $education->education->institution->name ?></td>														
										<td><?= $education->education->education_title ?></td>														
										<td><?= ($education->education->start_date != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $education->education->start_date)->format('d-m-Y') : "" ?></td>	
										<td><?= $education->education->level->name ?></td>														
										<td><?= $education->education->status->name ?></td>														
									</tr>
									<?php } ?> 
									</tbody>
								   </table>
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-primary">
						<h2 class="panel-heading">Cursos</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style="width:100%" class="table table-bordered ">
									<thead>
									  <tr class="info">
										<th>Institución</th>
										<th>Certificado</th>     
										<th>Finalización</th>
									  </tr>
									</thead>
									<tbody>
										<?php foreach ($courses as $course){ ?>
										<tr>
											<td><?= $course->course->name ?></td>														
											<td><?= $course->course->certificate ?></td>														
											<td><?= ($course->course->end_date != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $course->course->end_date)->format('d-m-Y') : '' ?></td>														
										</tr>
										<?php } ?> 											 
									</tbody>  
								   </table>
								</div>
							</div>
                        </div>
                    </div>
               
                    <div class="panel panel-primary">
						<h2 class="panel-heading">Congresos</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style="width:100%" class="table table-bordered">
									<thead>
									  <tr class="info">
										<th>Congreso</th>
										<th>Especialidad</th>     
										<th>Certificado</th>
										<th>Fecha</th>
									  </tr>
									</thead>
									<tbody>
										<?php foreach ($congresses as $congress){ ?>
										<tr>
											<td><?= $congress->congress->name ?></td>														
											<td><?= $congress->congress->especiality ?></td>	
											<td><?= $congress->congress->certificate ?></td>
											<td><?= ($congress->congress->end_date != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $congress->congress->end_date)->format('d-m-Y') : '' ?></td>														
										</tr>
										<?php } ?>
									</tbody>  
								   </table>
								</div>
							</div>
                        </div>
                    </div>

                    <div class="page-break"></div>
                        
                    <div class="panel panel-primary">
						<h2 class="panel-heading">Idiomas</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table  style="width:100%" class="table table-bordered  ">
									<thead>  
									  <tr class="info">
										<th>Idioma</th>
										<th>Nivel Escrito</th>     
										<th>Nivel Oral</th>
									  </tr>
									  </thead>
									  <tbody>
										<?php foreach ($languages as $language){ ?>
										<tr>
											<td><?= $language->language->name ?></td>														
											<td><?= $language->write_level ?></td>
											<td><?= $language->speak_level ?></td>
										</tr>
										<?php } ?>
									  </tbody>
								   </table>
								</div>
							</div>
                        </div>
                    </div>
              
                    <div class="panel panel-primary">
						<h2 class="panel-heading">Informática</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style="width:100%" class="table table-bordered">
									<thead>
									  <tr class="info">
										<th>Área</th>
										<th>Nivel</th>
									  </tr>
									</thead>
									<tbody>  
										<?php foreach ($informatics as $informatic){ ?>
										<tr>
											<td><?= $informatic->course->area->name ?></td>
											<td><?= $informatic->course->level->name ?></td>
										</tr>
										<?php } ?>
									</tbody>
									  
								   </table>
								</div>
							</div> 
						</div>	
                    </div>
               
                    <div class="panel panel-primary">
						<h2 class="panel-heading">Conocimientos Adicionales</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%"class="table table-bordered">
									  <thead>
									  <tr class="info">
										<th class="col-md-1">Nombre Publicación</th>
										<th class="col-md-1">Fecha</th>     
										<th class="col-md-1">Nivel Educativo</th>
										<th class="col-md-1">Especialidad/Materia</th>
										<th class="col-md-1">Institucion</th>
									  </tr>
									  </thead>
									  <tbody>
										<?php foreach ($additionals as $additional){ ?>
										<tr>
											<td><?= $additional->publication_name ?></td>
											<td><?= ($additional->publication_date != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $additional->publication_date)->format('d-m-Y') : "" ?></td>
											<td><?= $additional->educationLevel->name ?></td>
											<td><?= $additional->departament ?></td>
											<td><?= $additional->intitution ?></td>
										</tr>
										<?php } ?>
									  </tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
           
           			<div class="page-break"></div>

					<div class="panel panel-primary">
						<h2 class="panel-heading">Servicios Públicos</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%"class="table table-bordered">
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
									  </tr>
									  </thead>
									  <tbody>
										<?php foreach ($publicServices as $publicService){ ?>
										<tr>
											<td><?= $publicService->organism ?></td>
											<td><?= (isset($publicService->reviewSituation)) ? $publicService->reviewSituation->name : '' ?></td>
											<td><?= $publicService->motivation ?></td>
											<td><?= $publicService->destination ?></td>
											<td><?= ($publicService->date_from != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $publicService->date_from)->format('d-m-Y') : "" ?></td>
											<td><?= ($publicService->date_to != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $publicService->date_to)->format('d-m-Y') : "" ?></td>
											<td><?= $publicService->administrativeAct->name ?></td>
											<td><?= $publicService->act_number ?></td>
											<td><?= ($publicService->act_date != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $publicService->act_date)->format('d-m-Y') : "" ?></td>
										</tr>
										<?php } ?>
									  </tbody>
									</table>
								</div>
							</div>
						</div>	
					</div>
					

							
					<div class="panel panel-primary">
						<h2 class="panel-heading">Servicios Privados</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%"class="table table-bordered">
									  <thead>
									  <tr class="info">
										<th class="col-md-1">Institución</th>
										<th class="col-md-1">Domicilio</th>
										<th class="col-md-1">Cargo Función</th>     
										<th class="col-md-1">Remunerado</th>
										<th class="col-md-1">Desde</th>
										<th class="col-md-1">Hasta</th>
										<th class="col-md-1">Causa/Egreso</th>
									  </tr>
									  </thead>
									  <tbody>
										<?php foreach ($privateServices as $privateService){ ?>
										<tr>
											<td><?= $privateService->institution_name ?></td>
											<td><?= $privateService->legal_adress ?></td>
											<td><?= $privateService->charge_function ?></td>
											<td><?= ($privateService->remunerated == 1) ? 'SI' : 'NO'  ?></td>
											<td><?= ($privateService->date_from != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $privateService->date_from)->format('d-m-Y') : "" ?></td>
											<td><?= ($privateService->date_to != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $privateService->date_to)->format('d-m-Y') : "" ?></td>
											<td><?= $privateService->out_motivation ?></td>
										</tr>
										<?php } ?>
									  </tbody>
									  
									</table>
								</div>
							</div>
						</div>	
					</div>
					
					
					<div class="panel panel-primary">
						<h2 class="panel-heading">Felicitaciones y Menciones</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%"class="table table-bordered">
									  <thead>
									  <tr class="info">
										<th class="col-md-1">Jurisdicción</th>
										<th class="col-md-1">Organismo</th>
										<th class="col-md-1">Concepto</th>     
										<th class="col-md-1">Motivo</th>
										<th class="col-md-1">Acto Administrativo</th>
										<th class="col-md-1">Numero Acto</th>
										<th class="col-md-1">Fecha</th>
									  </tr>
									  </thead>
									  <tbody>
										<?php foreach ($congratulations as $congratulation){ ?>
										<tr>
											<td><?= $congratulation->jurisdiction ?></td>
											<td><?= $congratulation->organization ?></td>
											<td><?= $congratulation->motivation ?></td>
											<td><?= $congratulation->observation ?></td>
											<td><?= $congratulation->administrativeAct->name ?></td>
											<td><?= $congratulation->act_number ?></td>
											<td><?= ($congratulation->mention_date != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $congratulation->mention_date)->format('d-m-Y') : "" ?></td>
										</tr>
										<?php } ?>
									  </tbody>
									  
									</table>
								</div>
							</div>
						</div>	
					</div>		

					<div class="page-break"></div>
                
                    <div class="panel panel-primary">
						<h2 class="panel-heading">Sanciones</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%"class="table table-bordered">
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
									  </tr>
									  </thead>
									  <tbody>
										<?php foreach ($sanctions as $sanction){ ?>
										<tr>
											<td><?= $sanction->institution ?></td>
											<td><?= $sanction->administrativeAct->name ?></td>
											<td><?= $sanction->act_number ?></td>
											<td><?= ($sanction->sanction_date != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $sanction->sanction_date)->format('d-m-Y') : "" ?></td>
											<td><?= $sanction->disciplinary_action ?></td>
											<td><?= $sanction->cause ?></td>
											<td><?= ($sanction->santion_from != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $sanction->santion_from)->format('d-m-Y') : "" ?></td>
											<td><?= ($sanction->sanction_to != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $sanction->sanction_to)->format('d-m-Y') : "" ?></td>
										</tr>
										<?php } ?>
									  </tbody>
									  
									</table>
								</div>
							</div>
						</div>	
					</div>
                
				
					<div class="panel panel-primary">
						<h2 class="panel-heading">Embargos</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%"class="table table-bordered">
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
									  </tr>
									  </thead>											 
									  <tbody>
										<?php foreach ($seizures as $seizure){ ?>
										<tr>
											<td><?= $seizure->expedient_number ?></td>
											<td><?= ($seizure->date_From != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $seizure->date_From)->format('d-m-Y') : "" ?></td>
											<td><?= $seizure->charter ?></td>
											<td><?= $seizure->tribunal ?></td>
											<td><?= $seizure->secretary ?></td>
											<td><?= $seizure->cars ?></td>
											<td><?= $seizure->ammount ?></td>
											<td><?= ($seizure->worked == 1) ? 'SI' : 'NO' ?></td>
											<td><?= ($seizure->earned == 1) ? 'SI' : 'NO' ?></td>
										</tr>
										<?php } ?>
									  </tbody>
									  
									</table>
								</div>
							</div>
						</div>	
					</div>    
							
					<div class="page-break"></div>
							
					<div class="panel panel-primary">
						<h2 class="panel-heading">Evaluación de Desempeño</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%"class="table table-bordered">
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
									  </tr>
									  </thead>
									  <tbody>
										<?php foreach ($evaluations as $evaluation){ ?>
										<tr>
											<td><?= $evaluation->year_evaluation ?></td>
											<td><?= $evaluation->qualification ?></td>
											<td><?= $evaluation->used ?></td>
											<td><?= $evaluation->level ?></td>
											<td><?= $evaluation->grade_evaluation ?></td>
											<td><?= $evaluation->bonification ?></td>
											<td><?= $evaluation->notification ?></td>
											<td><?= $evaluation->observations ?></td>													
										</tr>
										<?php } ?>
									  </tbody>
									  
									</table>
								</div>
							</div>
						</div>	
					</div>
					
					<div class="page-break"></div>

					<div class="panel panel-primary">
						<h2 class="panel-heading">Créditos de Capacitación</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%"class="table table-bordered">
									  <thead>
									  <tr class="info">
										<th class="col-md-1">Año</th>
										<th class="col-md-1">Cantidad</th>
										<th class="col-md-1">Utilizados</th>     
										<th class="col-md-1">Total</th>
										<th class="col-md-1">Vigencia</th>
										<th class="col-md-1">Observaciones</th>
									  </tr>
									  </thead>
									  <tbody>
										<?php foreach ($capacitations as $capacitation){ ?>
										<tr>
											<td><?= $capacitation->year_credit ?></td>
											<td><?= $capacitation->credit_quantity ?></td>
											<td><?= $capacitation->credit_used ?></td>
											<td><?= $capacitation->credit_total ?></td>
											<td><?= ($capacitation->validity_date != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $capacitation->validity_date)->format('d-m-Y') : "" ?></td>
											<td><?= $capacitation->observations ?></td>													
										</tr>
										<?php } ?>
									  </tbody>
									  
									</table>
								</div>
							</div>
						</div>	
					</div>	
					
					<div class="page-break"></div>
					
					<div class="panel panel-primary">
						<h2 class="panel-heading">Historial de Carrera</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%"class="table table-bordered">
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
									  </tr>
									  </thead>
									  <tbody>
										<?php foreach ($historics as $historic){ ?>
										<tr>													
											<td><?= $historic->stretch->name ?></td>
											<td><?= $historic->grouping->name ?></td>
											<td><?= $historic->category_id ?></td>
											<td><?= $historic->scale->name ?></td>
											<td><?= $historic->stretch->name ?></td>
											<td><?= $historic->administrativeAct->name ?></td>
											<td><?= $historic->act_number ?></td>
											<td><?= ($historic->act_date != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $historic->act_date)->format('d-m-Y') : "" ?></td>
											<td><?= ($historic->date_from != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $historic->date_from)->format('d-m-Y') : "" ?></td>
											<td><?= $historic->motivation ?></td>													
										</tr>
										<?php } ?>
									  </tbody>
									  
									</table>
								</div>
							</div>
						</div>	
					</div>
                        
						
					<div class="panel panel-primary">
						<h2 class="panel-heading">Orquesta, Coros, Ballet</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%" class="table table-bordered">
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
									  </tr>
									  </thead>
									  <tbody>
										<?php foreach ($ochestras as $ochestra){ ?>
										<tr>													
											<td><?= $ochestra->stretch->name ?></td>
											<td><?= $ochestra->grouping->name ?></td>
											<td><?= $ochestra->category->name ?></td>
											<td><?= $ochestra->scale->name ?></td>
											<td><?= $ochestra->administrativeAct->name ?></td>
											<td><?= $ochestra->act_number ?></td>
											<td><?= ($ochestra->act_date != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $ochestra->act_date)->format('d-m-Y') : "" ?></td>
											<td><?= ($ochestra->date_from != "0000-00-00") ? DateTime::createFromFormat('Y-m-d', $ochestra->date_from)->format('d-m-Y') : "" ?></td>
											<td><?= $ochestra->motivation ?></td>													
										</tr>
										<?php } ?>
									  </tbody>
									  
									</table>
								</div>
							</div>
						</div>
					</div>

					<div class="page-break"></div>
					
					<div class="panel panel-primary">
						<h2 class="panel-heading">Licencia por exámen</h2>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%" class="table table-bordered">
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
									  </tr>
									  </thead>
									  <tbody>
										<?php foreach ($exams as $exam){ ?>
										<tr>													
											<td><?= $exam->lastname ?></td>
											<td><?= $exam->firstname ?></td>
											<td><?= $exam->name ?></td>
											<td><?= (isset( $exam->exam_date)) ? DateTime::createFromFormat('Y-m-d', $exam->exam_date)->format('d-m-Y') : '' ?></td>
											<td><?= (isset( $exam->exam_from)) ? DateTime::createFromFormat('Y-m-d', $exam->exam_from)->format('d-m-Y') : '' ?></td>
											<td><?= (isset( $exam->exam_to)) ? DateTime::createFromFormat('Y-m-d', $exam->exam_to)->format('d-m-Y') : '' ?></td>
											<td><?= $exam->total_ability_days ?></td>
											<td><?= $exam->matter ?></td>
											<td><?= $exam->cathedra ?></td>
											<td><?= $exam->establishment ?></td>
										</tr>
										<?php } ?>
									  </tbody>
									  
									</table>
								</div>
							</div>
						</div>
					</div>	

					<div class="panel panel-primary">
                        <h2 class="panel-heading">Ausente con aviso</h2>
                        <div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%" class="table table-bordered">
									  <thead>
									  <tr class="info">
										<th class="col-md-1">Apellido</th>
										<th class="col-md-1">Nombre</th>
										<th class="col-md-1">Escalafón</th>     
										<th class="col-md-1">Fecha Examen</th>
									  </tr>
									  </thead>
									  <tbody>
                                        <?php foreach ($absents as $absent){ ?>
                                        <tr>                                                    
                                            <td><?= $absent->lastname ?></td>
                                            <td><?= $absent->firstname ?></td>
                                            <td><?= $absent->name ?></td>
                                            <td><?= (isset( $absent->absent_date)) ? DateTime::createFromFormat('Y-m-d', $absent->absent_date)->format('d-m-Y') : '' ?></td>                                                    
                                        </tr>
                                        <?php } ?>
									  </tbody>
									  
									</table>
								</div>
							</div>
						</div>	
					</div>
					
					<div class="page-break"></div>

					<div class="panel panel-primary">
                        <h2 class="panel-heading">Licencia Médica</h2>
                        <div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%" class="table table-bordered">
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
									  </tr>
									  </thead>
									  <tbody>
                                        <?php foreach ($medicals as $medical){ ?>
                                        <tr>                                                    
                                            <td><?= $medical->agent_lastname ?></td>
                                            <td><?= $medical->agent_firstname ?></td>
                                            <td><?= $medical->name ?></td>
                                            <td><?= (isset( $medical->date_from)) ? DateTime::createFromFormat('Y-m-d', $medical->date_from)->format('d-m-Y') : '' ?></td>                                                    
                                            <td><?= $medical->matter ?></td>
                                            <td><?= $medical->domicile ?></td>
                                            <td><?= $medical->phone ?></td>
                                            <td><?= $medical->clinic_name ?></td>
                                            <td><?= $medical->clinic_domicile ?></td>
                                            <td><?= $medical->clinic_phone ?></td>
                                       </tr>
                                        <?php } ?>
									  </tbody>
									  
									</table>
								</div>
							</div>
						</div>	
					</div>
					
					<div class="panel panel-primary">
                        <h2 class="panel-heading">Licencia Médica(Familiar)</h2>
                        <div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<table style ="width:100%" class="table table-bordered">
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
									  </tr>
									  </thead>
									  <tbody>
                                        <?php foreach ($medical_families as $medical){ ?>
                                        <tr>                                                    
                                            <td><?= $medical->agent_lastname ?></td>
                                            <td><?= $medical->agent_firstname ?></td>
                                            <td><?= $medical->name ?></td>
                                            <td><?= (isset( $medical->date_from)) ? DateTime::createFromFormat('Y-m-d', $medical->date_from)->format('d-m-Y') : '' ?></td>                                                    
                                            <td><?= $medical->family_fullname ?></td>
                                            <td><?= $medical->family_parent ?></td>
                                            <td><?= $medical->family_domicile ?></td>
                                            <td><?= $medical->family_phone ?></td>
                                            <td><?= $medical->clinic_name ?></td>
                                            <td><?= $medical->clinic_domicile ?></td>
                                            <td><?= $medical->clinic_phone ?></td>
                                       </tr>
                                        <?php } ?>
									  </tbody>
									  
									</table>
								</div>
							</div>
						</div>
					</div>
                </div>
            </div><!--content-->
        </div><!--dotación-->


    </div><!--container-->
    </body>
</html>