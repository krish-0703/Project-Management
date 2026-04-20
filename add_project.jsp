<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.* , java.time.LocalDate , utility.DB" %>
<%@ include file="navbar.jsp" %>
<%
	String message = "";
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		try
		{
			String project_text = request.getParameter("project");
			String today  = LocalDate.now().toString();
			int userId = (int)session.getAttribute("id");
			
			Connection con = DB.getConnection();
			String qry = "insert into project(project_text , project_date , user_id,project_deadline) Values(?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(qry);
			ps.setString(1,project_text);
			ps.setString(2,today);
			ps.setInt(3,userId);
			
			int i = ps.executeUpdate();
			if(i == 1)
			{
				message = "Project Added";
			}
			con.close();
			ps.close();
			
		}
		catch (Exception e)
		{
			System.out.println(e);
			message = "Project not added";
		}
	}
%>
<div class="container">
	<div  class ="form-card">
		<h2> Add Your Project Details</h2>
		<p><%=message %></p>
		<form action = "add_project.jsp" method="post">
			<textarea rows="10" name="project" required></textarea>
			<input type="submit" value = "Add">
		</form>
	</div>
</div>

<%@ include file="footer.jsp" %>