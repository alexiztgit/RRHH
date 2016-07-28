<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateForeignKeys extends Migration {

	public function up()
	{
		Schema::table('employee', function(Blueprint $table) {
			$table->foreign('document_type_id')->references('id')->on('document_type')
						->onDelete('cascade')
						->onUpdate('cascade');
		});
		Schema::table('employee', function(Blueprint $table) {
			$table->foreign('city_id')->references('id')->on('city')
						->onDelete('cascade')
						->onUpdate('cascade');
		});
		Schema::table('city', function(Blueprint $table) {
			$table->foreign('country_id')->references('id')->on('country')
						->onDelete('cascade')
						->onUpdate('cascade');
		});
		Schema::table('employee_status', function(Blueprint $table) {
			$table->foreign('status_id')->references('id')->on('status')
						->onDelete('cascade')
						->onUpdate('cascade');
		});
		Schema::table('employee_contact_type', function(Blueprint $table) {
			$table->foreign('employee_id')->references('id')->on('employee')
						->onDelete('cascade')
						->onUpdate('cascade');
		});
		Schema::table('employee_contact_type', function(Blueprint $table) {
			$table->foreign('contact_type_id')->references('id')->on('contact_type')
						->onDelete('cascade')
						->onUpdate('cascade');
		});
		Schema::table('adress', function(Blueprint $table) {
			$table->foreign('province_id')->references('id')->on('province')
						->onDelete('cascade')
						->onUpdate('cascade');
		});
		Schema::table('adress', function(Blueprint $table) {
			$table->foreign('locality_id')->references('id')->on('locality')
						->onDelete('cascade')
						->onUpdate('cascade');
		});
		Schema::table('adress', function(Blueprint $table) {
			$table->foreign('split_id')->references('id')->on('split')
						->onDelete('cascade')
						->onUpdate('cascade');
		});
		Schema::table('employee_adress', function(Blueprint $table) {
			$table->foreign('employee_id')->references('id')->on('employee')
						->onDelete('cascade')
						->onUpdate('cascade');
		});
		Schema::table('employee_adress', function(Blueprint $table) {
			$table->foreign('adress_id')->references('id')->on('adress')
						->onDelete('cascade')
						->onUpdate('cascade');
		});
	}

	public function down()
	{
		Schema::table('employee', function(Blueprint $table) {
			$table->dropForeign('employee_document_type_id_foreign');
		});
		Schema::table('employee', function(Blueprint $table) {
			$table->dropForeign('employee_city_id_foreign');
		});
		Schema::table('city', function(Blueprint $table) {
			$table->dropForeign('city_country_id_foreign');
		});
		Schema::table('employee_status', function(Blueprint $table) {
			$table->dropForeign('employee_status_status_id_foreign');
		});
		Schema::table('employee_contact_type', function(Blueprint $table) {
			$table->dropForeign('employee_contact_type_employee_id_foreign');
		});
		Schema::table('employee_contact_type', function(Blueprint $table) {
			$table->dropForeign('employee_contact_type_contact_type_id_foreign');
		});
		Schema::table('adress', function(Blueprint $table) {
			$table->dropForeign('adress_province_id_foreign');
		});
		Schema::table('adress', function(Blueprint $table) {
			$table->dropForeign('adress_locality_id_foreign');
		});
		Schema::table('adress', function(Blueprint $table) {
			$table->dropForeign('adress_split_id_foreign');
		});
		Schema::table('employee_adress', function(Blueprint $table) {
			$table->dropForeign('employee_adress_employee_id_foreign');
		});
		Schema::table('employee_adress', function(Blueprint $table) {
			$table->dropForeign('employee_adress_adress_id_foreign');
		});
	}
}