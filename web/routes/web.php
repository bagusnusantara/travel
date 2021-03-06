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
Route::get('/', 'Customer\HomeController@guest')->name('guest');
Route::get('/home', function () {
    return redirect('customer/home');
});
Auth::routes();



Route::prefix('admin')->group(function () {
    Route::get('/dashboard', 'Admin\DashboardController@index')->name('Dashboard');
    //destination
    Route::get('/destinations', 'Admin\DestinationController@index')->name('Destinations');
    Route::get('/destinations/get', 'Admin\DestinationController@getDestinations')->name('getDestinations');
    Route::get('/destinations/create', 'Admin\DestinationController@create')->name('Destinations/Create');
    Route::get('/destinations/edit/{slug}', 'Admin\DestinationController@edit')->name('Destinations/Edit');
    Route::post('/destinations/store', 'Admin\DestinationController@store')->name('Destinations/Store');
    Route::post('/destinations/update', 'Admin\DestinationController@update')->name('Destinations/Update');
    //user
    Route::get('/users', 'Admin\UserController@index')->name('Users');
    Route::get('/users/get', 'Admin\UserController@getUsers')->name('getUsers');
    Route::get('/users/edit/{id}', 'Admin\UserController@edit')->name('Users/Edit');
    Route::post('/users/update', 'Admin\UserController@update')->name('Users/Update');
    //payments
    Route::get('/payments', 'Admin\PaymentController@index')->name('Payments');
    Route::get('/payments/show/{invoice_number}', 'Admin\PaymentController@show')->name('showPayments');
    Route::get('/payments/get', 'Admin\PaymentController@getPayments')->name('getPayments');
    Route::get('/payments/edit/{id}', 'Admin\PaymentController@edit')->name('Payments/Edit');
    Route::post('/payments/update', 'Admin\PaymentController@update')->name('Payments/Update');
});

Route::prefix('customer')->group(function () {
    Route::get('/my-profile', 'Customer\ProfileController@index')->name('profile');
    Route::get('/my-tickets', 'Customer\TicketController@index')->name('tickets');
    Route::get('/my-tickets/show/{invoice_number}', 'Customer\TicketController@show')->name('showTickets');
    Route::get('/home', 'Customer\HomeController@index')->name('home');
    Route::get('/destinations/slug/{slug}', 'Customer\DestinationController@slug');
    Route::get('/destinations/search/', 'Customer\DestinationController@search');
    Route::post('/cart-add', 'Customer\CartController@add')->name('cart.add');
    Route::get('/cart-checkout', 'Customer\CartController@cart')->name('cart.checkout');
    Route::post('/cart-clear', 'Customer\CartController@clear')->name('cart.clear');
    Route::post('/cart-payment', 'Customer\CartController@payment')->name('cart.payment');
    Route::get('/destinations', 'Customer\DestinationController@index')->name('destinations');
});
Route::get('/about', function () {
    return view('customer.home.about');
});
Route::get('/contact', function () {
    return view('customer.home.contact');
});
Route::get('/ticket', function () {
    return view('customer.tickets.index');
});
