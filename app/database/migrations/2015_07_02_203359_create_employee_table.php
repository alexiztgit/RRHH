<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmployeeTable extends Migration {

	public function up()
	{
		Schema::create('employee', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->string('document', 100);
			$table->string('name', 255);
			$table->string('lastname', 255);
			$table->string('rememberToken', 1);
			$table->string('cuil', 100);
			$table->date('birthdate');
			$table->string('marital_status', 100);
			$table->integer('document_type_id')->unsigned();
			$table->integer('city_id')->unsigned();
		});
	}

	public function down()
	{
		Schema::drop('employee');
	}
}