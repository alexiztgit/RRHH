<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmployeeContactTypeTable extends Migration {

	public function up()
	{
		Schema::create('employee_contact_type', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->integer('employee_id')->unsigned();
			$table->integer('contact_type_id')->unsigned();
			$table->string('value', 255);
			$table->integer('active');
		});
	}

	public function down()
	{
		Schema::drop('employee_contact_type');
	}
}