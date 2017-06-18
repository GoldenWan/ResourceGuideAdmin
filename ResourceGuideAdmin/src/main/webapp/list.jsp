<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<h4>List Page</h4>
	
	Welcome: <shiro:principal></shiro:principal>
	
	<shiro:hasAnyRoles name="admin,user">
	has roel Admin or User
	</shiro:hasAnyRoles>
	<br><br>
	<shiro:hasRole name="admin">
	<br><br>
	<a href="admin.jsp">Admin Page</a>
	</shiro:hasRole>
	
	<shiro:hasRole name="user">
	<br><br>
	<a href="user.jsp">User Page</a>
	</shiro:hasRole>
	<br><br>
	<shiro:guest>
Welcome, guest<a href ="loginjsp"></a>	
	</shiro:guest>
	<br><br>
	<shiro:user>
	WELCOME:<shiro:principal/>login,<a href="shiro/logout">logout</a>
	</shiro:user>
	<br><br>
	<shiro:authenticated>
	user:<shiro:principal/> has pass authenticate
	</shiro:authenticated>
	<br><br>
	
	<a href="shiro/testShiroAnnotation">Test ShiroAnnotation</a>
	
	<br><br>
	<a href="shiro/logout">Logout</a>
	
</body>
</html>