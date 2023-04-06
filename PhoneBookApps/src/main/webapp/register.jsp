<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="component/allCSS.jsp"%>
</head>
<body style={background-color: #f7fof8}>
	<%@ include file="component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-6 offset-md-3">
				<div class="card">

					<div class="card-body">
						<h4 class="text-center text-success">Registration Page</h4>
						
						<% String succMsg =  (String)session.getAttribute("SuccessMsg");
						   String errMsg = (String)session.getAttribute("ErrorMsg");
						
						if(succMsg != null){
						%>
						    <h5 class="text-success text-center"> <%= succMsg %></h5>
						<% 
						session.removeAttribute("SuccessMsg");
						}
						
						if(errMsg != null){
							%>
						    <h5 class="text-danger text-center"> <%= errMsg %></h5>
						<%
						session.removeAttribute("ErrorMsg");
						}
						
						%>
						
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputName">Name</label> <input name="name" type="text"
									class="form-control" id="exampleInputName"
									aria-describedby="emailHelp" >

							</div>
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