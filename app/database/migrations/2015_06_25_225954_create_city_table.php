<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCityTable extends Migration {

	public function up()
	{
		Schema::create('city', function(Blueprint $table) {
			$table->increments('id');
			$table->string('name', 200);
			$table->integer('country_id')->unsigned();
		});
	}

	public function down()
	{
		Schema::drop('city');
	}
}
