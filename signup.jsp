<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.* , utility.DB" %>

<%@ include file="navbar.jsp" %>
<% 
	String message = "";
	if(request.getMethod().equalsIgnoreCase("POST"))
	{
		String name = request.getParameter("name");
		long mobile = Long.parseLong(request.getParameter("mobile"));
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try
		{
			Connection con = DB.getConnection();
			String sql = "Insert into admin (name, mobile,email,password) Values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,name);
			ps.setLong(2,mobile);
			ps.setString(3,email);
			ps.setString(4,password);
			int i = ps.executeUpdate();
			if(i == 1)
			{
				message = "account created login to continue";
			}
			
		}
		catch (Exception e)
		{
			System.out.println(e);
			message = "Somethng Went Wrong"+e.getMessage();
		}
	}
%>
<div class="container">
	<div class="form-card">
	 <h2> Sign Up</h2> 
	  <p id="message"><%=message %></p>
	 <form action="signup.jsp" method="post" onsubmit= "formValidator(event)">
	 	<input type="text" name="name" id="name" placeholder="Enter your name">
	 	<input type="text" name="mobile" id="mobile" placeholder="Enter your mobile number">
	 	<input type="email" name="email" id="email" placeholder="Enter your email">
	 	<input type="password" name="password" id="password" placeholder="Password">
	 	<input type="password" name="password2" id="password2" placeholder="Confirm Password">
	 	<input type="submit" value="Sign Up">
	 </form>	
	
	 </div>
</div>
<script src="js/signup.js" ></script>
<%@ include file="footer.jsp" %>