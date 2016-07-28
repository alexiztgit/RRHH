$(document).ready(function() {

    loadContacts($('#id_legajo').val());
    loadAdresses($('#id_legajo').val());
    loadFamily($('#id_legajo').val());
    loadSchedules($('#id_work_file').val());
    loadReview($('#id_work_file').val());
    loadRoles($('#id_review').val());
    loadEducation($('#id_work_file').val());
    loadCourses($('#id_work_file').val());
    loadCongresses($('#id_work_file').val());
    loadLanguages($('#id_work_file').val());
    loadItCourses($('#id_work_file').val());
    loadPublicServices($('#id_legajo').val());
	loadPrivateServices($('#id_legajo').val());
	loadCongrats($('#id_legajo').val());
	loadSanctions($('#id_legajo').val());
	loadEmbargos($('#id_legajo').val());
	loadEvaluaciones($('#id_legajo').val());
	loadCreditos($('#id_legajo').val());
	loadHistorial($('#id_legajo').val());
	loadOrquesta($('#id_legajo').val());
	loadDiscapacidades($('#id_legajo').val());
	loadAdditionalKnowledgeHistory($('#id_work_file').val());
	loadLicenciaExamen($('#id_legajo').val());
	loadLicenciaAviso($('#id_legajo').val());
	loadLicenciaMedica($('#id_legajo').val());
	loadLicenciaMedicaFamiliar($('#id_legajo').val());

    if ($("#id_legajo").val()){
        $("#contact-info").show();
        $("#address-info").show();
        $('ul#menu li').show();
    }else{
        $("#contact-info").hide();
        $("#address-info").hide();
        $('ul#menu li:not(:first)').hide();
    }
	
	$("#fecha-nacimiento").datetimepicker({
        format: 'DD-MM-YYYY',
		useCurrent: false
    });
	
	$("#hasta4, #date_afip, #fecha-acto2, #desde5, #fecha-acto4, #desde4, #vigencia, #notificacion, #desde3, #fecha3, #fecha2, #fecha-acto, #fecha-publicacion, #congress_finalization, #course_finalization, #date_in, #apto-medico, #fecha-nacimiento, #estado-desde, #estado-hasta, #fecha-cert-discapacidad, #vigencia-certificado, #vigencia-certificado-hasta, #date_from, #date_to, #in_afip, #out_afip, #role_from, #role_to, #education_start, #education_end, #desde, #hasta, #desde2, #hasta2, #desde3, #hasta3, #family_birthdate, #fecha-examen-le, #fecha-examen-desde-le, #fecha-examen-hasta-le, #fecha-ausencia-la, #fecha-licencia-lm, #fecha-licencia-lf").datetimepicker({
        format: 'DD-MM-YYYY',
		useCurrent: false
    });
	
	$("#desde3").on("dp.change", function (e) {
		$('#hasta3').data("DateTimePicker").minDate(e.date);
	});
	$("#hasta3").on("dp.change", function (e) {
		$('#desde3').data("DateTimePicker").maxDate(e.date);
	});
	
	$("#desde2").on("dp.change", function (e) {
		$('#hasta2').data("DateTimePicker").minDate(e.date);
	});
	$("#hasta2").on("dp.change", function (e) {
		$('#desde2').data("DateTimePicker").maxDate(e.date);
	});
	
	$("#education_start").on("dp.change", function (e) {
		$('#education_end').data("DateTimePicker").minDate(e.date);
	});
	$("#education_end").on("dp.change", function (e) {
		$('#education_start').data("DateTimePicker").maxDate(e.date);
	});
			
	$("#desde").on("dp.change", function (e) {
		$('#hasta').data("DateTimePicker").minDate(e.date);
	});
	$("#hasta").on("dp.change", function (e) {
		$('#desde').data("DateTimePicker").maxDate(e.date);
	});

    $("#vigencia-certificado").on("dp.change", function (e) {
        $('#vigencia-certificado-hasta').data("DateTimePicker").minDate(e.date);
    });
    $("#vigencia-certificado-hasta").on("dp.change", function (e) {
        $('#vigencia-certificado').data("DateTimePicker").maxDate(e.date);
    });
	
	$("#role_from").on("dp.change", function (e) {
		$('#role_to').data("DateTimePicker").minDate(e.date);
	});
	$("#role_to").on("dp.change", function (e) {
		$('#role_from').data("DateTimePicker").maxDate(e.date);
	});
	
	$("#in_afip").on("dp.change", function (e) {
		$('#out_afip').data("DateTimePicker").minDate(e.date);
	});
	$("#out_afip").on("dp.change", function (e) {
		$('#in_afip').data("DateTimePicker").maxDate(e.date);
	});
	
	$("#date_from").on("dp.change", function (e) {
		$('#date_to').data("DateTimePicker").minDate(e.date);
	});
	$("#date_to").on("dp.change", function (e) {
		$('#date_from').data("DateTimePicker").maxDate(e.date);
	});
	
	$("#vigencia-certificado").on("dp.change", function (e) {
		$('#vigencia-certificado-hasta').data("DateTimePicker").minDate(e.date);
	});
	$("#vigencia-certificado-hasta").on("dp.change", function (e) {
		$('#vigencia-certificado').data("DateTimePicker").maxDate(e.date);
	});	
	
	$("#estado-desde").on("dp.change", function (e) {
		$('#estado-hasta').data("DateTimePicker").minDate(e.date);
	});
	
	$("#estado-hasta").on("dp.change", function (e) {
		$('#estado-desde').data("DateTimePicker").maxDate(e.date);
	});	

	$("#fecha-examen-le").on("dp.change", function (e) {
		$('#fecha-examen-desde-le').data("DateTimePicker").minDate(e.date);
	});
	
	$("#fecha-examen-desde-le").on("dp.change", function (e) {
		$('#fecha-examen-le').data("DateTimePicker").maxDate(e.date);
	});
	
	$("#fecha-examen-desde-le").on("dp.change", function (e) {
		$('#fecha-examen-hasta-le').data("DateTimePicker").minDate(e.date);
		
		if ($("#fecha-examen-hasta-le").val() < $("#fecha-examen-desde-le").val())
			$("#fecha-examen-hasta-le").val($("#fecha-examen-desde-le").val());
	});
	
	$("#fecha-examen-hasta-le").on("dp.change", function (e) {
		$('#fecha-examen-desde-le').data("DateTimePicker").maxDate(e.date);
	});
	
	$('input[type=file]').bootstrapFileInput();

    $("#numero_tel").mask("99-999-99999999")
	$("#fecha-cert-discapacidad, #vigencia-certificado, #vigencia-certificado-hasta").mask('99/99/9999');

    $("#cuil").mask('00-00000000-0');

    $("select#family_disability option").eq(1).prop('selected', true);
    $("select#family_garden option").eq(1).prop('selected', true);

    $("#education_actually").click(function(){
        if ($(this).is(":checked")){
            $("#education_end").val('');
            $("#education_end").prop("disabled", true);
            $("#education_end").removeClass("error");            
        }
        else{
            $("#education_end").prop("disabled", false);
            $("#education_end").addClass("error");
        }
    })

    $("#course_actually").click(function(){
        if ($(this).is(":checked")){
            $("#course_finalization").val('');
            $("#course_finalization").prop("disabled", true);
            $("#course_finalization").removeClass("error");            
        }
        else{
            $("#course_finalization").prop("disabled", false);
            $("#course_finalization").addClass("error");
        }
    })

    $("#congress_actually").click(function(){
        if ($(this).is(":checked")){
            $("#congress_finalization").val('');
            $("#congress_finalization").prop("disabled", true);
            $("#congress_finalization").removeClass("error");            
        }
        else{
            $("#congress_finalization").prop("disabled", false);
            $("#congress_finalization").addClass("error");
        }
    })

    $("#numero-expediente").mask("9999/99");
    $("#ano, #ano2").mask("9999");

    $("#monto").priceFormat({
        prefix: '$',
        thousandsSeparator: '.',
        centsSeparator: ','
    })
	
	jQuery.validator.addMethod("accept", function(value, element, param) {
	  return value.match(new RegExp("." + param + "$"));
	});

    jQuery.validator.addMethod("greaterThan", function(value, element, params) {

        var date = value.split("-").reverse().join("-");
        var bithdate = $(params).val().split("-").reverse().join("-");



        if (!/Invalid|NaN/.test(new Date(date))) {
            return new Date(date) > new Date(bithdate);
        }

        return isNaN(date) && isNaN(bithdate) 
            || (Number(date) > Number(bithdate)); 
    },'Debe ser mayor a fecha de nacimiento.');

    jQuery.validator.addMethod('check_date_of_birth', function(value, element) {
        var birth = value.split("-");
        var age =  14;
     
        var mydate = new Date();
        mydate.setFullYear(birth[2], birth[1], birth[0]);
     
        var currdate = new Date();
        currdate.setFullYear(currdate.getFullYear() - age);

        return (currdate - mydate < 0 ? false : true);
    });

    jQuery.validator.addMethod('check_cuil', function(value) {
        return (value.match(/^\d{2}\-\d{8}\-\d{1}$/) ? true : false);
    });


    $("form#formPersonal").validate({
        rules: {
            lastname: {
                required: true,
				accept: "[a-zA-Z]+"
            },
            name: {
                required: true,
				accept: "[a-zA-Z]+"
            },
            cuil: {
                required: true,
                //check_cuil: true,
                remote: {
                    url: "/checkCUIL",
                    type: "post",
                    data: {
                        cuil: function () {
                            return $("#cuil").val();
                        }
                    }
                }
            },
            document_type: {
                required: true,
                min: 1
            },
            'document': {
                required: true,
				accept: "[0-9]+",
				remote: {
					url: "/checkDocument",
					type: "post",
					data: {
						id_legajo: function () {
							return $("#id_legajo").val();
						}, 
						document: function () {
							return $("#document").val();
						}
					}
				}				
            },
            country: {
                required: true,
                min: 1
            },
            'fecha-nacimiento': {
                required: true,
                check_date_of_birth: true
            },
            city: {
                required: true,
                min: 1
            },
            status: {
                required: true,
                min: 1
            }/*,
            'estado-desde': {
                greaterThan: "#fecha-nacimiento"
            },
            'estado-hasta': {
                greaterThan: "#estado-desde"
            }*/
        },
        messages: {
            lastname: {
				required: "",
				accept:"Solo Letras"
			},
            name: {
				required: "",
				accept:"Solo Letras"
			},
            cuil: {
                required: "",
                remote: "No válido"
            },
            document_type: "",
            'document': {
				required:"",
				accept: "Solo números",
				remote: "El empleado ya existe"
			},
            country: "",
            'fecha-nacimiento': {
                required: "",
                check_date_of_birth: "Debe ser mayor de edad"
            },
            city: "",
            status: "",
            'estado-desde': {
                required: "",
                greaterThan: "Debe ser mayor a fecha de nacimiento"
            }
        }
    })
    
	$("form#medical-info").validate({
		rules: {
			'numero-carnet': {
				required: true,
				accept: "[a-zA-Z0-9]+"
			},
			/*'tipo-sangre':{
				required: true
			},
			// 'legajo-medico': {
			// 	required: true
			// },*/
			'apto-medico': {
				required: true,
				greaterThan: "#fecha-nacimiento"
			},
			/*'obra-social': {
				min: 1
			},
			'art': {
				min: 1
			},
			'prepaga': {
				min: 1
			},*/
			'tipo-discapacidad': {
				min: function () {
					return ($("select#discapacidad").val() == 1) ? 1 : 0;
				}
			},
			'certificado-discapacidad': {
				required: function () {
					return $("select#discapacidad").val() == 1;
				}
			},
			'fecha-cert-discapacidad': {
				required: function () {
					return $("select#discapacidad").val() == 1;
				},
                greaterThan: "#fecha-nacimiento"
			},
			'vigencia-certificado': {
				required: function () {
					return $("select#discapacidad").val() == 1;
				}
			},
			'vigencia-certificado-hasta': {
				required: function () {
					return $("select#discapacidad").val() == 1;
				}
			},
			'entidad-certificado': {
				required: function () {
					return $("select#discapacidad").val() == 1;
				}
			}
		},
		messages: {
			'numero-carnet': "",
			'tipo-sangre': "",
			// 'legajo-medico': "",
			'apto-medico': {
				required: "Requerido",
				greaterThan: "Debe ser mayor a fecha de nacimiento"
			},
			'obra-social': "",
			'art': "",
			'prepaga': "",
			'tipo-discapacidad': "",
			'certificado-discapacidad': "",
			'fecha-cert-discapacidad': {
                required: "Requerido",
                greaterThan: "Debe ser mayor a fecha de nacimiento"
            },
			'vigencia-certificado': "",
			'vigencia-certificado-hasta': "",
			'entidad-certificado': ""					
		}
	});

    $("form#formContactPhone").validate({
        rules:{
            numero_tel: {
                required: function () {
                    return $("select#tipo_telefono").val() != 0;
                }
            },
            tipo_telefono: {
                min: 1
            }
        },
        messages: {
            numero_tel: {
                required: "Requerido",
                number: "Solo números"
            },
            tipo_telefono: ""
            
        }
    })

    $("form#formEmail").validate({
        rules:{
            email: {
                required: function () {
                    return $("select#tipo_email").val() != 0;
                },
                email: true
            },
            tipo_email: {
                min: 1
            }
        },
        messages: {
            email: {
                required: "Requerido",
                email: "Correo incorrecto"
            },
            tipo_email: ""
            
        }
    })

    $("form#formAddress").validate({
        rules:{
			tipo_direccion: {
				required: true
			},
            calle: {
                required: true
            },
            numero: {
                required: true,
				number: true
            },
            /*piso: {
                required: true,
				number: true
            },
            departamento: {
                required: true
            },*/
            'codigo-postal': {
                required: true
            },
            province: {
				required: true,
                min: 1
            },
            locality: {
				required: true,
                min: 1
            },
            split: {
				required: true,
                min: 1
            },
            barrio: {
                required: true
            },
            'telefono-direccion': {
                required: true
            }
        },
        messages: {
			tipo_direccion: "",
            calle: "",
            numero: "",
            /*piso: "",
            departamento: "",*/
            'codigo-postal': "",
            province: "",
            locality: "",
            split: "",
            barrio: "",
            'telefono-direccion': ""
        }
    })


    $("form#formLaboral").validate({
        rules:{
            job_status: {
				required: true,
                min: 1
            },
            date_in: "required",
			have_additionals: {
				required: true
			},
            additional: {
				required: true,
                min: function () {
					return ($("select#have_additionals").val() == 1) ? 1 : 0;
				}
            },
            supplement: {
				required: true,
                min: function () {
					return ($("select#have_additionals").val() == 1) ? 1 : 0;
				}
            },
            area: {
				required: true,
                min: 1
            },
            building: {
				required: true,
                min: 1
            },
            office: {
				required: true,
                min: 1
            },
            hour_from: "required",
            hour_to: "required",
            date_from: "required"
        },
        messages: {
            job_status: "",
            date_in: "",
			have_additionals: "",
            additional: "",
            supplement: "",
            area: "",
            building: "",
            office: "",
            hour_from: "",
            hour_to: "",
            date_from: "" 
        }

    })

    $("form#formRevista").validate({
        rules: {
            scales: {
                min: 1
            },
            groupings: {
                required: true,
                min: 1
            },            
            grado:  {
                required: true
            },            
            Tramo: {
                required: true
            },            
            stretchs: {
                min: 1
            },            
            categories:  {
                min: 1
            },            
            'funcion-ejecutiva':  {
                required: true
            },
            in_afip: "required",
            agrupamiento:  {
                required: true,
                min: 1
            },
            /*out_afip: "required",*/
            date_afip: "required"
        },
        messages: {
            scales: "",
            groupings: "",            
            grado: "",            
            Tramo: "",            
            stretchs: "",            
            categories: "",            
            'funcion-ejecutiva': "",
            in_afip: "",
            out_afip: "",
            date_afip: ""
        }
    })


    $("form#formRoles").validate({
        rules: {
            roles: {
                min: 1
            },
            role_description: "required",
            role_from: "required"
            /*role_to: "required"*/
        },
        messages: {
            roles: "",
            role_description: "",
            role_from: "",
            role_to: ""
        }
    })


    $("form#formServPublicos").validate({
        rules: {
            'organismo-publico': "required",
            'situacion-revista': {
                required: true,
                min: 1
            },
            'acto-administrativo':{
                required: true,
                min:1
            },
            motivo: "required",
            destino: "required",
            desde: "required",
            'numero-acto': {
                required: true,
                number: true,
                maxlength: 5
            },
            institucion: {
                min: 1
            },
            'fecha-acto': "required"
        },
        messages: {
            'organismo-publico': "",
            'situacion-revista': "",
            motivo: "",
            destino: "",
            desde: "",
            hasta: "",
            'numero-acto': "",
            institución: "",
            'fecha-acto': ""
        }
    })

    $("form#formServPrivados").validate({
        rules: {
            institucionPriv: "required",
            'domicilio-legal': "required",
            cargo: "required",
            desde2: "required",
            'causa-egreso': "required",
            remunerado: {
                required:true,
                min: 1
            }
        },
        messages: {
            institucionPriv: "",
            'domicilio-legal': "",
            cargo: "",
            desde2: "",
            hasta2: "",
            'causa-egreso': ""
        }
    })

    $("form#formMenciones").validate({
        rules: {
            jurisdiccion: "required",
            organismo2: "required",
            concepto: "required",
            motivo1: "required",
            'numero-acto': "required",
            fecha: "required"
        },
        messages: {
            jurisdiccion: "",
            organismo2: "",
            concepto: "",
            motivo1: "",
            'numero-acto': "",
            fecha: ""
        }
    })

    $("form#formSanciones").validate({
        rules: {
            organismo3: "required",
            'numero-acto3': "required",
            fecha3: "required",
            'medida-disciplinaria': "required",
            motivo3: "required",
            'acto-administrativo1': {
                required:true,
                min:1
            },
            'medida-disciplinaria': {
                required: true,
                min:1
            },
            desde3: "required",
            hasta3: "required"
        },
        messages: {
            organismo3: "",
            'numero-acto3': "",
            fecha3: "",
            'medida-disciplinaria': "",
            motivo3: "",
            desde3: "",
            hasta3: ""
        }
    })
    
    $("form#formEmbargos").validate({
        rules: {
            'numero-expediente': "required",
            hasta4: "required",
            fuero: "required",
            juzgado: "required",
            secretaria: "required",
            autos: "required",
            monto: "required",
            trabajado:  "required",
            levantado: "required"
        },
        messages: {
            'numero-expediente': "",
            hasta4: "",
            fuero: "",
            juzgado: "",
            secretaria: "",
            autos: "",
            monto: "",
            trabajado:  "",
            levantado: ""
        }
    })

    $("form#formEvaluacion").validate({
        rules: {
            ano: {
                required: true,
                number: true,
				maxlength: 4,
				max: (new Date).getFullYear()
            },
            calificacion: {
                required: true,
                number: true
            },
            notificacion: "required"

        },
        messages: {
            ano: {
                required: "Requerido",
                number: "El año no es válido",
				max: "El valor supera el año actual",
				maxlength: "El año no es válido"
            },
            calificacion: {
                required: "Requerido",
                number: "Solo números"
            },
            notificacion: "",
            observaciones: ""
        }
    })

    $("form#formCapacitacion").validate({
        rules: {
            ano2: {
                required: true,
                number: true,
				max: (new Date).getFullYear(),
				maxlength: 4
            },
            cantidad: {
                required: true,
                number: true
            },
            total: {
                required: true,
                number: true
            },
            vigencia: "required",
            observaciones2: "required"
        },
        messages: {
            ano2: {
                required: "Requerido",
                number: "El año no es válido",
				max: "El valor supera el año actual",
				maxlength: "El año no es válido"
            },
            cantidad: {
                required: "Requerido",
                number: "Solo números"
            },
            total: {
                required: "Requerido",
                number: "Solo números"
            },
            vigencia: "",
            observaciones2: ""
        }
    })

    $("form#formHistoriaCarrera").validate({
        rules: {
            'numero-acto4': "required",
            'fecha-acto4': "required",
            desde4: "required",
            motivo4: "required",
			tramo4: {
				required: true,
				min: 1
			},
			agrupamiento3: {
				required: true,
				min: 1
			},
			'acto-administrativo4': {
				required: true,
				min: 1
			},
            escalafon: {
                required: true,
                min: 1
            }
        },
        messages: {
            'numero-acto4': "",
            'fecha-acto4': "",
            desde4: "",
            motivo4: "",
			agrupamiento3: "",
			tramo4: "",
			'acto-administrativo4': "",
            escalafon: ""

        }
    })

    $("form#formExtracurricular").validate({
        rules: {
            'numero-acto3': "required",
            'fecha-acto2': "required",
            desde5: "required",
            motivo4: "required"
        },
        messages: {
            'numero-acto3': "",
            'fecha-acto2': "",
            desde5: "",
            motivo4: ""
        }
    })

    $("form#formEducacion").validate({
        rules: {
            titulo: "required",
            countries: {
                required: true,
                min: 1
            },
            institutions: {
                required: true,
                min: 1
            },
            education_level: {
                min: 1
            },
            education_start: "required",
            education_end: {
                required: function () {
                    return !$("#education_actually").is(":checked");
                }
            },
            education_status: {
                min: 1
            }
        },
        messages: {
            titulo: "",
            countries: "",
            institutions: "",
            education_level: "",
            education_start: "",
            education_end: "",
            education_status: ""
        }
    })

    $("form#formCursos").validate({
        rules: {
            course_institution: "required",
            course_certificate: "required",
            course_finalization: {
                required: function () {
                    return !$("#course_actually").is(":checked");
                }
            }
        },
        messages: {
            course_institution: "",
            course_certificate: "",
            course_finalization: ""
        }
    })

    $("form#formCongresos").validate({
        rules: {
            congress_title: "required",
            congress_specialization: "required",
            congress_certificado: "required",
            congress_finalization: {
                required: function () {
                    return !$("#congress_actually").is(":checked");
                }
            }
        },
        messages: {
            congress_title: "",
            congress_specialization: "",
            congress_certificado: "",
            congress_finalization: ""
        }
    })


    $("form#formIdiomas").validate({
        rules: {
            language: {
                min: 1
            }
        },
        messages: {
            language: ""
        }
    })

    $("form#formInformatica").validate({
        rules: {
            it_area: {
                required: true,
                min: 1
            },
            it_level: {
                required: true,
                min: 1
            }
        },
        messages: {
            it_area: "",
            it_level:""
        }
    })


    $("form#formConocimientosAdicionales").validate({
        rules: {
            'nombre-publicacion': {
                required: "#tiene-publicacion:checked"
            },
            'fecha-publicacion': {
                required: "#tiene-publicacion:checked"
            },  
            'especialidad-materia': {
                required: "#docencia:checked"
            },
            institucion: {
                required: "#docencia:checked"
            }
        },
        messages: {
            'nombre-publicacion': "",
            'fecha-publicacion': "",  
            'especialidad-materia': "",
            institucion: ""
        }
    })

    $("form#formGrupoFamiliar").validate({
        rules: {
            parentesco: {
                min: 1
            },
            family_lastname: {
				required: true,
				accept: "[a-zA-Z]+"
			},
            family_name: {
				required: true,
				accept: "[a-zA-Z]+"
			},
            family_dni: {
                required: true,
                number: true
            },
            family_birthdate:{                
                required: true
            },
            family_disability_type: {
                min: function () {
					return ($("select#family_disability").val() == 1) ? 1 : 0;
				}
            }
        },
        messages: {
            parentesco: "",
            family_lastname: {
				required: "",
				accept:"Solo Letras"
			},
            family_name: {
				required: "",
				accept:"Solo Letras"
			},
            family_dni: "",
            family_birthdate:"",
            family_disability_type: ""
        }
    })
	
	$("form#formLicenciaExamen").validate({
        rules: {
            'apellido-le': "required",
            'nombre-le': "required",
            'escalafon-le': {
				required: true,
                min: 1
            },    
			'fecha-examen-le': "required",
			'fecha-examen-desde-le': "required",
			'fecha-examen-hasta-le': "required",
			'total-dias-le': {
				required: true,
				number: true
			},
			'materia-le': "required",
			'catedra-le': "required",
			'nombre-establecimiento-le': "required"
        },
        messages: {
            'apellido-le': "",
            'nombre-le': "",
            'escalafon-le': "",    
			'fecha-examen-le': "",
			'fecha-examen-desde-le': "",
			'fecha-examen-hasta-le': "",
			'total-dias-le': "Número",
			'materia-le': "",
			'catedra-le': "",
			'nombre-establecimiento-le': ""
        }
    })
	
	$("form#formAusencia").validate({
        rules: {
            'apellido-la': "required",
            'nombre-la': "required",
            'escalafon-la': {
				required: true,
                min: 1
            },    
			'fecha-ausencia-la': "required"
        },
        messages: {
            'apellido-la': "",
            'nombre-la': "",
            'escalafon-la': "",    
			'fecha-ausencia-la': ""
        }
    })
	
	$("form#formLicenciaMedica").validate({
        rules: {
            'apellido-lm': "required",
            'nombre-lm': "required",
            'escalafon-lm': {
				required: true,
                min: 1
            },    
			'fecha-licencia-lm': "required",
			'materia-lm': "required",
			'domicilio-lm': "required",
			'telefono-lm': "required",			
			'nombre-centro-lm': "required",
			'domicilio-centro-lm': "required",
			'tel-centro-lm': "required"
        },
        messages: {
            'apellido-lm': "",
            'nombre-lm': "",
            'escalafon-lm': "",    
			'fecha-licencia-lm': "",
			'materia-lm': "",
			'domicilio-lm': "",
			'telefono-lm': "",			
			'nombre-centro-lm': "",
			'domicilio-centro-lm': "",
			'tel-centro-lm': ""
        }
    })
	
	$("form#formLicenciaMedicaFamiliar").validate({
        rules: {
            'apellido-lf': "required",
            'nombre-lf': "required",
            'escalafon-lf': {
				required: true,
                min: 1
            },    
			'fecha-licencia-lf': "required",
			'nombre-completo-familiar-lf': "required",
			'relacion-lf': "required",
			'domicilio-lf': "required",
			'telefono-familiar-lf': "required",
			'nombre-centro-lf': "required",
			'domicilio-centro-lf': "required",
			'tel-centro-lf': "required"
        },
        messages: {
            'apellido-lf': "",
            'nombre-lf': "",
            'escalafon-lf': "",    
			'fecha-licencia-lf': "",
			'nombre-completo-familiar-lf': "",
			'relacion-lf': "",
			'domicilio-lf': "",
			'telefono-familiar-lf': "",
			'nombre-centro-lf': "",
			'domicilio-centro-lf': "",
			'tel-centro-lf': ""
        }
    })

});