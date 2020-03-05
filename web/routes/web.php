<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();



Route::prefix('admin')->group(function () {
    Route::get('/dashboard', 'Admin\DashboardController@index')->name('Dashboard');
    Route::get('/destinations', 'Admin\DestinationController@index')->name('Destinations');
    Route::get('/destinations/get', 'Admin\DestinationController@getDestinations')->name('getDestinations');
    Route::get('/destinations/create', 'Admin\DestinationController@create')->name('Destinations/Create');
});

Route::prefix('customer')->group(function () {
    Route::get('/home', 'Customer\HomeController@index')->name('home');
});
