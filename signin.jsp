<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.* , utility.DB" %>

<%@ include file="navbar.jsp" %>
<% 
	String message = "";
	if(request.getMethod().equalsIgnoreCase("POST"))
	{
		String email = request.getParameter("email");
		String password = request.getParameter("password");	
		try
		{
			Connection con = DB.getConnection();
			String sql = "select * from admin where email = (?) and password = (?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,email);
			ps.setString(2,password);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				session.setAttribute("id",rs.getInt("id"));
				session.setAttribute("name",rs.getString("name"));
				response.sendRedirect("index.jsp");
				message = "Account login DOne";
			}
			else
			{
				message = "Invalid email or passowrd";
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
	 <h2> Sign In</h2> 
	  <p id="message"><%=message %></p>
	 <form action="signin.jsp" method="post" onsubmit= "formValidator(event)">
	 
	 	<input type="email" name="email" id="email" placeholder="Enter your email">
	 	<input type="password" name="password" id="password" placeholder="Password">
	 	<input type="submit" value="Sign In">
	 </form>	
	
	 </div>
</div>
<script src="js/signup.js" ></script>
<%@ include file="footer.jsp" %>