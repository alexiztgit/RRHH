<?php

/**
 * Directors model config
 */

return array(

	'title' => 'Tipos de Contacto',

	'single' => 'Tipo Contacto',

	'model' => 'ContactType',

	/**
	 * The display columns
	 */
	'columns' => array(
		'id',
		'name' => array(
			'title' => 'Nombre'
			),
		'type' => array(
			'title' => 'Tipo',
			'relationship' => 'type',
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
		'type' => array(
			'title' => 'Tipo',
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
		'type' => array(
			'title' => 'Tipo',
			'type' => 'relationship',
			'name_field' => 'name',
			'options_sort_field' => "name",
		)
	),
);