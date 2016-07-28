<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateContactTypeTable extends Migration {

	public function up()
	{
		Schema::create('contact_type', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->string('name', 200);
		});
	}

	public function down()
	{
		Schema::drop('contact_type');
	}
}