<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmployeeStatusTable extends Migration {

	public function up()
	{
		Schema::create('employee_status', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->date('from');
			$table->date('to');
			$table->integer('status_id')->unsigned();
			$table->integer('active');
		});
	}

	public function down()
	{
		Schema::drop('employee_status');
	}
}