<?php

/**
 * Project: CPSC 332-02 MyJob Project (Spring 2022)
 * 
 * File: create.php
 * Programmer: Florentino Becerra
 * Date: 05/08/2022
 * Revised: 05/09/2022
 * 
 * This script is responsible for taking user information
 * and validating and sanitizing it
 * It then proceeds to make the insertion into the database
 */


// Define constants
define("DB_SERVER", "localhost");
define("DB_USER", "myjob_user");
define("DB_PWD", "rvXTj4I7");
define("DB_NAME", "myjob");


/**  validateData
 * This function does a quick sanitization of data
 * passed through from a form
 * 
 * @return: Data that is sanitized
 */

function validateData($data) {
	$data = trim($data);
	$data = stripslashes($data);
	$data = htmlspecialchars($data);
	$data = strip_tags($data);

	return $data;
}


// Did data not get entered?
if ( !(isset($_POST['fname'])) || !(isset($_POST['lname'])) || !(isset($_POST['email'])) || !(isset($_POST['phone'])) || !(isset($_POST['password'])) ) {
	// Display an error message and exit
	echo "ERROR: Fields are empty.";
	exit();
}

// Quick validation/sanitization
$firstName = validateData($_POST['fname']);
$lastName = validateData($_POST['lname']);

// Quick sanitization and validation
$email = $_POST['email'];
$emailAddress = filter_var($email, FILTER_SANITIZE_EMAIL);
if (filter_var($emailAddress,  FILTER_VALIDATE_EMAIL)) {
	echo "Email address is valid.";
} else {
	echo "Email is invalid.";
	exit();
}

$phoneNumber = validateData($_POST['phone']);
$password = validateData($_POST['password']);
	$timestamp = date("Y-m-d H:i:s");

// Now connect to MySQL improved
$db = new mysqli(DB_SERVER, DB_USER, DB_PWD, DB_NAME);
// some basic error checking
if ($db->connect_errno) {
	echo "Error connecting to MySQL." . $db->connect_error;
	exit();
}

// Select the database
$db->select_db(DB_NAME);

// Insertion query
$insertionQuery = "INSERT INTO User (FirstName, LastName, Email, PhoneNumber, Password, timestamp) VALUES ('" . $firstName ."','" . $lastName ."','" . $emailAddress ."','" . $phoneNumber ."','" . $password ."','" . $timestamp ."')";
// Standard query function
$result = $db->query($insertionQuery);

// Check for success
if ($result) {
	header("location:registration-success.html");
}

$db->close();

?>
