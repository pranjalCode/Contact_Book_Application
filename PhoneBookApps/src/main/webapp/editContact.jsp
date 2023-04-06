<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.dao.ContactDAO" %>
    <%@ page import="com.conn.DbConnect" %>
    <%@ page import="com.entity.Contact" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="component/allCSS.jsp"%>

</head>
<body>

<%@ include file="component/navbar.jsp"  %>

<% if(user == null){
	session.setAttribute("invalidMsg", "Login please...");
	response.sendRedirect("login.jsp");
	} 
	%>

<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">

					<div class="card-body">
						<h4 class="text-center text-success">Edit Contact:</h4>
						
						<% String succMsg =  (String)session.getAttribute("succMsg");
						   String failedMsg = (String)session.getAttribute("failedMsg");
						
						if(succMsg != null){
						%>
						    <h5 class="text-success text-center"> <%= succMsg %></h5>
						<% 
						session.removeAttribute("succMsg");
						}
						
						if(failedMsg != null){
							%>
						    <h5 class="text-danger text-center"> <%= failedMsg %></h5>
						<%
						session.removeAttribute("failedMsg");
						}
						
						%>
						
						<form action="update" method="post">
						<%
						    int cid = Integer.parseInt(request.getParameter("cid"));
						        ContactDAO dao = new ContactDAO(DbConnect.getConn());
							    Contact c = dao.getContactById(cid);
						%>
						
					 <input type="hidden" value="<%=cid%>" name="cid">
						
							<div class="form-group">
								<label for="exampleInputEmail1">Name</label> <input type="text" 
								name="name" value="<%= c.getName() %>"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" >

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email</label> <input name="email"
								value="<%= c.getEmail() %>"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" >

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Mobile</label> <input name="mobile"
								value="<%= c.getPhone() %>"
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" >

							</div>
							
							
							<div class="text-center mt-2">
							<button type="submit" class="btn btn-primary">Update</button>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="component/footer.jsp"%>


</body>
</html>