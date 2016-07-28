<?php

/**
 * Directors model config
 */

return array(

	'title' => 'Ciudades',

	'single' => 'Ciudad',

	'model' => 'City',

	/**
	 * The display columns
	 */
	'columns' => array(
		'id',
		'name' => array(
			'title' => 'Nombre'
			),
		'country_name' => array(
			'title' => 'Pais',
			'relationship' => 'country',
			'select' => "(:table).name"
		)
	),

	/**
	 * The filter set
	 */
	'filters' => array(
		'id',
		'name' => array(
			'title' => 'Nombre'
			),
		'country' => array(
			'title' => 'Pais',
			'type' => 'relationship',
			'name_field' => 'name',
			'options_sort_field' => "name",
		)
	),


	/**
	 * The editable fields
	 */
	'edit_fields' => array(
		'name' => array(
			'title' => 'Nombre',
			'type' => 'text',
		),
		'country' => array(
			'title' => 'Pais',
			'type' => 'relationship',
			'name_field' => 'name',
			'options_sort_field' => "name",
		)
	),
);