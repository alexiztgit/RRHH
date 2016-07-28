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
      ?>
      <tr>
        <td><?=$e['id']?></td>
        <td><?=$e['name']?></td>
        <td><?=$e['lastname']?></td>
        <td><?=$e['document']?></td>
        <td class="col-md-3">
        	  <button id="print" onclick="" type="button" class="btn btn-primary" aria-label="Left Align">
              <span class="glyphicon glyphicon-print" aria-hidden="true"></span> Imp
            </button>
            <button id="edit" onclick="location.href='/legajo/<?=$e['id']?>/edit';" type="button" class="btn btn-primary" aria-label="Left Align">
              <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> Editar
            </button>
            <button id="see" onclick="location.href='/legajo/<?=$e['id']?>/edit';" type="button" class="btn btn-primary" aria-label="Left Align">
              <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> Ver
            </button>
        </td>
      </tr>
      <?php
    }
    ?>
    <div class="align-center"><?php echo $empleados->links(); ?></div>
  </tbody>
</table>