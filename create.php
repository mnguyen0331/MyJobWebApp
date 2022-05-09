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


// Define constants
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


// Did data not get entered?
if ( !isset($_POST['fname']) || !isset($_POST['lname']) || !isset($_POST['email']) || !isset($_POST['phone']) || !isset($_POST['password']) ) {
	// Display an error message and exit
	echo "<p>ERROR: Fields are empty.</p>";
	exit();
}


// Make calls to the validate function and submit into database
$firstName = validateData( $_POST['fname'] );
$lastName = validateData( $_POST['lname'] );
$emailAddress = validateData( $_POST['email'] );
$phoneNumber = validateData( $_POST['phone'] );
$password = validateData( $_POST['password'] );

// Now connect to MySQL improved
// the "i" stands for improved apparently, so use this in future
// other methods of connecting are depricated
$db = new mysqli(DB_SERVER, DB_USER, DB_PWD, DB_NAME);
// some basic error checking
if ($db->connect_errno) {
	echo "Error connecting to MySQL." . $db->connect_error;
	exit();
}

// Insertion query
	$insertionQuery = "INSERT INTO user_data VALUES (?, ?, ?, ?, ?)";
// Prepared statements
$prepStatement = $db->prepare( $query );
$prepStatement->bind_param('sssss', $firstName, $lastName, $emailAddress, $phoneNumber, $password);
// Execute this query now
$prepStatement->execute();

// Check for errors
if ($prepStatement->affected_rows > 0) {
	echo "<p>Successfully created account.</p>";
} else {
	echo "<p>An error occured. Account not created.</p>";
	exit();
}

// Take a bow; clear the stage
$db->close();

?>
