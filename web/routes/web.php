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
    Route::get('/destinations/edit/{slug}', 'Admin\DestinationController@edit')->name('Destinations/Edit');
    Route::post('/destinations/store', 'Admin\DestinationController@store')->name('Destinations/Store');
    Route::post('/destinations/update', 'Admin\DestinationController@update')->name('Destinations/Update');

    Route::get('/users', 'Admin\UserController@index')->name('Users');
    Route::get('/users/get', 'Admin\UserController@getUsers')->name('getUsers');
});

Route::prefix('customer')->group(function () {
    Route::get('/home', 'Customer\HomeController@index')->name('home');
    Route::get('/destinations/slug/{slug}', 'Customer\DestinationController@slug');
    Route::post('/cart-add', 'Customer\CartController@add')->name('cart.add');
    Route::get('/cart-checkout', 'Customer\CartController@cart')->name('cart.checkout');
    Route::post('/cart-clear', 'Customer\CartController@clear')->name('cart.clear');
});
