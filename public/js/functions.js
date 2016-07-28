var var_id_employee_contact_type, var_id, var_public_service_id, var_review_id;
var respuesta = ['No', 'Si'];

$('#save').click(function() {

    var isValid = $("form#formPersonal").valid();

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
            if(result){
                params = {};

                var options = { 
                    url: '/savedata',
                    dataType:  'json',
                    data: {
                        id: $("#id_legajo").val()
                    },
                    type: 'post',
                    success: showResponsePersonal
                };  

                var respuestaPersonal = $("form#formPersonal").ajaxSubmit(options, function(){})
            }
        });
    }
    return false;        
});

function showResponsePersonal(msg, statusText, xhr, $form)  { 
    if (msg.status == 0){
        $('#id_legajo').val(msg.response);
        bootbox.alert(msg.message, function() {
            $("#contact-info").show();
            $("#address-info").show();
            $('ul#menu li').show();

            $.ajax({
                url: '/upload/' + msg.employee.photo,
                type:'HEAD',
                error: function()
                {
                    //file not exists
                },
                success: function()
                {
                    $("img.img-thumbnail").attr("src", '/upload/' + msg.employee.photo);
                }
            });

            $("label#employee-info").text("Nombre del Empleado: " + $("#name").val() + " " + $("#lastname").val());
        });
    }else{
        bootbox.alert("Se han detectado errores en el proceso de registro. Por favor intente nuevamente", function(){})
    }
} 

$('#savePhone').click(function() {

    var isValid = $("form#formContactPhone").valid();

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				var phone = $("#numero_tel").val();
				var id_legajo = $('#id_legajo').val();
				var tipo_telefono = $('#tipo_telefono').val();

				params = {}
				params["phone"] = phone;
				params["id_employee"] = id_legajo;
				params["contact_type"] = tipo_telefono;
				params["id_employee_contact_type"] = var_id_employee_contact_type;
				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/savePhone",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
					if(status == '0'){
						loadContacts($('#id_legajo').val());
						$("#numero_tel").val("");
						var_id_employee_contact_type = "";
					}
					else{
						bootbox.alert("Se han detectado errores en el registro del Teléfono. Por favor intente nuevamente" + msg,  function(){});
					}
				});
			}
        })
    }
});

$('#resetAdress').click(function() {
    var_id = "";
});  

$('#historyPersonal').click(function() {

    var id_legajo = $('#id_legajo').val();

    var filas="";

	$.ajax({
        method: "POST",
        url: "/getEmployeeStatus",
        data: {id : id_legajo}
    }).done(function(response){
        if(response.status = "0"){
            statuses = response.statuses; 
            filas = "";
            $.each(response.statuses, function(id,key) {
				estado = key.status.name;
				desde = (key.from != "0000-00-00") ? key.from.split("-").reverse().join("-") : "";
				hasta = (key.to != "0000-00-00") ? key.to.split("-").reverse().join("-") : "";
				fila = "<tr><td>"+estado+"</td><td>"+desde+"</td><td>"+hasta+"</td><td>"+key.user.username+"</td></tr>";
				filas = filas.concat(fila);
            });
            bootbox.dialog({
              title: "Historial",
              message: '<div>'+ 
                          '<table class="table table-hover">'+
                            '<thead>'+
                              '<tr>'+
                                '<th>Estado</th>'+
                                '<th>Desde</th>'+
                                '<th>Hasta</th>'+
                                '<th>Registrado por</th>'+
                              '</tr>'+
                            '</thead>'+
                            '<tbody>'+
                                filas +
                            '</tbody>'+
                          '</table>'+
                        '</div>'

            }); 
        }
        else{
            bootbox.alert("No se han encontrado Datos", function(){});
        } 
    });
});   


$('#historyMedical').click(function() {

    var id_legajo = $('#id_legajo').val();

    var filas="";

   $.ajax({
        method: "POST",
        url: "/getEmployeeMedical",
        data: {id : id_legajo}
    }).done(function(response){
        if(response.status = "0"){
            medical = response.medical; 
            filas = "";
             $.each(response.medical, function(id,key) {
                            fecha = "";
                            apto = key.medical_apto;
                            social = key.medica_social.name;
                            art = key.art.name;
                            prepaga = key.prepaid.name;
                            incapacidad = "Disability Name";
                            fila = "<tr><td>"+fecha+"</td><td>"+apto+"</td><td>"+social+"</td><td>"+art+"</td><td>"+prepaga+"</td><td>"+incapacidad+"</td></tr>";
                            filas = filas.concat(fila);
            });
            bootbox.dialog({
              title: "Historial Médico",
              message: '<div>'+ 
                          '<table class="table table-hover">'+
                            '<thead>'+
                              '<tr>'+
                                '<th>Fecha</th>'+
                                '<th>Apto Médico</th>'+
                                '<th>Obra Social</th>'+
                                '<th>Art</th>'+
                                '<th>Prepaga</th>'+
                                '<th>Discapacidad</th>'+
                               // '<th>Certificado</th>'+
                                //'<th>Entidad</th>'+
                              '</tr>'+
                            '</thead>'+
                            '<tbody>'+
                                filas +
                            '</tbody>'+
                          '</table>'+
                        '</div>'
            }); 
        }
        else{
            bootbox.alert("No se han encontrado Datos", function(){});
        } 
    });
}); 

$("#historyPublicServices").click(function(){
	var id_legajo = $('#id_legajo').val();

    var filas="";

   $.ajax({
        method: "POST",
        url: "/getPublicServicesHistory",
        data: {id : id_legajo}
    }).done(function(response){
        if(response.status = "0"){
            publicServices = response.publicServices; 
            filas = "";
            $.each(response.publicServices, function(id,key) {
				organism = key.organism;
				motivation = key.motivation;
				destination = key.destination;
				//date_from = key.date_from;
				//date_to = key.date_to;
				administrative_act_name = key.administrative_act.name;
				act_number = key.act_number;
				act_date = key.act_date;
				
				fila = "<tr><td>"+organism+"</td><td>"+motivation+"</td><td>"+destination+"</td><td>"+administrative_act_name+"</td><td>"+act_number+"</td><td>"+act_date+"</td></tr>";				
				filas = filas.concat(fila);
            });
            bootbox.dialog({
              title: "Historial Servicios Públicos",
              message: '<div>'+ 
                          '<table class="table table-hover">'+
                            '<thead>'+
                              '<tr>'+
                                '<th>Organismo</th>'+
                                '<th>Motivacion</th>'+
                                '<th>Destino</th>'+
                                //'<th>Desde</th>'+
                                //'<th>Hasta</th>'+
                               '<th>Acto Administrativo</th>'+
                                '<th>Numero de Acto</th>'+
                                '<th>Fecha de Acto</th>'+
                              '</tr>'+
                            '</thead>'+
                            '<tbody>'+
                                filas +
                            '</tbody>'+
                          '</table>'+
                        '</div>'
            });
        }
        else{
            bootbox.alert("No se han encontrado Datos", function(){});
        } 
    });
})

$("#historyPrivateServices").click(function(){
    var id_legajo = $('#id_legajo').val();

    var filas="";

   $.ajax({
        method: "POST",
        url: "/getPrivateServicesHistory",
        data: {id : id_legajo}
    }).done(function(response){
        if(response.status = "0"){
            privateServices = response.privateServices; 
            filas = "";
            $.each(response.privateServices, function(id,key) {
                institution_name = key.institution_name;
                legal_adress = key.legal_adress;
                charge_function = key.charge_function;
                remunerated = key.remunerated;
                date_from = key.date_from;
                date_to = key.date_to;

                fila = "<tr><td>"+institution_name+"</td><td>"+legal_adress+"</td><td>"+charge_function+"</td><td>"+respuesta[remunerated]+"</td><td>"+date_from+"</td><td>"+date_from+"</td></tr>";                
                filas = filas.concat(fila);
            });
            bootbox.dialog({
              title: "Historial Servicios Privados",
              message: '<div>'+ 
                          '<table class="table table-hover">'+
                            '<thead>'+
                              '<tr>'+
                                '<th>Institución</th>'+
                                '<th>Dirección Legal</th>'+
                                '<th>Cargo/Función</th>'+
                                '<th>Remunerado</th>'+
                                '<th>Desde</th>'+
                                '<th>Hasta</th>'+
                              '</tr>'+
                            '</thead>'+
                            '<tbody>'+
                                filas +
                            '</tbody>'+
                          '</table>'+
                        '</div>'
            });
        }
        else{
            bootbox.alert("No se han encontrado Datos", function(){});
        } 
    });
})

$("#historyFelicitaciones").click(function(){
	var id_legajo = $('#id_legajo').val();

    var filas="";

   $.ajax({
        method: "POST",
        url: "/getCongratulationsHistory",
        data: {id : id_legajo}
    }).done(function(response){
        if(response.status = "0"){
            congratulations = response.congratulations; 
            filas = "";
            $.each(response.congratulations, function(id,key) {
				jurisdiction = key.jurisdiction;
				organization = key.organization;
				act_number = key.act_number;
				administrative_act_name = key.administrative_act.name;
				mention_date = key.mention_date;
				
				fila = "<tr><td>"+jurisdiction+"</td><td>"+organization+"</td><td>"+act_number+"</td><td>"+administrative_act_name+"</td><td>"+mention_date+"</td></tr>";				
				filas = filas.concat(fila);
            });
            bootbox.dialog({
              title: "Historial Felicitaciones y Menciones",
              message: '<div>'+ 
                          '<table class="table table-hover">'+
                            '<thead>'+
                              '<tr>'+
                                '<th>Jurisdicción</th>'+
                                '<th>Organismo</th>'+
                                '<th>Numero de Acto</th>'+
                                //'<th>Desde</th>'+
                                //'<th>Hasta</th>'+
                               '<th>Acto Administrativo</th>'+
                                '<th>Fecha</th>'+
                              '</tr>'+
                            '</thead>'+
                            '<tbody>'+
                                filas +
                            '</tbody>'+
                          '</table>'+
                        '</div>'
            });
        }
        else{
            bootbox.alert("No se han encontrado Datos", function(){});
        } 
    });
})

$("#historySanctions").click(function(){
	var id_legajo = $('#id_legajo').val();

    var filas="";

    $.ajax({
        method: "POST",
        url: "/getSanctionsHistory",
        data: {id : id_legajo}
    }).done(function(response){
        if(response.status = "0"){
            sanctions = response.sanctions; 
            filas = "";
            $.each(response.sanctions, function(id,key) {
				institution = key.institution;
                administrative_act_name = key.administrative_act.name;
                act_number = key.act_number;
				disciplinary_action = key.disciplinary_action;
				cause = key.cause;
				sanction_date = key.sanction_date;
				
				fila = "<tr><td>"+institution+"</td><td>"+administrative_act_name+"</td><td>"+act_number+"</td><td>"+disciplinary_action+"</td><td>"+cause+"</td><td>"+sanction_date+"</td></tr>";				
				filas = filas.concat(fila);
            });
            bootbox.dialog({
              title: "Historial Sanciones",
              message: '<div>'+ 
                          '<table class="table table-hover">'+
                            '<thead>'+
                              '<tr>'+
                                '<th>Institución</th>'+
                                '<th>Acto Administrativo</th>'+
                                '<th>Numero de Acto</th>'+
                               '<th>Medida Disciplinaria</th>'+
                                '<th>Motivo</th>'+
                                '<th>Fecha</th>'+
                              '</tr>'+
                            '</thead>'+
                            '<tbody>'+
                                filas +
                            '</tbody>'+
                          '</table>'+
                        '</div>'
            });
        }
        else{
            bootbox.alert("No se han encontrado Datos", function(){});
        } 
    });
})

$("#historyEmbargo").click(function(){
    var id_legajo = $('#id_legajo').val();

    var filas="";

    $.ajax({
        method: "POST",
        url: "/getSeizuresHistory",
        data: {id : id_legajo}
    }).done(function(response){
        if(response.status = "0"){
            seizure = response.seizure; 
            filas = "";
            $.each(response.seizure, function(id,key) {
                expedient_number = key.expedient_number;
                date_From = key.date_From;
                charter = key.charter;
                tribunal = key.tribunal;
                secretary = key.secretary;
                cars = key.cars;
                ammount = key.ammount;
                
                fila = "<tr><td>"+expedient_number+"</td><td>"+date_From+"</td><td>"+charter+"</td><td>"+tribunal+"</td><td>"+secretary+"</td><td>"+cars+"</td><td>"+ammount+"</td></tr>";              
                filas = filas.concat(fila);
            });
            bootbox.dialog({
              title: "Historial Embargos",
              message: '<div>'+ 
                          '<table class="table table-hover">'+
                            '<thead>'+
                              '<tr>'+
                                '<th>Expediente</th>'+
                                '<th>Hasta</th>'+
                                '<th>Fuero</th>'+
                                '<th>Juzgado</th>'+
                                '<th>Secretaria</th>'+
                                '<th>Autos</th>'+
                                '<th>Monto</th>'+
                              '</tr>'+
                            '</thead>'+
                            '<tbody>'+
                                filas +
                            '</tbody>'+
                          '</table>'+
                        '</div>'
            });
        }
        else{
            bootbox.alert("No se han encontrado Datos", function(){});
        } 
    });
})

$("#historyPerformanceEvaluation").click(function(){
	var id_legajo = $('#id_legajo').val();

    var filas="";

    $.ajax({
        method: "POST",
        url: "/getPerformanceEvaluationHistory",
        data: {id : id_legajo}
    }).done(function(response){
        if(response.status = "0"){
            evaluations = response.evaluations; 
            filas = "";
            $.each(response.evaluations, function(id,key) {
				year_evaluations = key.year_evaluation;
				qualification = key.qualification;
				level = key.level;
				//date_from = key.date_from;
				//date_to = key.date_to;
				grade_evaluation = key.grade_evaluation;
				bonification = key.bonification;
				notification = key.notification;
				
				fila = "<tr><td>"+year_evaluations+"</td><td>"+qualification+"</td><td>"+level+"</td><td>"+grade_evaluation+"</td><td>"+respuesta[bonification]+"</td><td>"+notification+"</td></tr>";				
				filas = filas.concat(fila);
            });
            bootbox.dialog({
              title: "Historial Evaluación de Desempeño",
              message: '<div>'+ 
                          '<table class="table table-hover">'+
                            '<thead>'+
                              '<tr>'+
                                '<th>Año</th>'+
                                '<th>Calificación</th>'+
                                '<th>Nivel</th>'+
                                '<th>Grado</th>'+
                                '<th>Bonificación</th>'+
                                '<th>Notificación</th></tr>'+
                            '</thead>'+
                            '<tbody>'+
                                filas +
                            '</tbody>'+
                          '</table>'+
                        '</div>'
            });
        }
        else{
            bootbox.alert("No se han encontrado Datos", function(){});
        } 
    });
})

$("#historyCapacitation").click(function(){
	var id_legajo = $('#id_legajo').val();

    var filas="";

    $.ajax({
        method: "POST",
        url: "/getCapacitationHistory",
        data: {id : id_legajo}
    }).done(function(response){
        if(response.status = "0"){
            capacitations = response.capacitations; 
            filas = "";
            $.each(response.capacitations, function(id,key) {
				year_credit = key.year_credit;
				credit_quantity = key.credit_quantity;
				credit_used = key.credit_used;
				//date_from = key.date_from;
				//date_to = key.date_to;
				credit_total = key.credit_total;
				validity_date = key.validity_date;
				
				fila = "<tr><td>"+year_credit+"</td><td>"+credit_quantity+"</td><td>"+respuesta[credit_used]+"</td><td>"+credit_total+"</td><td>"+validity_date+"</td></tr>";				
				filas = filas.concat(fila);
            });
            bootbox.dialog({
              title: "Historial Créditos de Capacitación",
              message: '<div>'+ 
                          '<table class="table table-hover">'+
                            '<thead>'+
                              '<tr>'+
                                '<th>Año</th>'+
                                '<th>Cantidad</th>'+
                                '<th>Utilizados</th>'+
                               '<th>Total</th>'+
                                '<th>Vigencia</th>'+
                              '</tr>'+
                            '</thead>'+
                            '<tbody>'+
                                filas +
                            '</tbody>'+
                          '</table>'+
                        '</div>'
            });
        }
        else{
            bootbox.alert("No se han encontrado Datos", function(){});
        } 
    });
})

$("#historyAdministrativeCareer").click(function(){
	var id_legajo = $('#id_legajo').val();

    var filas="";

    $.ajax({
        method: "POST",
        url: "/getAdministrativeCareerHistory",
        data: {id : id_legajo}
    }).done(function(response){
        if(response.status = "0"){
            careers = response.careers; 
            filas = "";
            $.each(response.careers, function(id,key) {
				scale = key.scale.name;
				grouping = key.grouping.name;
				administrative_act = key.administrative_act.name;
				act_number = key.act_number;
				stretch = key.stretch.name;
				act_date = key.act_date;
				
				fila = "<tr><td>"+scale+"</td><td>"+grouping+"</td><td>"+administrative_act+"</td><td>"+act_number+"</td><td>"+stretch+"</td><td>"+act_date+"</td></tr>";				
				filas = filas.concat(fila);
            });
            bootbox.dialog({
              title: "Historial de Carrera",
              message: '<div>'+ 
                          '<table class="table table-hover">'+
                            '<thead>'+
                              '<tr>'+
                                '<th>Escalafón</th>'+
                                '<th>Agrupamiento</th>'+
                                '<th>Acto Administrativo</th>'+
                                '<th>Numero de Acto</th>'+
                                '<th>Tramo</th>'+
                               '<th>Fecha de Acto</th>'+
                              '</tr>'+
                            '</thead>'+
                            '<tbody>'+
                                filas +
                            '</tbody>'+
                          '</table>'+
                        '</div>'
            });
        }
        else{
            bootbox.alert("No se han encontrado Datos", function(){});
        } 
    });
})

$("#historyExtra").click(function(){
	var id_legajo = $('#id_legajo').val();

    var filas="";

    $.ajax({
        method: "POST",
        url: "/getExtraHistory",
        data: {id : id_legajo}
    }).done(function(response){
        if(response.status = "0"){
            extras = response.extras; 
            filas = "";
            $.each(response.extras, function(id,key) {
				scale = key.scale.name;
				grouping = key.grouping.name;
				administrative_act_name = key.administrative_act.name;
				act_number = key.act_number;
				category = key.category.name;
				act_date = key.act_date;
				
				fila = "<tr><td>"+scale+"</td><td>"+grouping+"</td><td>"+administrative_act_name+"</td><td>"+act_number+"</td><td>"+category+"</td><td>"+act_date+"</td></tr>";				
				filas = filas.concat(fila);
            });
            bootbox.dialog({
              title: "Historial Orqueta, Coros, Ballet",
              message: '<div>'+ 
                          '<table class="table table-hover">'+
                            '<thead>'+
                              '<tr>'+
                                '<th>Escalafón</th>'+
                                '<th>Agrupamiento</th>'+
                                '<th>Acto Administrativo</th>'+
                                '<th>Numero de Acto</th>'+
                                '<th>Categoría</th>'+
                               '<th>Fecha de Acto</th>'+
                              '</tr>'+
                            '</thead>'+
                            '<tbody>'+
                                filas +
                            '</tbody>'+
                          '</table>'+
                        '</div>'
            });
        }
        else{
            bootbox.alert("No se han encontrado Datos", function(){});
        } 
    });
})

$('#saveMail').click(function() {

    var isValid = $("form#formEmail").valid();

    if (isValid) {
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["email"] = $("#email").val();
				params["id_employee"] = $('#id_legajo').val();
				params["contact_type"] = $('#tipo_email').val();
				params["id_employee_contact_type"] = var_id_employee_contact_type;
				json_params = JSON.stringify(params);


				if  ($("#email").val() != ""){

					$.ajax({
						method: "POST",
						url: "/saveMail",
						data: json_params
					}).done(function(msg){
						var status = msg.status;
						if(status == '0'){
							loadContacts($('#id_legajo').val());
							$("#email").val("");
							var_id_employee_contact_type = "";
						}
						else{
							bootbox.alert("Se han detectado errores en el registro del correo. Por favor intente nuevamente", function(){});
						}
					});
				}
			}
        })
    }


});

$('#saveAdress').click(function() {
    var isValid = $("form#formAddress").valid();

    if (isValid) {
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["tipo"]                  = $("#tipo_direccion").val();
				params["id_employee"]           = $('#id_legajo').val();
				params["calle"]                 = $('#calle').val();
				params["numero"]                = $('#numero').val();
				params["piso"]                  = $('#piso').val();
				params["departamento"]          = $('#departamento').val();
				params["codigo-postal"]         = $('#codigo-postal').val();
				params["barrio"]                = $('#barrio').val();
				params["telefono-direccion"]    = $('#telefono-direccion').val();
				params["province_id"]           = $('#province').val();
				params["locality_id"]           = $('#locality').val();
				params["split_id"]              = $('#split').val();
				params["id"]                    = var_id;
				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveAdress",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
					if(status == '0'){
						loadAdresses($('#id_legajo').val());
						$("form#formAddress").find("input[type=text]:not([readonly]), textarea, select").each(function(){
							$(this).val('');            
						});
						var_id = "";
					}
					else{
						bootbox.alert("Se han detectado errores en el registro de la dirección. Por favor intente nuevamente", function(){});
					}
				});
			}
        })
    }
});

$('#saveFamily').click(function() {
    var isValid = $("form#formGrupoFamiliar").valid();

    if (isValid) {
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["parentesco"] = $("#parentesco").val();
				params["nombre"] = $('#family_name').val();
				params["apellido"] = $('#family_lastname').val();
				params["documento"] = $('#family_dni').val();
				params["genero"] = $('#family_sex').val();
				params["nacimiento"] = $('#family_birthdate').val();
				params["convive"] = $('#family_alive').val();
				params["asignacion"] = $('#family_garden').val();
				params["employee_id"] = $('#id_legajo').val();
				params["disability"] = $('#family_disability').val();
				params["disability_type"] = $('#family_disability_type').val();
				params["var_id"] = var_id;

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveFamily",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
					if(status == '0'){
						loadFamily($('#id_legajo').val());
						var_id = "";
						$("form#formGrupoFamiliar").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});

					}
					else{
						bootbox.alert("Se han detectado errores en el proceso de registro. Por favor intente nuevamente", function(){});
					}
				});
			}
        })
    }
});

$('#saveWorkFile').click(function() {
    var isValid = $("form#formLaboral").valid();

    if (isValid) {
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["job_status"] = $("#job_status").val();
				params["ingreso"] = $('#date_in').val();
				params["have_additionals"] = $('#have_additionals').val();
				params["additional"] = $('#additional').val();
				params["supplement"] = $('#supplement').val();
				params["area"] = $('#area').val();
				params["building"] = $('#building').val();
				params["office"] = $('#office').val();
				params["employee_id"] = $('#id_legajo').val();
				var dias = "";
				$("input[name='dias[]']:checked").each(function ()
				{
					dias+=$(this).val()+" ";
				});
				params["dias"] = dias;
				params["hour_from"] = $('#hour_from').val();
				params["hour_to"] = $('#hour_to').val();
				params["date_from"] = $('#date_from').val();
				params["date_to"] = $('#date_to').val();

				var url = "";
				if ($('#id_work_file').val() == ""){
					url ="/saveWorkFile";
				}
				else{
					url ="/updateWorkFile";
					params["id_work_file"] = $('#id_work_file').val();
				}

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: url,
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if(status == '0'){
						if(msg.work_file){
							$('#id_work_file').val(msg.work_file);
						}

						loadSchedules($('#id_work_file').val());
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formLaboral").find("input[type=text]:not([readonly]), input[type=checkbox], textarea, select").each(function(){
							$(this).val('');            
						});
						var_id = "";
					}
					else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        });
    }
});

$("button#save-medical-info").click(function(e){ 
	
	// CORRECCION VISUAL DE ERRORES DE BOOSTRAP
	$("a.file-input-wrapper").removeClass("error");
	if (!$("#certificado-discapacidad").valid()){
		$("a.file-input-wrapper").addClass("error");			
	}
	

    //alert($("input[name='medical_file_exists']").val() == "");


    if ($("input[name='medical_file_exists']").val() == ""){
        isValid = false;
        $("input#legajo-medico").parents("a").addClass("error");
    }else{
        isValid = true;
        $("input#legajo-medico").parents("a").removeClass("error");

    }

    var isValid = $("form#medical-info").valid();	

	if (isValid){
		bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["numero-carnet"] = $("#numero-carnet").val();
				params["tipo-sangre"] = $('#select#tipo-sangre option:selected').val();
				params["legajo-medico"] = $('#legajo-medico').val();
				params["apto-medico"] = $('#apto-medico').val();
				params["obra-social"] = $('#obra-social').val();
				params["art"] = $('#art').val();
				params["prepaga"] = $('#prepaga').val();
				params["tipo-discapacidad"] = $('select#tipo-discapacidad option:selected').val();
				params["discapacidad"] = $('select#discapacidad option:selected').val();
				params["certificado-discapacidad"] = $('#certificado-discapacidad').val();
				params["fecha-cert-discapacidad"] = $('#fecha-cert-discapacidad').val();
				params["vigencia-certificado"] = $('#vigencia-certificado').val();
				params["vigencia-certificado-hasta"] = $('#vigencia-certificado-hasta').val();
				params["entidad-certificado"] = $('#entidad-certificado').val();
				params["empleado_id"] = $("#id_legajo").val();;
				json_params = JSON.stringify(params);

				$('#entidad-certificado').val()

				json_params = JSON.stringify(params);
				var options = { 
					url: '/saveMedicalInfo/' + $('#id_legajo').val(),
					dataType:  'json',
					type: 'post',
					success: showResponse
				};  

				var respuesta = $("form#medical-info").ajaxSubmit(options, function(){})
			}
        });
        
		
	}				
    return false;
});

function showResponse(response, statusText, xhr, $form)  { 
    if (response.status == 0){
        //$("#numero-carnet").attr("disabled", "disabled");
 
        $("#legajo-medico").parents('a').attr("disabled", "disabled");
        $("input[name='medical_file_exists']").val(response.obj);

        bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
		loadDiscapacidades($('#id_legajo').val());
		$("form#medical-info").find("input[type=text]:not([readonly]), input[type=checkbox], textarea").each(function(){
			$(this).val('');            
		});
        $("select").each(function(){
            $(this).val(0);            
        });
    }else{
        bootbox.alert("Se han detectado errores en el proceso de registro. Por favor intente nuevamente", function(){})
    }
} 

$('#saveReview').click(function() {
    var isValid = $("form#formRevista").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["id_work_file"] = $("#id_work_file").val();
				params["scale"] = $('#scale').val();
				params["category"] = $('#review_category').val();
				params["grouping"] = $('#agrupamiento').val();
				params["level"] = $('#level').val();
				params["grade"] = $('#grade').val();
				params["stretch"] = $('#stretch').val();
				params["executive_function"] = $('#executive_function').val();
				params["in_afip"] = $('#in_afip').val();
				params["out_afip"] = $('#out_afip').val();
				params["date_afip"] = $('#date_afip').val();
				params["var_id"] = var_id;

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveReview",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if(status == '0'){

						if (result){
							bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
							 $("form#formRevista").find("input[type=text]:not([readonly]), textarea, select").each(function(){
								$(this).val('');            
							});
							loadReview($('#id_work_file').val());
							var_id = "";
						}                     
					}
					else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveRole').click(function() {
    var isValid = $("form#formRoles").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["id_review"] = $("#id_review").val();
				params["id_role"] = $('#role').val();
				params["description"] = $('#description').val();
				params["start_date"] = $('#role_from').val();
				params["end_date"] = $('#role_to').val();
				params["description"] = $('#role_description').val();
				params["var_id"] = var_id;

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveRole",
					data: json_params
				}).done(function(msg){

					var status = msg.status;
                    var mensaje= msg.response;
					if(status == '0'){
						loadRoles($('#id_review').val());
						bootbox.alert("Se proceso el registro de manera exitosa", function(){})
						$("form#formRoles").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						var_id = "";
					}
					else{

						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveEducation').click(function() {
    var isValid = $("form#formEducacion").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["id_work_file"] = $("#id_work_file").val();
				params["title"] = $('#titulo').val();
				params["institution_id"] = $('#institution').val();
				params["education_level_id"] = $('#education_level').val();
				params["education_status_id"] = $('#education_status').val();
				params["education_country"] = $('#education_country').val();
				params["education_start"] = $('#education_start').val();
				params["var_id"] = var_id;
				
				if(!$('#education_actually').is(":checked")){
					params["actually"] = "0";
					params["education_end"] = $('#education_end').val();
				}   
				else{
					params["actually"] = "1";
				}

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveEducation",
					data: json_params   
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if(status == '0'){
						bootbox.alert("Se ha realizado el registro de manera exitosa", function(){})
						loadEducation($('#id_work_file').val());
						$("form#formEducacion").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						var_id= "";
					}
					else{
                        bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveCourse').click(function() {
    var isValid = $("form#formCursos").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["id_work_file"] = $("#id_work_file").val();
				params["name"] = $('#course_institution').val();
				params["certificate"] = $('#course_certificate').val();
				params["var_id"] = var_id;
				if(!$('#course_actually').is(":checked")){
					params["actually"] = "0";
					params["end_date"] = $('#course_finalization').val();
				}   
				else{
					params["actually"] = "1";
				}
				
				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveCourse",
					data: json_params   
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if(status == '0'){
						bootbox.alert("Se ha realizado el registro de manera exitosa", function(){})
						loadCourses($('#id_work_file').val());
						$("form#formCursos").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						var_id= "";
					}
					else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveCongress').click(function() {
    var isValid = $("form#formCongresos").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["id_work_file"] = $("#id_work_file").val();
				params["name"] = $('#congress_title').val();
				params["especiality"] = $('#congress_specialization').val();
				params["certificate"] = $('#congress_certificado').val();
				params["actually"] = $('#congress_actually').val();
				params["var_id"] = var_id;
				if(!$('#congress_actually').is(":checked")){
					params["actually"] = "0";
					params["end_date"] = $('#congress_finalization').val();
				}
				else{
					params["actually"] = "1";
				}
				
				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveCongress",
					data: json_params   
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if(status == '0'){
						bootbox.alert("Se ha realizado el registro de manera exitosa", function(){})
						loadCongresses($('#id_work_file').val());
						$("form#formCongresos").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						var_id= "";
					}
					else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveLanguage').click(function() {
    var isValid = $("form#formIdiomas").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["id_work_file"] = $("#id_work_file").val();
				params["id_language"] = $("#language").val();
				params["write_level"] = $('#escrito').val();
				params["speak_level"] = $('#oral').val();
				
				params["var_id"] = var_id;
				params["var_review_id"] = var_review_id;

				json_params = JSON.stringify(params);

				if (result){
					$.ajax({
						method: "POST",
						url: "/saveLanguage",
						data: json_params

					}).done(function(msg){
						var status = msg.status;
                        var mensaje= msg.response;
						if(status == '0'){
							bootbox.alert("Se ha realizado el registro de manera exitosa", function(){})
							loadLanguages($('#id_work_file').val());
							$("form#formIdiomas").find("input[type=text]:not([readonly]), textarea, select").each(function(){
								$(this).val('');            
							});
							var_id= "";
						}
						else{
							bootbox.alert(mensaje, function(){})
						}
					});    
				}
            }
        })
    }
});


$('#saveInformatica').click(function() {
    var isValid = $("form#formInformatica").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["id_work_file"] = $("#id_work_file").val();
				params["area"] = $("#it_area").val();
				params["level"] = $("#it_level").val();
				params["level"] = $("#it_level").val();
				
				params["var_id"] = var_id;
				params["var_review_id"] = var_review_id;
				
				json_params = JSON.stringify(params);
				
				$.ajax({
					method: "POST",
					url: "/saveIT",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if(status == '0'){
						 bootbox.alert("Se ha realizado el registro de manera exitosa", function(){})
						loadItCourses($('#id_work_file').val());
						$("form#formInformatica").find("input[type=text]:not([readonly]), textarea, select").each(function(){
							$(this).val('');            
						});
						var_id= "";
					}
					else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});


$('#saveConocimientosAdicionales').click(function() {
    var isValid = $("form#formConocimientosAdicionales").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["tiene-publicacion"] = $("#tiene-publicacion").val();
				params["nombre-publicacion"] = $("#nombre-publicacion").val();
				params["fecha-publicacion"] = $("#fecha-publicacion").val();
				params["docencia"] = $("#docencia").val();
				params["n-educativo"] = $("#n-educativo").val();
				params["especialidad-materia"] = $("#especialidad-materia").val();		
				params["institucion"] = $("#institucion").val();
				params["var_id"] = var_id;
				params["id_work_file"] = $("#id_work_file").val();

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveAdditionalKnowledge",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if(status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						loadAdditionalKnowledgeHistory($('#id_work_file').val());
						$("form#formConocimientosAdicionales").find("input[type=text]:not([readonly]), textarea, select").each(function(){
							$(this).val('');            
						});
						var_id= "";
					}
					else{
						//alert('Error:' + msg.response);
					}
				});
			}
        })
    }
});

$('#saveServiciosPublicos').click(function() {
    var isValid = $("form#formServPublicos").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["organismo"] = $("#organismo-publico").val();
				params["situacion"] = $("#situacion-revista").val();
				params["motivo"] = $("#motivo").val();
				params["destino"] = $("#destino").val();
				params["desde"] = $("#desde").val();
				params["hasta"] = $("#hasta").val();
				params["acto"] = $("#acto-administrativo").val();
				params["numero"] = $("#numero-acto").val();
				params["fecha"] = $("#fecha-acto").val();
				params["idlegajo"] = $("#id_legajo").val();
				params["var_id"] = var_id;

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/savePublicService",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if(status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formServPublicos").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						loadPublicServices($("#id_legajo").val());
						var_id = "";
					}
					else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveServiciosPrivados').click(function() {
    var isValid = $("form#formServPrivados").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["institucion"] = $("#institucionPriv").val();
				params["domicilio"] = $("#domicilio-legal").val();
				params["cargo"] = $("#cargo").val();
				params["remunerado"] = $("#remunerado").val();
				params["desde"] = $("#desde2").val();
				params["hasta"] = $("#hasta2").val();
				params["causa"] = $("#causa-egreso").val();
				params["idlegajo"] = $("#id_legajo").val();
				params["var_id"] = var_id;

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/savePrivateService",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if (status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formServPrivados").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						loadPrivateServices($('#id_legajo').val());
						var_id = "";
					}
					else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveFelicitaciones').click(function() {
    var isValid = $("form#formMenciones").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["jurisdiccion"] = $("#jurisdiccion").val();
				params["organismo"] = $("#organismo2").val();
				params["concepto"] = $("#concepto").val();
				params["motivo"] = $("#motivo1").val();
				params["acto"] = $("#acto-administrativo2").val();
				params["numero"] = $("#numero-acto2").val();
				params["fecha"] = $("#fecha2").val();
				params["idlegajo"] = $("#id_legajo").val();
				params["var_id"] = var_id;

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveCongratulation",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if (status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formMenciones").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						loadCongrats($('#id_legajo').val());
						var_id = "";
					}
					else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveSanciones').click(function() {
    var isValid = $("form#formSanciones").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["organismo"] = $("#organismo3").val();
				params["acto"] = $("#acto-administrativo1").val();
				params["numero"] = $("#numero-acto3").val();
				params["fecha"] = $("#fecha3").val();
				params["medida"] = $("#medida-disciplinaria").val();
				params["motivo"] = $("#motivo3").val();
				params["desde"] = $("#desde3").val();
				params["hasta"] = $("#hasta3").val();
				params["idlegajo"] = $("#id_legajo").val();
				params["var_id"] = var_id;

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveSanction",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if (status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formSanciones").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						loadSanctions($('#id_legajo').val());
						var_id = "";
					}
					else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveEmbargo').click(function() {
    var isValid = $("form#formEmbargos").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["expediente"] = $("#numero-expediente").val();
				params["hasta"] = $("#hasta4").val();
				params["fuero"] = $("#fuero").val();
				params["juzgado"] = $("#juzgado").val();
				params["secretaria"] = $("#secretaria").val();
				params["autos"] = $("#autos").val();
				params["monto"] = $("#monto").val();
				params["trabajado"] = $("#trabajado").val();
				params["levantado"] = $("#levantado").val();
				params["idlegajo"] = $("#id_legajo").val();
				params["var_id"] = var_id;

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveSeizure",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if (status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formEmbargos").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						loadEmbargos($('#id_legajo').val());
						var_id = "";
					}else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveEvaluacion').click(function() {
    var isValid = $("form#formEvaluacion").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["ano"] = $("#ano").val();
				params["calificacion"] = $("#calificacion").val();
				params["utilizada"] = $("#utilizada").val();
				params["nivel"] = $("#nivelD").val();
				params["grado"] = $("#grado").val();
				params["bonificacion"] = $("#bonificacion").val();
				params["notificacion"] = $("#notificacion").val();
				params["observaciones"] = $("#observaciones").val();
				params["idlegajo"] = $("#id_legajo").val();
				params["var_id"] = var_id;

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/savePerformanceEvaluation",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if (status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formEvaluacion").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						loadEvaluaciones($('#id_legajo').val());
						var_id = "";
					}else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveCapacitacion').click(function() {
    var isValid = $("form#formCapacitacion").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["ano2"] = $("#ano2").val();
				params["cantidad"] = $("#cantidad").val();
				params["utilizados2"] = $("#utilizados2").val();
				params["total"] = $("#total").val();
				params["vigencia"] = $("#vigencia").val();
				params["observaciones2"] = $("#observaciones2").val();
				params["idlegajo"] = $("#id_legajo").val();
				params["var_id"] = var_id;

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveCapacitationCredit",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if (status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formCapacitacion").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						loadCreditos($('#id_legajo').val());
						var_id = "";
					}else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveHistoriaCarrera').click(function() {
    var isValid = $("form#formHistoriaCarrera").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["escalafon"] = $("#escalafon").val();
				params["agrupamiento"] = $("#agrupamiento3").val();
				params["nivel"] = $("#nivel4").val();
				params["grado"] = $("#grado4").val();
				params["tramo"] = $("#tramo4").val();
				params["acto"] = $("#acto-administrativo4").val();
				params["numero"] = $("#numero-acto4").val();
				params["fecha"] = $("#fecha-acto4").val();
				params["desde"] = $("#desde4").val();
				params["motivo"] = $("#motivo4").val();			
				params["idlegajo"] = $("#id_legajo").val();
				params["var_id"] = var_id;

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveAdministrativeHistory",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if (status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formHistoriaCarrera").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						loadHistorial($('#id_legajo').val());
						var_id = "";
					}else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveExtra').click(function() {
    var isValid = $("form#formExtracurricular").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["escalafon"] = $("#escalafon2").val();
				params["agrupamiento"] = $("#agrupamiento2").val();
				params["nivel"] = $("#categoria2").val();
				params["grado"] = $("#grado4").val();
				params["acto"] = $("#acto-administrativo3").val();
				params["numero"] = $("#numero-acto5").val();
				params["fecha"] = $("#fecha-acto2").val();
				params["desde"] = $("#desde5").val();
				params["motivo"] = $("#motivo5").val();
				params["idlegajo"] = $("#id_legajo").val();
				params["var_id"] = var_id;

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveOchestra",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if (status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formExtracurricular").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						loadOrquesta($('#id_legajo').val());
						var_id = "";
					}else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveLicExamen').click(function() {
    var isValid = $("form#formLicenciaExamen").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["apellido-le"] = $("#apellido-le").val();
				params["nombre-le"] = $("#nombre-le").val();
				params["escalafon-le"] = $("#escalafon-le").val();
				params["fecha-examen-le"] = $("#fecha-examen-le").val();
				params["fecha-examen-desde-le"] = $("#fecha-examen-desde-le").val();
				params["fecha-examen-hasta-le"] = $("#fecha-examen-hasta-le").val();
				params["total-dias-le"] = $("#total-dias-le").val();
				params["materia-le"] = $("#materia-le").val();
				params["catedra-le"] = $("#catedra-le").val();
				params["nombre-establecimiento-le"] = $("#nombre-establecimiento-le").val();
				params["idlegajo"] = $("#id_legajo").val();
				params["work_file_id"] = $("#id_work_file").val();
				
				params["var_id"] = var_id;
			
				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveLicenciaExamen",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if (status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formLicenciaExamen").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						loadLicenciaExamen($('#id_legajo').val());
						var_id = "";
					}else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveLicAviso').click(function() {
    var isValid = $("form#formAusencia").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["apellido-la"] = $("#apellido-la").val();
				params["nombre-la"] = $("#nombre-la").val();
				params["escalafon-la"] = $("#escalafon-la").val();
				params["fecha-ausencia-la"] = $("#fecha-ausencia-la").val();
				params["idlegajo"] = $("#id_legajo").val();
				params["work_file_id"] = $("#id_work_file").val();
				
				params["var_id"] = var_id;
			
				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveLicenciaAusencia",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if (status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formAusencia").find("input[type=text]:not([readonly]), textarea, select").each(function(){
							$(this).val('');            
						});
						loadLicenciaAviso($('#id_legajo').val());
						var_id = "";
					}else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveLicMedica').click(function() {
    var isValid = $("form#formLicenciaMedica").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["apellido-lm"] = $("#apellido-lm").val();
				params["nombre-lm"] = $("#nombre-lm").val();
				params["escalafon-lm"] = $("#escalafon-lm").val();
				params["fecha-licencia-lm"] = $("#fecha-licencia-lm").val();
				params["materia-lm"] = $("#materia-lm").val();
				params["domicilio-lm"] = $("#domicilio-lm").val();
				params["telefono-lm"] = $("#telefono-lm").val();
				params["nombre-centro-lm"] = $("#nombre-centro-lm").val();
				params["domicilio-centro-lm"] = $("#domicilio-centro-lm").val();
				params["tel-centro-lm"] = $("#tel-centro-lm").val();
				params["idlegajo"] = $("#id_legajo").val();
				params["work_file_id"] = $("#id_work_file").val();
				
				params["var_id"] = var_id;
			
				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveLicenciaMedica",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if (status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formLicenciaMedica").find("input[type=text]:not([readonly]), textarea, select").each(function(){
							$(this).val('');            
						});
						loadLicenciaMedica($('#id_legajo').val());
						var_id = "";
					}else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});

$('#saveLicFamiliar').click(function() {
    var isValid = $("form#formLicenciaMedicaFamiliar").valid();   

    if (isValid){
        bootbox.confirm("Estás seguro de guardar esta información?", function(result) {
			if(result){
				params = {}
				params["apellido-lf"] = $("#apellido-lf").val();
				params["nombre-lf"] = $("#nombre-lf").val();
				params["escalafon-lf"] = $("#escalafon-lf").val();
				params["fecha-licencia-lf"] = $("#fecha-licencia-lf").val();
				params["nombre-completo-familiar-lf"] = $("#nombre-completo-familiar-lf").val();
				params["relacion-lf"] = $("#relacion-lf").val();
				params["domicilio-lf"] = $("#domicilio-lf").val();
				params["telefono-familiar-lf"] = $("#telefono-familiar-lf").val();
				params["nombre-centro-lf"] = $("#nombre-centro-lf").val();
				params["domicilio-centro-lf"] = $("#domicilio-centro-lf").val();
				params["tel-centro-lf"] = $("#tel-centro-lf").val();
				params["idlegajo"] = $("#id_legajo").val();
				params["work_file_id"] = $("#id_work_file").val();
				
				params["var_id"] = var_id;

				json_params = JSON.stringify(params);

				$.ajax({
					method: "POST",
					url: "/saveLicenciaMedicaFamiliar",
					data: json_params
				}).done(function(msg){
					var status = msg.status;
                    var mensaje= msg.response;
					if (status == '0'){
						bootbox.alert("Se ha  proceso realizado el registro de manera exitosa", function(){})
						$("form#formLicenciaMedicaFamiliar").find("input[type=text]:not([readonly]), textarea").each(function(){
							$(this).val('');            
						});
						loadLicenciaMedicaFamiliar($('#id_legajo').val());
						var_id = "";
					}else{
						bootbox.alert(mensaje, function(){})
					}
				});
			}
        })
    }
});


$( "#building").on('change', function() {
    var idb = this.value;
    $.ajax({
        method: "POST",
        url: "/getOffices",
        data: {id_building : idb}
    }).done(function(buildings){
         $('#office').empty();
        for (var key in buildings) {
          if (buildings.hasOwnProperty(key)) {
            $('#office').append('<option value='+buildings[key].id+'>'+buildings[key].name+'</option>');
          }
        }
    });
});


function loadContacts(id_legajo){
    var id_legajo = id_legajo;

    if(id_legajo != null && id_legajo != ""){
        $.ajax({
            method: "POST",
            url: "/getContactTypes",
            data: {id : id_legajo }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#contacts").find('tbody').empty();
                $.each(msg.contacts, function(id,key) {

                    $("#contacts").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.contact_type.name)
                        )
                        .append($('<td>')
                            .append(key.value)
                        )
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_contact', key.contact_type_id)
                                .attr('class', 'editContact')
                                .attr('type', 'button')
                                    .append($('<span aria-hidden="true">')
                                        .attr('class', 'glyphicon glyphicon-edit')
                                    )
                                .on('click', function(event){
                                    var_id_employee_contact_type = key.id_employee_contact_type;
                                    $.ajax({
                                        method: "POST",
                                            url: "/showContact/"+ key.id_employee_contact_type,
                                            data: {id : key.id_employee_contact_type, employee_id : id_legajo}
                                    }).done(function(result){
                                        if (result[0].contact_type.type_id == 1){
                                            // CORREO
                                            $("select#tipo_email").val(result[0].contact_type_id);
                                            $("input#email").val(result[0].value)
                                        }else{
                                            // TELEFONO
                                            $("select#tipo_telefono").val(result[0].contact_type_id)
                                            $("input#numero_tel").val(result[0].value)
                                        }

                                        return false;
                                    });
                                }) 
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_contact', key.id_employee_contact_type)
                                .attr('class', 'deleteContact')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteContactType",
                                                data: {id : key.id_employee_contact_type, employee_id : id_legajo}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadContacts(id_legajo);
                                                    });
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                    .append($('<span aria-hidden="true">')
                                        .attr('class', 'glyphicon glyphicon-remove')
                                    )
                            )
                        )
                        
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function bindContactActions(){
        $( ".deleteContact" ).bind({
          click: function() {
            var id_contact = $( this ).attr( "id_contact" );
            alert(id_contact);
          }
        });
}

function loadAdresses(id_legajo){
    var id_legajo = id_legajo;

    if(id_legajo != null && id_legajo != ""){
        $.ajax({
            method: "POST",
            url: "/getAdresses",
            data: {id : id_legajo }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#direcciones").find('tbody').empty();
                $.each(msg.adresses, function(id,key) {

                    if(key.adresses != null){

                        $("#direcciones").find('tbody')
                        .append($('<tr>')
                            .append($('<td>')
                                .append(key.adresses.type)
                            )
                            .append($('<td>')
                                .append(key.adresses.street)
                            )
                            .append($('<td>')
                                .append(key.adresses.number)
                            )
                            .append($('<td>')
                                .append(key.adresses.floor)
                            )
                            .append($('<td>')
                                .append(key.adresses.department)
                            )
                            .append($('<td>')
                                .append(key.adresses.postal_code)
                            )
                            .append($('<td>')
                                .append(key.adresses.province.name)
                            )
                            .append($('<td>')
                                .append(key.adresses.locality.name)
                            )
                            .append($('<td>')
                                .append(key.adresses.split.name)
                            )
                            .append($('<td>')
                                .append(key.adresses.neighborhood)
                            )
                            .append($('<td>')
                                .append($('<button> aria-label="Left Align"')
                                    .append($('<span aria-hidden="true">')
                                        .attr('class', 'glyphicon glyphicon-edit')
                                    ).on('click', function(event){
                                        var_id = key.adresses.id;

                                        $.ajax({
                                            method: "POST",
                                                url: "/showAddress/"+ key.adresses.id,
                                                data: {id : key.adresses.id, employee_id : id_legajo}
                                        }).done(function(result){
                                            $("#tipo_direccion").val(result.type)
                                            $("#calle").val(result.street);
                                            $("#numero").val(result.number);
                                            $("#piso").val(result.floor);
                                            $("#departamento").val(result.department);
                                            $("#codigo-postal").val(result.postal_code);
                                            $("#province").val(result.province_id);
                                            $("#locality").val(result.locality_id);
                                            $("#split").val(result.split_id);
                                            $("#barrio").val(result.neighborhood);
                                            $("#telefono-direccion").val(result.phone);
                                        });
                                        return false;
                                    })
                                )
                                .append($('<button> aria-label="Left Align"')
                                    .attr('id_adress', key.adresses.id)
                                    .attr('class', 'deleteAdress')
                                    .attr('type', 'button')
                                    .on('click', function(event) {
                                        bootbox.confirm("Estás seguro?", function(result) {
                                            if(result == true){
                                                $.ajax({
                                                    method: "POST",
                                                    url: "/deleteAdress",
                                                    data: {id : key.adresses.id }
                                                }).done(function(result){
                                                        if(result.status == '0'){
                                                            bootbox.alert(result.response, function() {
                                                                 loadAdresses(id_legajo);
                                                            });
                                                        }
                                                        else{
                                                            bootbox.alert(result.response, function() {
                                                            });
                                                        }
                                                });
                                            }
                                        }); 
                                    })
                                    .append($('<span aria-hidden="true">')

                                        .attr('class', 'glyphicon glyphicon-remove')
                                    )
                                )
                            )
                            
                        );
                    }

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function calcularEdad(fecha){
        
        var values=fecha.split("-");
        var dia = values[2];
        var mes = values[1];
        var ano = values[0];
 
        var fecha_hoy = new Date();
        var ahora_ano = fecha_hoy.getYear();
        var ahora_mes = fecha_hoy.getMonth()+1;
        var ahora_dia = fecha_hoy.getDate();
 
        var edad = (ahora_ano + 1900) - ano;
        if ( ahora_mes < mes )
        {
            edad--;
        }
        if ((mes == ahora_mes) && (ahora_dia < dia))
        {
            edad--;
        }
        if (edad > 1900)
        {
            edad -= 1900;
        }
 
        var meses=0;
        if(ahora_mes>mes)
            meses=ahora_mes-mes;
        if(ahora_mes<mes)
            meses=12-(mes-ahora_mes);
        if(ahora_mes==mes && dia>ahora_dia)
            meses=11;
 
        var dias=0;
        if(ahora_dia>dia)
            dias=ahora_dia-dia;
        if(ahora_dia<dia)
        {
            ultimoDiaMes=new Date(ahora_ano, ahora_mes, 0);
            dias=ultimoDiaMes.getDate()-(dia-ahora_dia);
        }
 
       return edad;
}

function loadFamily(id_legajo){
    var id_legajo = id_legajo;

    if(id_legajo != null && id_legajo != ""){
        $.ajax({
            method: "POST",
            url: "/getFamily",
            data: {id : id_legajo }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#table_family").find('tbody').empty();
                $.each(msg.family, function(id,key) {
                    var disability = "No";
                    var disability_name = "";
                    var family_age = calcularEdad(key.birthdate);
                    if(key.disability != ""){
                        disability = "Si";
                        disability_name = key.disability[0].name;
                    }

                    $("#table_family").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.lastname)
                        )
                        .append($('<td>')
                            .append(key.name)
                        )
                        .append($('<td>')
                            .append(key.gender)
                        )
                        .append($('<td>')
                            .append((key.birthdate) ? key.birthdate.split("-").reverse().join("-") : "")
                        )
                        .append($('<td>')
                            .append(key.kinship.name)
                        )
                        .append($('<td>')
                            .append(disability)
                        )
                        .append($('<td>')
                            .append(disability_name)
                        )
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_contact', key.id)
                                .attr('class', 'editFamily')
                                .on('click', function(event) {
                                    var_id = key.id;

									$("#parentesco").val(key.kinship_id);
									$("#family_lastname").val(key.lastname);
									$("#family_name").val(key.name);
									$("#family_dni").val(key.document);
									$("#family_sex").val(key.gender);	
									$("#family_birthdate").val(key.birthdate.split("-").reverse().join("-"));
                                    if (Array.isArray(key.disability[0])){
                                        $("#family_disability").val((key.disability[0].id != 0) ? 1 : 0);   
                                        $("#family_disability_type").val(key.disability[0].id);  
                                    }
									   
									$("#family_alive").val(key.living_with);	
									$("#family_garden").val(key.garden_assignation);	

									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_family', key.id)
                                .attr('class', 'deleteFamily')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteFamily",
                                                data: {id : key.id , employee_id : id_legajo}
                                            }).done(function(result){
                                                    if(result.status == '0'){
                                                        bootbox.alert(result.response, function() {
                                                            loadFamily(id_legajo);
                                                        });
                                                    }
                                                    else{
                                                        bootbox.alert(result.response, function() {
                                                        });
                                                    }
                                            });
                                        }
                                    }); 
                                })
                                    .append($('<span aria-hidden="true">')
                                        .attr('class', 'glyphicon glyphicon-remove')
                                    )
                            )
                        )
                        
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadSchedules(id_work_file){
    var id_work_file = id_work_file;

    if(id_work_file != null && id_work_file != ""){
        $.ajax({
            method: "POST",
            url: "/getSchedules",
            data: {id : id_work_file }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#horarios").find('tbody').empty();
                $.each(msg.schedules, function(id,key) {
                    
                    $("#horarios").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.work_file.area.name)
                        )
                        .append($('<td>')
                            .append(key.work_file.office.building.name)
                        )
                        .append($('<td>')
                            .append(key.work_file.office.name)
                        )
                        .append($('<td>')
                            .append(key.schedules.days)
                        )
                        .append($('<td>')
                            .append(key.schedules.time_in+" - "+key.schedules.time_out)
                        )
                        .append($('<td>')
                            .append(key.date_from)
                        )
                        .append($('<td>')
                            .append(key.date_to)
                        )
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_schedule', key.id)
                                .attr('class', 'editSchedule')
                                .on('click', function(event) {
                                    var_id = key.id;
                                    $("#have_additionals").val(key.work_file.additionals);
                                    $("#additional").val(key.work_file.additional_id);
									$("#supplement").val(key.work_file.supplement_id);
									$("#area").val(key.work_file.area_id);
									$("#building").val(key.work_file.office.building_id);
									$("#office").val(key.work_file.office_id);
									$("#hour_from").val(key.schedules.time_in);
									$("#hour_to").val(key.schedules.time_out);
									$("#date_from").val(key.date_from.split("-").reverse().join("-"));
									$("#date_to").val(key.date_to.split("-").reverse().join("-"));
                                    $("#job_status").val(key.work_file.work_file_job_status[0].job_status_id);
                                    $("#date_in").val(key.work_file.start_date.split("-").reverse().join("-"));
									
									$("#lunes, #martes, #miercoles, #jueves, #viernes, #sabado, #domingo").prop('checked', false);
									
									if (key.schedules.days.indexOf("lunes") >= 0) 
										$("#lunes").prop('checked', true);
									if (key.schedules.days.indexOf("martes") >= 0) 
										$("#martes").prop('checked', true);
									if (key.schedules.days.indexOf("miercoles") >= 0) 
										$("#miercoles").prop('checked', true);
									if (key.schedules.days.indexOf("jueves") >= 0) 
										$("#jueves").prop('checked', true);
									if (key.schedules.days.indexOf("viernes") >= 0) 
										$("#viernes").prop('checked', true);
									if (key.schedules.days.indexOf("sabado") >= 0) 
										$("#sabado").prop('checked', true);
									if (key.schedules.days.indexOf("domingo") >= 0) 
										$("#domingo").prop('checked', true);

                                    return false;
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-edit')
                                )
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_schedule', key.schedule_id)
                                .attr('class', 'deleteSchedule')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteSchedule",
                                                data: {id : key.schedule_id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadSchedules(id_work_file);
                                                    });
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                        
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadRoles(id_review){
    var id_review = id_review;

    if(id_review != null && id_review != ""){
        $.ajax({
            method: "POST",
            url: "/getRoles",
            data: {id : id_review }
        }).done(function(msg){

            var status = msg.status;
            if(status == '0'){
                $("#roles").find('tbody').empty();

                $.each(msg.roles, function(id,key) {
                    var dia_fin=null;
                    if(key.end_date!=null)
                        dia_fin= key.end_date.split("-").reverse().join("-");

                    $("#roles").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.role.name)
                        )
                        .append($('<td>')
                            .append(key.description)
                        )
                        .append($('<td>')
                            .append((key.start_date) ? key.start_date.split("-").reverse().join("-") : "")
                        )
                        .append($('<td>')
                            .append(dia_fin)
                        )
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_role', key.id_review_role)
                                .attr('class', 'editRole')
                                .on('click', function(event) {
                                    var_id = key.id_review_role;

                                    $("#role").val(key.role.id);
                                    $("#role_description").val(key.description);
                                    $("#role_from").val(key.start_date.split("-").reverse().join("-"));
                                    $("#role_to").val(dia_fin);

                                    return false;
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-edit')
                                )
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_role', key.id_review_role)
                                .attr('class', 'deleteRole')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteRole",
                                                data: {id : key.id_review_role , review_id : id_review}
                                            }).done(function(result){
                                                    if(result.status == '0'){
                                                        bootbox.alert(result.response, function() {
                                                            loadRoles(id_review);
                                                        });
                                                    }
                                                    else{
                                                        bootbox.alert(result.response, function() {
                                                        });
                                                    }
                                            });
                                        }
                                    }); 
                                })
                                    .append($('<span aria-hidden="true">')
                                        .attr('class', 'glyphicon glyphicon-remove')
                                    )
                            )
                        )
                        
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadReview(id_review){
    var id_review = id_review;

    if(id_review != null && id_review != ""){
        $.ajax({
            method: "POST",
            url: "/getReview",
            data: {id : id_review }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#tblReview").find('tbody').empty();
                $.each(msg.review, function(id,key) {
                      var dia_fin=null;
                    if(key.out_afip!=null)
                        dia_fin = key.out_afip.split("-").reverse().join("-");

					$("#tblReview").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.scale.name)
                        )
                        .append($('<td>')
                            .append(key.grouping.name)
                        )
                        .append($('<td>')
                            .append(key.level)
                        )
                        .append($('<td>')
                            .append(key.grade)
                        )
                        .append($('<td>')
                            .append(key.stretch.name)
                        )       
                        .append($('<td>')
                            .append(key.category.name)
                        )                   
                        .append($('<td>')
                            .append(key.executive_function)
                        )
                        .append($('<td>')
                            .append(key.in_afip.split("-").reverse().join("-"))
                        )   
                        .append($('<td>')

                            .append(dia_fin)
                        )          
                        .append($('<td>')
                            .append(key.date_afip.split("-").reverse().join("-"))
                        )                                                                                                                            
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_review', key.id)
                                .attr('class', 'editReview')
                                .on('click', function(event) {
                                    var_id = key.id;

                                    $("#scale").val(key.scale_id);
                                    $("#agrupamiento").val(key.grouping_id);
                                    $("#level").val(key.level);
                                    $("#grade").val(key.grade);
                                    $("#stretch").val(key.stretch_id); 
                                    $("#review_category").val(key.category_id);
                                    $("#executive_function").val(key.executive_function); 
                                    $("#in_afip").val(key.in_afip.split("-").reverse().join("-")); 
                                    $("#out_afip").val(dia_fin);
                                    $("#date_afip").val(key.date_afip.split("-").reverse().join("-")); 

                                    return false;
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-edit')
                                )
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_review', key.id)
                                .attr('class', 'deleteReview')
                                .attr('type', 'button')
                                .on('click', function(event) {

									bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteReview",
                                                data: {id : key.id , work_file_id : key.work_file_id}
                                            }).done(function(result){
                                                    if(result.status == '0'){
                                                        bootbox.alert(result.response, function() {
                                                            loadReview(key.work_file_id);
                                                        });
                                                    }
                                                    else{
                                                        bootbox.alert(result.response, function() {
                                                        });
                                                    }
                                            });
                                        }
                                    }); 
                                })
                                    .append($('<span aria-hidden="true">')
                                        .attr('class', 'glyphicon glyphicon-remove')
                                    )
                            )
                        )
                        
                    );
                });
            }
            else{alert('Error:' + msg.response);
            }
        });
    }
}

function loadEducation(id_work_file){
    var id_work_file = id_work_file;

    if(id_work_file != null && id_work_file != ""){
        $.ajax({
            method: "POST",
            url: "/getEducation",
            data: {id : id_work_file }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#tabla_educacion").find('tbody').empty();
                $.each(msg.education, function(id,key) {

				$("#tabla_educacion").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.education.education_title)
                        )
                        .append($('<td>')
                            .append((key.education.end_date) ? key.education.end_date.split("-").reverse().join("-") : "")
                        )
                        .append($('<td>')
                            .append(key.education.level.name)
                        )
                        .append($('<td>')
                            .append(key.education.status.name)
                        )
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_education', key.education_id)
                                .attr('class', 'editEducation')
                                .on('click', function(event) {
                                    var_id = key.education_id;

									$("#titulo").val(key.education.education_title);
									$("#education_country").val();
									$("#institution").val(key.education.institution_id);
									$("#education_level").val(key.education.education_level_id);
									$("#education_start").val(key.education.start_date.split("-").reverse().join("-"));	
									$("#education_end").val(key.education.end_date.split("-").reverse().join("-"));	
									$("#education_status").val(key.education.education_status_id);
									
									if (key.education.ended == 1)
										$("#education_actually").attr("checked", "checked");
									
									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_education', key.id)
                                .attr('class', 'deleteEducation')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteEducation",
                                                data: {id : key.id_work_file_education , review_id : id_work_file}
                                            }).done(function(result){
                                                    if(result.status == '0'){
                                                        bootbox.alert(result.response, function() {
                                                            loadEducation(id_work_file);
                                                        });
                                                    }
                                                    else{
                                                        bootbox.alert(result.response, function() {
                                                        });
                                                    }
                                            });
                                        }
                                    }); 
                                })
                                    .append($('<span aria-hidden="true">')
                                        .attr('class', 'glyphicon glyphicon-remove')
                                    )
                            )
                        )
                        
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadCourses(id_work_file){
    var id_work_file = id_work_file;

    if(id_work_file != null && id_work_file != ""){
        $.ajax({
            method: "POST",
            url: "/getCourses",
            data: {id : id_work_file }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#cursos").find('tbody').empty();
                $.each(msg.courses, function(id,key) {
                    
                    $("#cursos").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.course.name)
                        )
                        .append($('<td>')
                            .append(key.course.certificate)
                        )
                        .append($('<td>')
                            .append((key.course.end_date) ? key.course.end_date.split("-").reverse().join("-") : "")
                        )
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_course', key.course_id)
                                .attr('class', 'editCourse')
                                .on('click', function(event) {

									var_id = key.course_id;
									$("#course_institution").val(key.course.name);
									$("#course_certificate").val(key.course.certificate);
                                    $("#course_finalization").val((key.course.end_date) ? key.course.end_date.split("-").reverse().join("-") : "");	
									
									if (key.course.ended == 1){
										$("#course_actually").attr("checked", "checked");
										$("#course_finalization").val("");
									}

									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_course', key.course_id)
                                .attr('class', 'deleteCourse')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteCourse",
                                                data: {id : key.course_id , review_id : id_work_file}
                                            }).done(function(result){
                                                    if(result.status == '0'){
                                                        bootbox.alert(result.response, function() {
                                                            loadCourses(id_work_file);
                                                        });
                                                    }
                                                    else{
                                                        bootbox.alert(result.response, function() {
                                                        });
                                                    }
                                            });
                                        }
                                    }); 
                                })
                                    .append($('<span aria-hidden="true">')
                                        .attr('class', 'glyphicon glyphicon-remove')
                                    )
                            )
                        )
                        
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadCongresses(id_work_file){
    var id_work_file = id_work_file;

    if(id_work_file != null && id_work_file != ""){
        $.ajax({
            method: "POST",
            url: "/getCongresses",
            data: {id : id_work_file }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#congresos").find('tbody').empty();
                $.each(msg.congresses, function(id,key) {
                    
                    $("#congresos").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.congress.name)
                        )
                        .append($('<td>')
                            .append(key.congress.especiality)
                        )
                        .append($('<td>')
                            .append(key.congress.certificate)
                        )
                        .append($('<td>')
                            .append((key.congress.end_date) ? key.congress.end_date.split("-").reverse().join("-") : "")
                        )
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_congress', key.congress_id)
                                .attr('class', 'editCongress')
                                .on('click', function(event) {
                                    var_id = key.congress_id;

                                    $("#congress_title").val(key.congress.name);
                                    $("#congress_specialization").val(key.congress.especiality);
                                    $("#congress_certificado").val(key.congress.certificate);                                    
                                    $("#congress_finalization").val((key.congress.end_date) ? key.congress.end_date.split("-").reverse().join("-") : "");   
                                    
                                    if (key.congress.ended == 1){
                                        $("#congress_actually").attr("checked", "checked");
                                        $("#congress_finalization").val("");
                                    }

                                    return false;
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-edit')
                                )
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_congress', key.congress_id)
                                .attr('class', 'deleteCongress')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteCongress",
                                                data: {id : key.congress_id , review_id : id_work_file}
                                            }).done(function(result){
                                                    if(result.status == '0'){
                                                        bootbox.alert(result.response, function() {
                                                            loadCongresses(id_work_file);
                                                        });
                                                    }
                                                    else{
                                                        bootbox.alert(result.response, function() {
                                                        });
                                                    }
                                            });
                                        }
                                    }); 
                                })
                                    .append($('<span aria-hidden="true">')
                                        .attr('class', 'glyphicon glyphicon-remove')
                                    )
                            )
                        )
                        
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadLanguages(id_work_file){
    var id_work_file = id_work_file;

    if(id_work_file != null && id_work_file != ""){
        $.ajax({
            method: "POST",
            url: "/getLanguages",
            data: {id : id_work_file }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#idiomas").find('tbody').empty();
                $.each(msg.languages, function(id,key) {
                    
                    $("#idiomas").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.language.name)
                        )
                        .append($('<td>')
                            .append(key.write_level)
                        )
                        .append($('<td>')
                            .append(key.speak_level)
                        )
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_language', key.id)
                                .attr('class', 'editLanguage')
                                .on('click', function(event) {
                                    var_id = key.language_id;
                                    var_review_id = key.work_file_id;

                                    $("#language").val(key.language_id);
                                    $("#escrito").val(key.write_level);
                                    $("#oral").val(key.speak_level);                                    

                                    return false;
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-edit')
                                )
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_language', key.language_id)
                                .attr('class', 'deleteLanguage')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteLanguage",
                                                data: {id : key.language_id , review_id : id_work_file}
                                            }).done(function(result){
                                                    if(result.status == '0'){
                                                        bootbox.alert(result.response, function() {
                                                            loadLanguages(id_work_file);
                                                        });
                                                    }
                                                    else{
                                                        bootbox.alert(result.response, function() {
                                                        });
                                                    }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                        
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadItCourses(id_work_file){
    var id_work_file = id_work_file;

    if(id_work_file != null && id_work_file != ""){
        $.ajax({
            method: "POST",
            url: "/getItCourses",
            data: {id : id_work_file }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#it_cursos").find('tbody').empty();
                $.each(msg.courses, function(id,key) {
                    
                    $("#it_cursos").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.course.area.name)
                        )
                        .append($('<td>')
                            .append(key.course.level.name)
                        )
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_it_course', key.id)
                                .attr('class', 'editItCourse')
                                .on('click', function(event) {
                                    var_id = key.course.id;

                                    $("#it_area").val(key.course.it_area_id);
                                    $("#it_level").val(key.course.it_level_id);

                                    return false;
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-edit')
                                )
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_it_course', key.it_course_id)
                                .attr('class', 'deleteItCourse')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteItCourse",
                                                data: {id : key.it_course_id , review_id : id_work_file}
                                            }).done(function(result){
												if (result.status == '0'){
													bootbox.alert(result.response, function() {
														loadItCourses(id_work_file);
													});
												}
												else{
													bootbox.alert(result.response, function() {
													});
												}
                                            });
                                        }
                                    }); 
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-remove')
								)
                            )
                        )
                        
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadAdditionalKnowledgeHistory(id_work_file){
    var id_work_file = id_work_file;

    if(id_work_file != null && id_work_file != ""){
        $.ajax({
            method: "POST",
            url: "/getAdditionalKnowledgeHistory",
            data: {id : id_work_file }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#tblConocimientosAdicionales").find('tbody').empty();
                $.each(msg.additional, function(id,key) {

                    $("#tblConocimientosAdicionales").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.publication_name)
                        )
						.append($('<td>')
                            .append((key.publication_date) ? key.publication_date.split("-").reverse().join("-") : "")
                        )
						.append($('<td>')
                            .append(key.education_level.name)
                        )
						.append($('<td>')
                            .append(key.departament)
                        )
						.append($('<td>')
                            .append(key.intitution)
                        )
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_additional', key.id)
                                .attr('class', 'editAdditionalKnowledge')
                                .on('click', function(event) {
                                    var_id = key.id;
									
									$("#nombre-publicacion").val(key.publication_name);
									$("#fecha-publicacion").val((key.publication_date) ? key.publication_date.split("-").reverse().join("-") : "");
									$("#n-educativo").val(key.education_level_id);
									$("#especialidad-materia").val(key.departament);									
									$("#institucion").val(key.intitution);

                                    return false;
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-edit')
                                )
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_additional', key.language_id)
                                .attr('class', 'deleteAdditionalKnowledge')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteAdditionalKnowledge",
                                                data: {id : key.id , id_work_file : id_work_file}
                                            }).done(function(result){
												if(result.status == '0'){
													bootbox.alert(result.response, function() {
														loadAdditionalKnowledgeHistory(id_work_file);
													});
												}
												else{
													bootbox.alert(result.response, function() {
													});
												}
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                        
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadPublicServices(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getPublicServicesHistory",
            data: {id : idlegajo }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#tblServiciosPublicos").find('tbody').empty();
                $.each(msg.publicServices, function(id,key) {
					$("#tblServiciosPublicos").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.organism)
                        )
                        .append($('<td>')
                            .append(key.review.scale.name + " " + key.review.grouping.name + " " + key.review.level)
                        )
                        .append($('<td>')
                            .append(key.motivation)
                        )
                        .append($('<td>')
                            .append(key.destination)
                        )
                        .append($('<td>')
                            .append((key.date_from) ? key.date_from.split("-").reverse().join("-") : "")
                        ) 
                        .append($('<td>')
                            .append((key.date_to) ? key.date_to.split("-").reverse().join("-") : "")
                        )
                        .append($('<td>')
                            .append(key.administrative_act.name)
                        )                             
                        .append($('<td>')
                            .append(key.act_number)
                        )                        
                        .append($('<td>')
                            .append((key.act_date) ? key.act_date.split("-").reverse().join("-") : "")
                        )                        
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_public_service', key.id)
                                .attr('class', 'editPublicService')
                                .attr('type', 'button')
								.on('click', function(event) {
                                    var_id = key.id;

									$("#organismo-publico").val(key.organism);
									$("#situacion-revista").val(key.review_id);
									$("#motivo").val(key.motivation);
                                    $("#destino").val(key.destination);
                                    $("#desde").val(key.date_from.split("-").reverse().join("-"));
                                    $("#hasta").val(key.date_to.split("-").reverse().join("-"));
									$("#acto-administrativo").val(key.administrative_act_id);
                                    $("#numero-acto").val(key.act_number);
                                    $("#fecha-acto").val(key.act_date.split("-").reverse().join("-"));

									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_public_service', key.id)
                                .attr('class', 'deletePublicService')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deletePublicService",
                                                data: {id : key.id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadPublicServices(idlegajo);
                                                    });
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                ////alert('Error:' + msg.response);
            }
        });
    }
}

function loadPrivateServices(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getPrivateServicesHistory",
            data: {id : idlegajo }
        }).done(function(msg){
            var status = msg.status;
            
            if(status == '0'){
                $("#tblServiciosPrivados").find('tbody').empty();
                $.each(msg.privateServices, function(id,key) {
                    $("#tblServiciosPrivados").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.institution_name)
                        )
                        .append($('<td>')
                            .append(key.legal_adress)
                        )
                        .append($('<td>')
                            .append(key.charge_function)
                        )
                        .append($('<td>')
                            .append(key.remunerated)
                        ) 
                        .append($('<td>')
                            .append((key.date_from) ? key.date_from.split("-").reverse().join("-") : "")
                        )
                        .append($('<td>')
                            .append((key.date_to) ? key.date_to.split("-").reverse().join("-") : "")
                        )                             
                        .append($('<td>')
                            .append(key.out_motivation)
                        )                                              
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_private_service', key.id)
                                .attr('class', 'editPrivateService')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    var_id = key.id;

                                    $("#institucionPriv").val(key.institution_name);
                                    $("#domicilio-legal").val(key.legal_adress);
                                    $("#cargo").val(key.charge_function);
                                    $("#remunerado").val(key.remunerated);
                                    $("#desde2").val(key.date_from.split("-").reverse().join("-"));
                                    $("#hasta2").val(key.date_to.split("-").reverse().join("-"));
                                    $("#causa-egreso").val(key.out_motivation);

                                    return false;
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-edit')
                                )
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_private_service', key.id)
                                .attr('class', 'deletePrivateService')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deletePrivateService",
                                                data: {id : key.id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadPrivateServices(idlegajo);
                                                    });
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                ////alert('Error:' + msg.response);
            }
        });
    }
}

function loadCongrats(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getCongratulationsHistory",
            data: {id : idlegajo }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#tblFelicitaciones").find('tbody').empty();
                $.each(msg.congratulations, function(id,key) {
                    $("#tblFelicitaciones").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.jurisdiction)
                        )
                        .append($('<td>')
                            .append(key.organization)
                        )
                        .append($('<td>')
                            .append(key.observation)
                        )
                        .append($('<td>')
                            .append(key.motivation)
                        ) 
                        .append($('<td>')
                            .append(key.administrative_act.name)
                        )
                        .append($('<td>')
                            .append(key.act_number)
                        )                             
                        .append($('<td>')
                            .append((key.mention_date) ? key.mention_date.split("-").reverse().join("-") : "")
                        )                                              
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_congrat', key.id)
                                .attr('class', 'editCongrat')
                                .attr('type', 'button')
								.on('click', function(event) {
                                    var_id = key.id;
									$("#jurisdiccion").val(key.jurisdiction);
									$("#organismo2").val(key.organization);
									$("#concepto").val(key.observation);
									$("#motivo1").val(key.motivation);
									$("#acto-administrativo2").val(key.administrative_act_id);
									$("#numero-acto2").val(key.act_number);									
									$("#fecha2").val(key.mention_date.split("-").reverse().join("-"));
									
									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_congrat', key.id)
                                .attr('class', 'deleteCongrat')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteCongrat",
                                                data: {id : key.id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadCongrats(idlegajo);
                                                    });
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadSanctions(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getSanctionsHistory",
            data: {id : idlegajo }
        }).done(function(msg){
			
            var status = msg.status;
            if(status == '0'){
                $("#tblSanciones").find('tbody').empty();
                $.each(msg.sanctions, function(id,key) {
                    $("#tblSanciones").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.institution)
                        )
                        .append($('<td>')
                            .append(key.administrative_act.name)
                        )
                        .append($('<td>')
                            .append(key.act_number)
                        )
                        .append($('<td>')
                            .append((key.sanction_date) ? key.sanction_date.split("-").reverse().join("-") : "")
                        ) 
                        .append($('<td>')
                            .append(key.disciplinary_action)
                        )
                        .append($('<td>')
                            .append(key.cause)
                        )                             
                        .append($('<td>')
                            .append((key.santion_from) ? key.santion_from.split("-").reverse().join("-") : "")
                        )     
						.append($('<td>')
                            .append((key.sanction_to) ? key.sanction_to.split("-").reverse().join("-") : "")
                        )  						
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_sanction', key.id)
                                .attr('class', 'editSanction')
                                .attr('type', 'button')
								.on('click', function(event) {
                                    var_id = key.id;

									$("#organismo3").val(key.institution);
									$("#acto-administrativo1").val(key.administrative_act_id);
									$("#numero-acto3").val(key.act_number);
									$("#fecha3").val(key.sanction_date.split("-").reverse().join("-"));
									$("#medida-disciplinaria").val(key.disciplinary_action);
									$("#motivo3").val(key.cause);
									$("#desde3").val(key.santion_from.split("-").reverse().join("-"));									
									$("#hasta3").val(key.sanction_to.split("-").reverse().join("-"));
									
									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_sanction', key.id)
                                .attr('class', 'deleteSanction')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteSanction",
                                                data: {id : key.id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadSanctions(idlegajo);
                                                    });
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadEmbargos(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getSeizuresHistory",
            data: {id : idlegajo }
        }).done(function(msg){
			
            var status = msg.status;
            if(status == '0'){
                $("#tblEmbargos").find('tbody').empty();
                $.each(msg.seizure, function(id,key) {
                    $("#tblEmbargos").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.expedient_number)
                        )
                        .append($('<td>')
                            .append((key.date_From) ? key.date_From.split("-").reverse().join("-") : "")
                        )
                        .append($('<td>')
                            .append(key.charter)
                        )
                        .append($('<td>')
                            .append(key.tribunal)
                        ) 
                        .append($('<td>')
                            .append(key.secretary)
                        )
                        .append($('<td>')
                            .append(key.cars)
                        )                             
                        .append($('<td>')
                            .append(key.ammount)
                        )     
						.append($('<td>')
                            .append((key.worked == 1) ? "SI" : "NO")
                        )
						.append($('<td>')
                            .append((key.earned == 1) ? "SI" : "NO")
                        )  						
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_contact', key.id)
                                .attr('class', 'editContact')
                                .attr('type', 'button')
								.on('click', function(event) {
                                    var_id = key.id;

									$("#numero-expediente").val(key.expedient_number);
									$("#hasta4").val(key.date_From.split("-").reverse().join("-"));
									$("#fuero").val(key.charter);
									$("#juzgado").val(key.tribunal);
									$("#secretaria").val(key.secretary);
									$("#autos").val(key.cars);
									$("#monto").val(key.ammount);									
									$("#trabajado").val(key.worked);
									$("#levantado").val(key.earned);
									
									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_seizure', key.id)
                                .attr('class', 'deleteSeizure')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteSeizure",
                                                data: {id : key.id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadEmbargos(idlegajo);
                                                    });
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadEvaluaciones(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getPerformanceEvaluationHistory",
            data: {id : idlegajo }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#tblEvaluacion").find('tbody').empty();
                $.each(msg.evaluations, function(id,key) {
                    $("#tblEvaluacion").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.year_evaluation)
                        )
                        .append($('<td>')
                            .append(key.qualification)
                        )
                        .append($('<td>')
                            .append((key.used == 1) ? "SI" : "NO")
                        )
                        .append($('<td>')
                            .append(key.level)
                        ) 
                        .append($('<td>')
                            .append(key.grade_evaluation)
                        )
                        .append($('<td>')
                            .append((key.bonification == 1) ? "SI" : "NO")
                        )                             
                        .append($('<td>')
                            .append((key.notification) ? key.notification.split("-").reverse().join("-") : "")
                        )     
						.append($('<td>')
                            .append(key.observations)
                        )						
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_evaluation', key.id)
                                .attr('class', 'editPerformanceEvaluation')
                                .on('click', function(event) {
                                    var_id = key.id;

									$("#ano").val(key.year_evaluation);
									$("#calificacion").val(key.qualification);
									$("#utilizada").val(key.used);
									$("#nivelD").val(key.level);
									$("#grado").val(key.grade_evaluation);
									$("#bonificacion").val(key.bonification);									
									$("#notificacion").val(key.notification.split("-").reverse().join("-"));
									$("#observaciones").val(key.observations);
									
									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_evaluation', key.id)
                                .attr('class', 'deletePerformanceEvaluation')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deletePerformanceEvaluation",
                                                data: {id : key.id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadEvaluaciones(idlegajo);
                                                    });
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadCreditos(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getCapacitationHistory",
            data: {id : idlegajo }
        }).done(function(msg){
            var status = msg.status;
            if(status == '0'){
                $("#tblCreditos").find('tbody').empty();
                $.each(msg.capacitations, function(id,key) {
                   $("#tblCreditos").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.year_credit)
                        )
                        .append($('<td>')
                            .append(key.credit_quantity)
                        )
                        .append($('<td>')
                            .append((key.credit_used == 1) ? "SI" : "NO")
                        )
                        .append($('<td>')
                            .append(key.credit_total)
                        ) 
                        .append($('<td>')
                            .append((key.validity_date) ? key.validity_date.split("-").reverse().join("-") : "")
                        )
                        .append($('<td>')
                            .append(key.observations)
                        )                             					
                        .append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_contact', key.id)
                                .attr('class', 'editContact')
                                .on('click', function(event) {
                                    var_id = key.id;

									$("#ano2").val(key.year_credit);
									$("#cantidad").val(key.credit_quantity);
									$("#utilizados2").val(key.credit_used);
									$("#total").val(key.credit_total);
									$("#vigencia").val(key.validity_date.split("-").reverse().join("-"));
									$("#observaciones2").val(key.observations);									
									
									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_capacitation', key.id)
                                .attr('class', 'deleteCapacitation')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteCapacitation",
                                                data: {id : key.id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadCreditos(idlegajo);
                                                    });
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadHistorial(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getAdministrativeCareerHistory",
            data: {id : idlegajo }
        }).done(function(msg){
            var status = msg.status;
			          
			if(status == '0'){
                $("#tblHistorial").find('tbody').empty();
                $.each(msg.careers, function(id,key) {

					$("#tblHistorial").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.stretch_id)
                        )
                        .append($('<td>')
                            .append(key.grouping.name)
                        )
                        .append($('<td>')
                            .append(key.category_id)
                        )
                        .append($('<td>')
                            .append(key.scale_id)
                        ) 
                        .append($('<td>')
                            .append(key.stretch.name)
                        )
                        .append($('<td>')
                            .append(key.administrative_act.name)
                        )                             					
                        .append($('<td>')
                            .append(key.act_number)
                        )                         
						.append($('<td>')
                            .append((key.act_date) ? key.act_date.split("-").reverse().join("-") : "")
                        )                         
						.append($('<td>')
                            .append((key.date_from) ? key.date_from.split("-").reverse().join("-") : "")
                        )                         
						.append($('<td>')
                            .append(key.motivation)
                        )                        
						.append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_contact', key.id)
                                .attr('class', 'editContact')
                                .on('click', function(event) {
                                    var_id = key.id;

									$("#escalafon").val(key.stretch_id);
									$("#agrupamiento3").val(key.grouping_id);
									$("#nivel4").val(key.category_id);
									$("#grado4").val(key.scale_id);
									$("#tramo4").val(key.stretch_id);	
									$("#acto-administrativo4").val(key.administrative_act_id);	
									$("#numero-acto4").val(key.act_number);	
									$("#fecha-acto4").val(key.act_date.split("-").reverse().join("-"));
									$("#desde4").val(key.date_from.split("-").reverse().join("-"));
									$("#motivo4").val(key.motivation);	

									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_administrative_career', key.id)
                                .attr('class', 'deleteAdministrativeCareer')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteAdministrativeCareer",
                                                data: {id : key.id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadHistorial(idlegajo);
                                                    });
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadOrquesta(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getExtraHistory",
            data: {id : idlegajo }
        }).done(function(msg){
            var status = msg.status;

			if(status == '0'){
                $("#tblOrquesta").find('tbody').empty();
                $.each(msg.extras, function(id,key) {					

					$("#tblOrquesta").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.stretch_id)
                        )
                        .append($('<td>')
                            .append(key.grouping.name)
                        )
                        .append($('<td>')
                            .append(key.category.name)
                        )
                        .append($('<td>')
                            .append(key.scale_id)
                        ) 
                        .append($('<td>')
                            .append(key.administrative_act.name)
                        )
                        .append($('<td>')
                            .append(key.act_number)
                        )                             					                       
						.append($('<td>')
                            .append((key.act_date) ? key.act_date.split("-").reverse().join("-") : "")
                        )                         
						.append($('<td>')
                            .append((key.date_from) ? key.date_from.split("-").reverse().join("-") : "")
                        )                         
						.append($('<td>')
                            .append(key.motivation)
                        )                        
						.append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_contact', key.id)
                                .attr('class', 'editContact')
                                .on('click', function(event) {
                                    var_id = key.id;

									$("#escalafon2").val(key.stretch_id);
									$("#agrupamiento2").val(key.grouping_id);
									$("#categoria2").val(key.category_id);
									$("#grado5").val(key.scale_id);
									$("#tramo4").val(key.stretch_id);	
									$("#acto-administrativo3").val(key.administrative_act_id);	
									$("#numero-acto5").val(key.act_number);	
									$("#fecha-acto2").val(key.act_date.split("-").reverse().join("-"));
									$("#desde5").val(key.date_from.split("-").reverse().join("-"));
									$("#motivo5").val(key.motivation);

									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_orquesta', key.id)
                                .attr('class', 'deleteExtra')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteExtra",
                                                data: {id : key.id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadHistorial(idlegajo);
                                                    });
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadDiscapacidades(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getDisabilitiesHistory",
            data: {id : idlegajo }
        }).done(function(msg){
            var status = msg.status;
			
			if(status == '0'){
                $("#tblDiscapacidades").find('tbody').empty();
				
                $.each(msg.disability, function(id,key) {	
                    $("#tblDiscapacidades").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append((key.disability_type_id == 1) ? "SI" : "NO")
                        )
                        .append($('<td>')
                            .append(key.disability_type.name)
                        )
                        /*.append($('<td>')
                            .append(key.certificate_url)
                        )*/
                        .append($('<td>')
                            .append((key.generated_date) ? key.generated_date.split("-").reverse().join("-") : "")
                        ) 
                        .append($('<td>')
                            .append((key.start_date) ? key.start_date.split("-").reverse().join("-") : "")
                        )
                        .append($('<td>')
                            .append((key.end_date) ? key.end_date.split("-").reverse().join("-") : "")
                        )                             					                       
						.append($('<td>')
                            .append(key.certificate_creator)
                        )                        
						.append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_disability', key.id)
                                .attr('class', 'editDisability')
                                .attr('type', 'button')
								.on('click', function(event) {
                                    var_id = key.id;
									
									$("#entidad-certificado").val(key.certificate_creator);
									$("#fecha-cert-discapacidad").val(key.generated_date.split("-").reverse().join("-"));
									$("#vigencia-certificado").val(key.start_date.split("-").reverse().join("-"));
									$("#vigencia-certificado-hasta").val(key.end_date.split("-").reverse().join("-"));
									$("#tipo-discapacidad").val(key.disability_type_id);
									
									$("#discapacidad").val(0);
									if (key.disability_type_id != 0)
										$("#discapacidad").val(1);
									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
							.append(' ')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_disability', key.id)
                                .attr('class', 'deleteDisability')
                                .attr('type', 'button')
                                .on('click', function(event) {
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result == true){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteDisability",
                                                data: {id : key.id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadDiscapacidades(idlegajo);
                                                    });
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadLicenciaExamen(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getLicenciaExamenHistory",
            data: {id : idlegajo }
        }).done(function(msg){
            var status = msg.status;
			if(status == '0'){
                $("#tblLicenciaExamen").find('tbody').empty();
				
                $.each(msg.examen, function(id,key) {	

                    $("#tblLicenciaExamen").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.lastname)
                        )
                        .append($('<td>')
                            .append(key.firstname)
                        )
                        .append($('<td>')
                            .append(key.name)
                        )
                        .append($('<td>')
                            .append((key.exam_date) ? key.exam_date.split("-").reverse().join("-") : "")
                        ) 
                        .append($('<td>')
                            .append((key.exam_from) ? key.exam_from.split("-").reverse().join("-") : "")
                        )
                        .append($('<td>')
                            .append((key.exam_to) ? key.exam_to.split("-").reverse().join("-") : "")
                        )                             					                       
						.append($('<td>')
                            .append(key.total_ability_days)
                        )
						.append($('<td>')
                            .append(key.matter)
                        )
						.append($('<td>')
                            .append(key.cathedra)
                        )
						.append($('<td>')
                            .append(key.establishment)
                        )
						.append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_exam', key.license_id)
                                .attr('class', 'editExam')
                                .attr('type', 'button')
								.on('click', function(event) {
                                    var_id = key.license_id;
									$("#apellido-le").val(key.lastname);
									$("#nombre-le").val(key.firstname);
									$("#escalafon-le").val(key.license_scale_id);
									$("#fecha-examen-le").val(key.exam_date.split("-").reverse().join("-"));
									$("#fecha-examen-desde-le").val(key.exam_from.split("-").reverse().join("-"));
									$("#fecha-examen-hasta-le").val(key.exam_to.split("-").reverse().join("-"));
									$("#total-dias-le").val(key.total_ability_days);
									$("#materia-le").val(key.matter);
									$("#catedra-le").val(key.cathedra);
									$("#nombre-establecimiento-le").val(key.establishment);
									
									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
							.append(' ')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_exam', key.license_id)
                                .attr('class', 'deleteExam')
                                .attr('type', 'button')
                                .on('click', function(event) {
									
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteLicenciaExamen",
                                                data: {id : key.license_id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadLicenciaExamen(idlegajo);
                                                    });
													$("form#formLicenciaExamen").find("input[type=text]:not([readonly]), textarea, select").each(function(){
														$(this).val('');            
													});
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadLicenciaAviso(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getLicenciaAvisoHistory",
            data: {id : idlegajo }
        }).done(function(msg){
            var status = msg.status;
			if(status == '0'){
                $("#tblLicenciaAviso").find('tbody').empty();
				
                $.each(msg.aviso, function(id,key) {	
                    $("#tblLicenciaAviso").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.lastname)
                        )
                        .append($('<td>')
                            .append(key.firstname)
                        )
                        .append($('<td>')
                            .append(key.name)
                        )
                        .append($('<td>')
                            .append((key.absent_date) ? key.absent_date.split("-").reverse().join("-") : "")
                        )                        
						.append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_aviso', key.license_id)
                                .attr('class', 'editAviso')
                                .attr('type', 'button')
								.on('click', function(event) {
                                    var_id = key.license_id;
									
									$("#apellido-la").val(key.lastname);
									$("#nombre-la").val(key.firstname);
									$("#escalafon-la").val(key.license_scale_id);
									$("#fecha-ausencia-la").val(key.absent_date.split("-").reverse().join("-"));									
									
									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
							.append(' ')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_aviso', key.license_id)
                                .attr('class', 'deleteAviso')
                                .attr('type', 'button')
                                .on('click', function(event) {
									
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteLicenciaAviso",
                                                data: {id : key.license_id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadLicenciaAviso(idlegajo);
                                                    });
													$("form#formLicenciaAviso").find("input[type=text]:not([readonly]), textarea, select").each(function(){
														$(this).val('');            
													});
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadLicenciaMedica(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getLicenciaMedicaHistory",
            data: {id : idlegajo }
        }).done(function(msg){
            var status = msg.status;
			if(status == '0'){
                $("#tblLicenciaMedica").find('tbody').empty();
				
                $.each(msg.medical, function(id,key) {	
                    $("#tblLicenciaMedica").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.agent_lastname)
                        )
                        .append($('<td>')
                            .append(key.agent_firstname)
                        )
                        .append($('<td>')
                            .append(key.name)
                        )
                        .append($('<td>')
                            .append((key.date_from) ? key.date_from.split("-").reverse().join("-") : "")
                        )    
						.append($('<td>')
                            .append(key.matter)
                        )
						.append($('<td>')
                            .append(key.domicile)
                        )
						.append($('<td>')
                            .append(key.phone)
                        )
						.append($('<td>')
                            .append(key.clinic_name)
                        )
						.append($('<td>')
                            .append(key.clinic_domicile)
                        )
						.append($('<td>')
                            .append(key.clinic_phone)
                        )
						.append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_lic_medica', key.license_id)
                                .attr('class', 'editLicMedica')
                                .attr('type', 'button')
								.on('click', function(event) {
                                    var_id = key.license_id;
									
									$("#apellido-lm").val(key.agent_lastname);
									$("#nombre-lm").val(key.agent_firstname);
									$("#escalafon-lm").val(key.license_scale_id);
									$("#fecha-licencia-lm").val(key.date_from.split("-").reverse().join("-"));									
									$("#materia-lm").val(key.matter);
									$("#domicilio-lm").val(key.domicile);
									$("#telefono-lm").val(key.phone);
									$("#nombre-centro-lm").val(key.clinic_name);
									$("#domicilio-centro-lm").val(key.clinic_domicile);
									$("#tel-centro-lm").val(key.clinic_phone);

									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
							.append(' ')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_lic_medica', key.license_id)
                                .attr('class', 'deleteLicMedica')
                                .attr('type', 'button')
                                .on('click', function(event) {
									
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteLicenciaMedica",
                                                data: {id : key.license_id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadLicenciaMedica(idlegajo);
                                                    });
													$("form#formLicenciaAviso").find("input[type=text]:not([readonly]), textarea, select").each(function(){
														$(this).val('');            
													});
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}

function loadLicenciaMedicaFamiliar(idlegajo){
    var idlegajo = idlegajo;
    if(idlegajo != null && idlegajo != ""){
        $.ajax({
            method: "POST",
            url: "/getLicenciaMedicaFamiliarHistory",
            data: {id : idlegajo }
        }).done(function(msg){
            var status = msg.status;
			if(status == '0'){
                $("#tblLicenciaMedicaFamiliar").find('tbody').empty();
				
                $.each(msg.family, function(id,key) {	
                    $("#tblLicenciaMedicaFamiliar").find('tbody')
                    .append($('<tr>')
                        .append($('<td>')
                            .append(key.agent_lastname)
                        )
                        .append($('<td>')
                            .append(key.agent_firstname)
                        )
                        .append($('<td>')
                            .append(key.name)
                        )
                        .append($('<td>')
                            .append((key.date_from) ? key.date_from.split("-").reverse().join("-") : "")
                        )    
						.append($('<td>')
                            .append(key.family_fullname)
                        )
						.append($('<td>')
                            .append(key.family_parent)
                        )
						.append($('<td>')
                            .append(key.family_domicile)
                        )
						.append($('<td>')
                            .append(key.family_phone)
                        )
						.append($('<td>')
                            .append(key.clinic_name)
                        )
						.append($('<td>')
                            .append(key.clinic_domicile)
                        )
						.append($('<td>')
                            .append(key.clinic_phone)
                        )
						.append($('<td>')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_lic_medica', key.license_id)
                                .attr('class', 'editLicMedicaFamiliar')
                                .attr('type', 'button')
								.on('click', function(event) {
                                    var_id = key.license_id;
									
									$("#apellido-lf").val(key.agent_lastname);
									$("#nombre-lf").val(key.agent_firstname);
									$("#escalafon-lf").val(key.license_scale_id);
									$("#fecha-licencia-lf").val(key.date_from.split("-").reverse().join("-"));
									$("#nombre-completo-familiar-lf").val(key.family_fullname);
									$("#relacion-lf").val(key.family_parent);
									$("#domicilio-lf").val(key.family_domicile);
									$("#telefono-familiar-lf").val(key.family_phone);
									$("#nombre-centro-lf").val(key.clinic_name);
									$("#domicilio-centro-lf").val(key.clinic_domicile);
									$("#tel-centro-lf").val(key.clinic_phone);

									return false;
                                })
								.append($('<span aria-hidden="true">')
									.attr('class', 'glyphicon glyphicon-edit')
								)
                            )
							.append(' ')
                            .append($('<button> aria-label="Left Align"')
                                .attr('id_lic_medica', key.license_id)
                                .attr('class', 'deleteLicMedicaFamiliar')
                                .attr('type', 'button')
                                .on('click', function(event) {
									
                                    bootbox.confirm("Estás seguro?", function(result) {
                                        if(result){
                                            $.ajax({
                                                method: "POST",
                                                url: "/deleteLicenciaMedicaFamiliar",
                                                data: {id : key.license_id}
                                            }).done(function(result){
                                                if(result.status == '0'){
                                                    bootbox.alert(result.response, function() {
                                                        loadLicenciaMedicaFamiliar(idlegajo);
                                                    });
													$("form#formLicenciaAviso").find("input[type=text]:not([readonly]), textarea, select").each(function(){
														$(this).val('');            
													});
                                                }
                                                else{
                                                    bootbox.alert(result.response, function() {
                                                    });
                                                }
                                            });
                                        }
                                    }); 
                                })
                                .append($('<span aria-hidden="true">')
                                    .attr('class', 'glyphicon glyphicon-remove')
                                )
                            )
                        )
                    );

                });
            }
            else{
                //alert('Error:' + msg.response);
            }
        });
    }
}