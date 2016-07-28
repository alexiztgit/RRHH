<?php

/**
 * Directors model config
 */

return array(

	'title' => 'Idiomas',

	'single' => 'Idioma',

	'model' => 'Language',

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
		'name'  => array(
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