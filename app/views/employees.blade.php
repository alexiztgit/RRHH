<!DOCTYPE html>
<html lang="en">
<head>
  <title>Empleados</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  
  <p>
    <h2>Empleados</h2>    
    <button id="new" onclick="location.href='/legajo/new';" type="button" class="btn btn-primary" aria-label="Left Align">
      <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span> Nuevo
    </button>
  </p>        
  <hr>
  <table class="table table-hover">
    <thead>
      <tr>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Documento de Identidad</th>
        <th>Opciones</th>
      </tr>
    </thead>
    <tbody>
      <?php
      foreach ($empleados as $e) {
        ?>
        <tr>
          <td><?=$e['name']?></td>
          <td><?=$e['lastname']?></td>
          <td><?=$e['document']?></td>
          <td>
              <button id="edit" onclick="location.href='/legajo/<?=$e['id']?>/edit';" type="button" class="btn btn-primary" aria-label="Left Align">
                <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Editar
              </button>
          </td>
        </tr>
        <?php
      }
      ?>

      <div class="align-left"><?php echo $empleados->links(); ?></div>
    </tbody>
  </table>
</div>

</body>
</html>