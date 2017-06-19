<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'welcome.jsp' starting page</title>
    <style type="text/css">
      body{
        margin: 0px;
      }
     .body_div{
         background: #f9f3f9;
         color: red;
         width: 100%;
         height: 100%;
     }
     .di{
         color: black;
         width: 20%;
         height: 10%;
         padding: 200px 400px;
        
       }
    </style>
  </head>

  <body>
           <div class="body_div">
                <div class="di">欢迎登陆,XXX管理系统!</div>
           </div>
  </body>
</html>
