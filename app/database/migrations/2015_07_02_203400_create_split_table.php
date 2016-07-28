<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSplitTable extends Migration {

	public function up()
	{
		Schema::create('split', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->string('name', 200);
		});
	}

	public function down()
	{
		Schema::drop('split');
	}
}