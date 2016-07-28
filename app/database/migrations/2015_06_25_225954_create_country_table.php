<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCountryTable extends Migration {

	public function up()
	{
		Schema::create('country', function(Blueprint $table) {
			$table->increments('id');
			$table->string('name', 200);
		});
	}

	public function down()
	{
		Schema::drop('country');
	}
}
