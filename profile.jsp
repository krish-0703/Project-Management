<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.* , utility.DB" %>
<%@ include file="navbar.jsp" %>

<%
	int id = (int)session.getAttribute("id");
	ResultSet rs = null;
	ResultSet confRs = null;
	try
	{
		Connection con = DB.getConnection();
		String qry = "Select * from admin where id=?";
		
		PreparedStatement ps = con.prepareStatement(qry);
		ps.setInt(1,id);
		rs = ps.executeQuery();
		rs.next();
		
		qry = "select * from project where user_id=? order by id desc";
		ps = con.prepareStatement(qry);
		ps.setInt(1,id);
		confRs = ps.executeQuery();
		
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>

<div class="container">
	<div class ="container-flex"> 
		<div class="profile-left">
				<h1>Your Profile</h1>
				<p> <strong> Name: </strong> <%=rs.getString("name") %></p>
				<p> <strong> Mobile: </strong> <%=rs.getString("mobile") %></p>
				<p> <strong> Email: </strong> <%=rs.getString("email") %></p>
		</div>
		<div class="profile-right"> 
					<%
				while(confRs.next())
				{ 
					%>
					<div class="conf-card"> 
						<p> <%=confRs.getString("project_text") %></p>
						<label> <%=confRs.getString("project_date") %></label>
						<div class="btn-group"> 
							<a href = "update_project.jsp?cid=<%=confRs.getInt("id") %>" class="btn btn-edit">Update</a>
							<a 
								href ="delete_project.jsp?cid=<%=confRs.getInt("id") %>" 
								class = "btn btn-delete"
								onclick="return confirm('Are you sure to delete')"
							>Delete</a>
						</div>
					</div> 
				<% 
				}
				confRs.close();
			%>
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>