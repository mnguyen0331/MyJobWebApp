/**
 * Project: CPSC 332-02 Project
 * 
 * File: validate.js
 * Programmer: Florentino Beceerra
 * Date: 05/06/2022
 * Revised: 05/11/2022
 * 
 * This script performs client-side form validation
 * prior to the data being sent to the server for additional sanitization
 */


/**  formValidate
 * This function will be responsible for validating user input prior to submission to the server
 * 
 * @return: True if all data passes validation, false otherwise
 */

function formValidate() {
	// Declare variables
	let errorMsg = "";
	let firstName = document.getElementById("firstName");
	let lastName = document.getElementById("lastName");
	let emailAddress = document.getElementById("emailAddr");
	let phoneNumber = document.getElementById("phoneNum");
	let password = document.getElementById("pw");
	let formError = document.getElementById("errMsg");

	// Our regular expressions
	const emailExp = /^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	const phoneExp = /^\(?([0-9]{3})\)?[-.]?([0-9]{3})[-.]?([0-9]{4})$/;

	// Conditional checks
	if ((firstName.value === null) || (firstName.value === "")) {
		errorMsg = "First name cannot be blank.";
		formError.innerHTML = errorMsg;
		return false;
	}

	if ((lastName.value === null) || (lastName.value === "")) {
		errorMsg = "Last name field cannot be blank.";
		formError.innerHTML = errorMsg;
		return false;
	}

	if (!(emailExp.test(emailAddress.value))) {
		errorMsg = "Invalid email address.";
		formError.innerHTML = errorMsg;
		return false;
	}

	if (!(phoneExp.test(phoneNumber.value))) {
		errorMsg = "Invalid phone number.";
		formError.innerHTML = errorMsg;
		return false;
	}

	if (password.value.length <= 7) {
		errorMsg = "Password must be 8 or more characters.";
		formError.innerHTML = errorMsg;
		return false;
	}

}

function showAdditionalFields() {
	let employerQuestion = document.getElementById("empQuestion");
	let dataFields = document.querySelectorAll("#compName, #compEmail, #compPhone, #compAddress");

	if (employerQuestion.options[employerQuestion.selectedIndex].value === "yes") {
		document.getElementById("compName").removeAttribute("disabled");
		document.getElementById("compName").setAttribute("required", "");
		document.getElementById("compEmail").removeAttribute("disabled");
		document.getElementById("compEmail").setAttribute("required", "");
		document.getElementById("compPhone").removeAttribute("disabled");
		document.getElementById("compPhone").setAttribute("required", "");
		document.getElementById("compAddress").removeAttribute("disabled");
		document.getElementById("empRole").removeAttribute("disabled");
		document.getElementById("empRole").setAttribute("required", "");
	} else {
		document.getElementById("compName").setAttribute("disabled", "");
		document.getElementById("compName").removeAttribute("required");
		document.getElementById("compEmail").setAttribute("disabled", "");
		document.getElementById("compEmail").removeAttribute("required");
		document.getElementById("compPhone").setAttribute("disabled", "");
		document.getElementById("compPhone").removeAttribute("required");
		document.getElementById("compAddress").setAttribute("disabled", "");
		document.getElementById("empRole").setAttribute("disabled", "");
		document.getElementById("empRole").removeAttribute("required");
		document.getElementById("empRole").value = null;

		// Clear fields
		dataFields.forEach(input => {
			input.value = "";
		});
	}

}
