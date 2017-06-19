<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login Page</title>
</head>
<body>
	
	<h4>Login Page</h4>
	
	<form action="user/login" method="POST">
		username: <input type="text" name="username"/>
		<br><br>
		
		password: <input type="password" name="password"/>
		<br><br>
		
		<input type="submit" value="Submit"/>
		<input type="button" value="register" id="register"/>
	</form>
	<script src="static/js/jquery-1.11.3.js"></script>
	<script type="text/javascript">
	     $(function(){
	        $("#register").click(function(){
	        	location.href="register.jsp";
	        });
	   });
	</script>
</body>
</html>