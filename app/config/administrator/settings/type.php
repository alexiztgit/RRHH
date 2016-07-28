<?php

/**
 * Directors model config
 */

return array(

	'title' => 'Disabilities',

	'single' => 'Disability',

	'model' => 'DisabilityType',

	/**
	 * The display columns
	 */
	'columns' => array(
		'id',
		'name' => array(
			'title' => 'Name',
		),
	),

	/**
	 * The filter set
	 */
	'filters' => array(
		'id',
		'name',
	),

	/**
	 * The editable fields
	 */
	'edit_fields' => array(
		'name' => array(
			'title' => 'Name',
			'type' => 'text',
		),
	),
);