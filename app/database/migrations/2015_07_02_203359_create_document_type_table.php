<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateDocumentTypeTable extends Migration {

	public function up()
	{
		Schema::create('document_type', function(Blueprint $table) {
			$table->increments('id');
			$table->string('name', 200);
		});
	}

	public function down()
	{
		Schema::drop('document_type');
	}
}