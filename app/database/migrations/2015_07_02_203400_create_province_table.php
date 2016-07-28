<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateProvinceTable extends Migration {

	public function up()
	{
		Schema::create('province', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->string('name', 200);
		});
	}

	public function down()
	{
		Schema::drop('province');
	}
}