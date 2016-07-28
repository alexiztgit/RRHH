<div class="row bg-info">
    <div class="col-md-3" >
        <img class="image-responsive logo-Imagen" src="{{ URL::asset('img/LogoPosadas.jpg'); }}" width="100%" >
    </div> 
    <div class="col-md-6 text-center" style="padding-top:20px; color:#175A9A">
        <h1>Sistema RRHH - Hospital Posadas</h1>
    </div>
    <div class="col-md-3 text-left" >
        <?php if (isset($currentUser)){ ?>
        <div align="right"><strong>Usuario Logueado: </strong>{{ $currentUser->username }}</div>
        <?php } ?>
        <ul class="nav nav-tabs pull-right">   
            <?php if (isset($empleado)){ ?>
            <button class="btn btn-primary" onclick="javascript:history.back(-1);">Volver</button>
            <?php } ?>
            <button class="btn btn-primary">Mi Cuenta</button>           
            <a href="/dashboard/logout"><button class="btn btn-primary">Salir</button></a>          
        </ul>
    </div>    
</div>
<div class="row">
	<ul class="nav nav-pills">
		<!-- <li role="presentation" class="{{ Request::is('structure') ? 'active' : '' }}"><a href="/structure" aria-controls="estructura">Estructura</a></li> -->
		<li role="presentation" class="{{ Request::is('actived') ? 'active' : '' }}"><a href="/actived" aria-controls="personal-medicos" >Personal Activo</a></li>
		<li role="presentation" class="{{ Request::is('retired') ? 'active' : '' }}"><a href="/retired" aria-controls="personal-inactivo" >Personal Inactivo</a></li>
		<!--<li role="presentation"><a href="/admin" target="about:_blank" aria-controls="tablas" >Tablas</a></li>
		<li role="presentation" class="{{ Request::is('legajo/new') ? 'active' : '' }}"><a href="/legajo/new" aria-controls="nuevo-legajo" >Nuevo Legajo</a></li>-->
	</ul> 
</div>
