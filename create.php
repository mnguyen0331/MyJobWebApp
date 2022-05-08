<?php

/**
 * Project: CPSC 332-02 Project
 * 
 * File: create.php
 * Programmer: Florentino Becerra
 * Date: 05/06/2022
 * 
 * Description: This function handles account creations by taking user input
 * and by sanitizing the input
 * and proceeds to make an attempt to submit the information into the database
 */


// Variables for connecting to the database
define("DB_SERVER", "localhost");
define"DB_USER", "astro");
define("DB_PWD", "fvXAd9k");
define("DB_NAME", "myjob");


/**  validateData
 * This function is responsible for sanitizing all input prior to being submitted into the database
 * 
 * @return: Sanitized data
 */

function validateData($data) {
	$data = trim($data);
	$data = stripslashes($data);
	$data = strip_tags($data);
	$data = htmlspecialchars($data);

	return $data;
}


// Make calls to the validate function and submit into database
if ( isset($_POST['submit_form']) ) {
	$firstName = validateData( $_POST['fname'] );
	$lastName = validateData( $_POST['lname'] );
	$emailAddress = validateData( $_POST['email'] );
	$phoneNumber = validateData( $_POST['phone'] );
	$password = validateData( $_POST['password'] );

	// Now connect over MySQLi
	$db = new mysqli(DB_SERVER, DB_USER, DB_PWD, DB_NAME);
	// some basic error checking
	if ($db->connect_errno) {
		echo "Error connecting to MySQL." . $db->connect_error;
		exit();
	}

	// Insertion query and other information goes here
	$insertionQuery = "INSERT INTO user_data VALUES ('$firstName', '$lastName', '$emailAddress', '$phoneNumber', '$password')";
	// Get result of the query
	$result = $db->query( $insertionQuery );
	if (!$result) {
		// It failed apparently, so just quit for the time being
		exit();
	}

}

?>