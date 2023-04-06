<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="component/allCSS.jsp"%>
</head>
<body>

<%@ include file="component/navbar.jsp" %>

	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">

					<div class="card-body">
						<h4 class="text-center text-success">Login Page</h4>
						
						<% String invalidMsg = (String)session.getAttribute("invalidMsg");
						if(invalidMsg != null)
						{%>
						   <p class="text-danger text-center"><%= invalidMsg %></p>
						<%
						session.removeAttribute("invalidMsg");
						}%>
						
						<% String logoutMsg = (String)session.getAttribute("logoutMsg");
						if(logoutMsg != null)
						{%>
						   <p class="text-success text-center"><%= logoutMsg %></p>
						<%
						session.removeAttribute("logoutMsg");
						}%>
						
						<form action="login" method="post">
							
							<div class="form-group">
								<label for="exampleInputEmail1">Email</label> <input name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" >

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input name="password"
									type="password" class="form-control" id="exampleInputPassword1"
									>
							</div>
							
							<div class="text-center mt-2">
							<button type="submit" class="btn btn-primary">Submit</button>
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