/**
 * Project: CPSC 332-02 Project
 * 
 * File: validate.js
 * Programmer: Florentino Beceerra
 * Date: 05/06/2022
 * Revised: 05/15/2022
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
	let emailAddress = document.getElementById("emailAddr");
	let compEmail = document.getElementById("compEmail");
	let phoneNumber = document.getElementById("phoneNum");
	let compPhone = document.getElementById("compPhone");
	let password = document.getElementById("pw");
	let formError = document.getElementById("errMsg");

	// Our regular expressions
	const emailExp = /^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	const phoneExp = /^\(?([0-9]{3})\)?[-.]?([0-9]{3})[-.]?([0-9]{4})$/;

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

	if (!(emailExp.test(compEmail.value))) {
		errorMsg = "Invalid email address.";
		formError.innerHTML = errorMsg;
		return false;
	}

	if (!(phoneExp.test(compPhone.value))) {
		errorMsg = "Invalid phone number.";
		formError.innerHTML = errorMsg;
		return false;
	} else {
		errorMsg = "";
		formError.innerHTML = errorMsg;
		return true;
	}

}


/**  showAdditionalFields
 * This function takes actions on showing or hiding
 * the additional fields for the account creation form
 * 
 * @return: void
 */

function showAdditionalFields() {
	let employerQuestion = document.getElementById("empQuestion");
	const dataFields = document.querySelectorAll("#compName, #compEmail, #compPhone, #compAddress");

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
