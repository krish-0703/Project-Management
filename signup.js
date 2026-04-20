function formValidator(e)
{
	let name = document.getElementById("name").value;
	let mobile = document.getElementById("mobile").value;
	let msg = document.getElementById("message");
	let password = document.getElementById("password").value;
	let password2 = document.getElementById("password2").value;
	let email = document.getElementById("email").value.trim();
	const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
	
	let message = "";
	let error = false;
	
	if(name == "")
	{
		message += "name is required";
		error = true;
	}
	
	if(mobile == "")
	{ message += "<br>mobile number is required";
		error = true;
	}
	else if(isNaN(mobile) || mobile.length != 10)
	{
		message += "<br> Mobile number is required"
		error = true;
	}
	if(email == "" || emailRegex.test(email) == false)
	{
		message += "<br>Email must be proper";
		error = true;
	}
	if( password == "" || password != password2)
	{
		message += "<br>passoword of both the fields are not same";
		error = true;
	}
	if(error == true)
	{
		e.preventDefault();
		msg.innerHTML = message;
		msg.style.color = 'red';		
	}
				
}