<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.* , java.time.LocalDate , utility.DB" %>
<%@ include file="navbar.jsp" %>
<%
int id = Integer.parseInt(request.getParameter("cid"));
ResultSet rs = null;

try
{
	Connection con = DB.getConnection();
	String sql = "select * from project where id = ?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1,id);
	rs = ps.executeQuery();
	rs.next();
	
}
catch(Exception e)
{
	System.out.println(e);	
}
%>
<div class="container">
	<div  class ="form-card">
		<h2> Update your Confession</h2>

		<form action = "update_project.jsp" method="post">
			<input type="hidden" name = "id" value="<%=rs.getInt("id") %>">
			<textarea rows="10" name="project" required><%=rs.getString("project_text")%></textarea>
			<input type="submit" value = "Update">
		</form>
	</div>
</div>

<%@ include file="footer.jsp" %>