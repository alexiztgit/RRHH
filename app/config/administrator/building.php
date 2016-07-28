<?php

/**
 * Directors model config
 */

return array(

	'title' => 'Edificios',

	'single' => 'Edificio',

	'model' => 'Building',

	/**
	 * The display columns
	 */
	'columns' => array(
		'id',
		'name' => array(
			'title' => 'Nombre'
		),
		'address' => array(
			'title' => 'Dirección'
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
		'address' => array(
			'title' => 'Dirección',
			'type' => 'text',
		)
	),
);