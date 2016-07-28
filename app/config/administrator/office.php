<?php

/**
 * Directors model config
 */

return array(

	'title' => 'Oficinas',

	'single' => 'Oficina',

	'model' => 'Office',

	/**
	 * The display columns
	 */
	'columns' => array(
		'id',
		'name'  => array(
			'title' => 'Nombre',
		),
		'country_name' => array(
			'title' => 'Edificio',
			'relationship' => 'building',
			'select' => "(:table).name"
		)
	),

	/**
	 * The filter set
	 */
	'filters' => array(
		'id',
		'name'  => array(
			'title' => 'Nombre',
		),
		'building' => array(
			'title' => 'Edificio',
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
		'building' => array(
			'title' => 'Edificio',
			'type' => 'relationship',
			'name_field' => 'name',
			'options_sort_field' => "name",
		)
	),
);