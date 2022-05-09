<?php

// Define constants
define("DB_SERVER", "localhost");
define("DB_USER", "myjob_user");
define("DB_PWD", "rvXTj4I7");
define("DB_NAME", "myjob");


// Did data not get entered?
if ( !(isset($_POST['fname'])) || !(isset($_POST['lname'])) || !(isset($_POST['email'])) || !(isset($_POST['phone'])) || !(isset($_POST['password'])) ) {
	// Display an error message and exit
	echo "ERROR: Fields are empty.";
	exit();
}

$firstName = $_POST['fname'];
$lastName = $_POST['lname'];
$emailAddress = $_POST['email'];
$phoneNumber = $_POST['phone'];
$password = $_POST['password'];
	$timestamp = date("Y-m-d H:i:s");

// Now connect to MySQL improved
$db = new mysqli(DB_SERVER, DB_USER, DB_PWD, DB_NAME);
// some basic error checking
if ($db->connect_errno) {
	echo "Error connecting to MySQL." . $db->connect_error;
	exit();
}

// Maybe make a selection of database?
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
