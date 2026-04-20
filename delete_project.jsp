<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.* , utility.DB" %>

<%
int id = Integer.parseInt(request.getParameter("cid"));

try
{
	Connection con = DB.getConnection();
	String qry = "Delete from project where id = ?";
	PreparedStatement ps = con.prepareStatement(qry);
	ps.setInt(1,id);
	int i = ps.executeUpdate();
	if(i == 1)
	{
		%>
			<script>
				alert("Project Deleted");
				window.location = "profile.jsp";
			</script>
			<%
	}
	
}
catch(Exception e)
{
	out.print(e);
}
%>