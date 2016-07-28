<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAdressTable extends Migration {

	public function up()
	{
		Schema::create('adress', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->string('type', 45);
			$table->string('street', 45);
			$table->string('number', 45);
			$table->string('floor', 45);
			$table->string('department', 45);
			$table->string('neighborhood', 255);
			$table->string('phone', 45);
			$table->integer('active');
			$table->integer('province_id')->unsigned();
			$table->integer('locality_id')->unsigned();
			$table->integer('split_id')->unsigned();
		});
	}

	public function down()
	{
		Schema::drop('adress');
	}
}