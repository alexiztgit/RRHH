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

        <div id="header">
            <div class="container-fluid">
                <div class="row">
                	<div class="col-md-4 col-xs-4 col-sm-4 .col-md-offset-4"></div>
                    <div class="col-md-4 col-xs-4 col-sm-4 .col-md-offset-4">
                        <img class="image-responsive logo-Imagen" src="img/LogoPosadas.jpg" width="100%" height="100%">
                    </div>
                    <div class="col-md-4 col-xs-4 col-sm-4 .col-md-offset-4"></div>
                </div>
            </div>
        </div>



        <div class="row">
            <div class="col-md-4 col-md-offset-4">
           
            <h2>Login</h2>
            
            <form>
                <div class="form-group">
                    <label for="usuario">Usuario</label>
                    <input type="text" class="form-control" name="usuario">
                </div>

                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="password" class="form-control" name="password">
                </div>

                <div class="form-group">
                    <input type="submit" value="Iniciar sesión" class="btn btn-primary">
    <br>
                    <br>
                  Si usted
              no recuerda su contraseña haga <a href="#">CLICK AQUI</a>
                </div>

            </form>
            </div>
        
        </div>

      
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    {{ HTML::script('js/jquery.min.js') }}
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    {{ HTML::script('js/bootstrap.min.js') }}
    </body>

</html>