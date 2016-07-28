<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmployeeAdressTable extends Migration {

	public function up()
	{
		Schema::create('employee_adress', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->integer('employee_id')->unsigned();
			$table->integer('adress_id')->unsigned();
		});
	}

	public function down()
	{
		Schema::drop('employee_adress');
	}
}