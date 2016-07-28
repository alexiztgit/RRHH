<?php

/**
 * Directors model config
 */

return array(

	'title' => 'Estados de Educación',

	'single' => 'Estado de Educación',

	'model' => 'EducationStatus',

	/**
	 * The display columns
	 */
	'columns' => array(
		'id',
		'name' => array(
			'title' => 'Nombre',
		),
	),

	/**
	 * The filter set
	 */
	'filters' => array(
		'id',
		'name' => array(
			'title' => 'Nombre',
		),
	),

	/**
	 * The editable fields
	 */
	'edit_fields' => array(
		'name' => array(
			'title' => 'Nombre',
			'type' => 'text',
		),
	),
);