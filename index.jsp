<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, utility.DB" %>
<%@ include file="navbar.jsp" %>

<%
	
	ResultSet confRs = null;
	Connection con = DB.getConnection();
	String sql = "Select * from admin order by id desc";
	PreparedStatement ps = con.prepareStatement(sql);
	confRs = ps.executeQuery();
%>
<div class="container">
	
	<%
		while(confRs.next())
		{ 
			%>
			<div class="conf-card">
				<p> <%=confRs.getString("project_text") %></p>
				<label> <%=confRs.getString("project_date") %></label>
			</div> 
		<% 
		}
		confRs.close();
	%>
</div>

<%@ include file="footer.jsp" %>