<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href = "css/navbar-style.css" rel="stylesheet">
<link href = "css/styles.css" rel="stylesheet">
<title>Project Work Management Software </title>
</head>
<body>
	<nav class="navbar">
		<h3> project </h3>
		<div class="links">
		<a href ="index.jsp">Home</a>
		<%
			if(session.getAttribute("id") != null)
			{
				%>
				<a href="profile.jsp"> Profile </a>
				<a href="logout.jsp"> Logout </a>
				<span> Welcome, <%=session.getAttribute("name") %></span>
				<a href="add_project.jsp" class="add-btn"> Add Project</a>
				<%
			}
			else
			{ %>
				<a href ="signin.jsp">Sign In</a>
				<a href ="signup.jsp">Sign Up</a>
				<%
			}
		%>
			
		
		</div>
	</nav>
</body>
</html>