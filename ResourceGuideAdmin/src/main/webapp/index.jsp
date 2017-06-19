<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>My JSP 'index.jsp' starting page</title>
    <%@include file="../cssjs.jsp"%>
    <style type="text/css">
        body{
            margin:0px;
            height: 100%;
        }
        html{
            height: 100%;
        }
        #header{
            background: #ccff00;
            color:red;
            padding:10px;
        }
        #header a{

            color:red;
        }
        #nav{
            float: left;
            width:150px;
            background: #00ccff;
            height: 100%;

        }
        #nav ul{
            margin: 0px;
        }
        #nav li{
            font-size: 16px;
            padding:10px 7px;;

        }
        #main{
            float:left;
            width:calc(100% - 150px);
            height: 100%;
        }
        #bottom{

            height: calc(100% - 38px);
        }
        .model{
            position: fixed;
            width:100%;
            height: 100%;
            background: rgba(2,2,2,0.3);
            z-index: 999;
            display: none;
        }
        .model-content{
            margin: 40px auto;
            width: 900px;
            height: 80%;
            background: #fff;
            box-shadow: 0 0 20px 10px rgba(6,6,6,0.5);
            border-radius: 2px;
        }
        .model-form{
            height: 90%;
            overflow: auto;
        }
        .model-btns{
            height: 10%;
            background-color: #00a0e9;
            text-align: center;
        }
    </style>
    <!-- 配置文件 -->
    <script type="text/javascript" src="../js/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="../js/ueditor/ueditor.all.js"></script>
</head>
<body>
<%--模态窗口--%>
<div class="model">
    <div class="model-content">
        <div class="model-form">

        </div>
        <div class="model-btns">
            <div class="btn_confirm">
                <input type="button" value="确定" id="btn_submit" class="btn_submit" accesskey="s">
                <input type="button" value="关闭" id="btn_close" class="btn_submit" accesskey="s">
            </div>
        </div>
    </div>
</div>
 <div id="header">
          
	          ${user.uloginname},欢迎登陆
	          <a href="">注销</a>
	          
 </div>
<div  id="bottom">
    <div id="nav">
        <ul>
            <li> <a href="javascript:office()" target="mainFrame">办公</a></li>

            <li> <a href="javascript:WorkStream()">工作流程</a>
                <ul id="li-ul1">
                    <li><a href="workstream_list" target="mainFrame">查询工作流</a></li>
                    <li><a href="workstream_noList" target="mainFrame">待办工作流</a></li>
                    <li><a href="admin-help.html" target="mainFrame">已办工作流</a></li>
                </ul>
            </li>

            <li> <a  href="javascript:ZongWu()">总务</a>
                <ul id="li-ul2">
                    <li><a href="/leave_list" class="am-cf" target="mainFrame">请假</a></li>
                    <li><a href="transaction/resign.jsp" target="mainFrame">辞职</a></li>
                </ul>
            </li>

            <li ><a  href="javascript:system()">系统</a>
                <ul id="li-ul3">
                    <li><a href="/user_select" class="am-cf" target="mainFrame">职员查询</a></li>
                    <li><a href="/user/add.jsp" target="mainFrame">添加职员</a></li>
                    <li><a href="group_select" target="mainFrame">添加部门</a></li>
                    <li><a href="role_select" target="mainFrame">添加职位</a></li>
                    <li><a href="admin-404.html">权力分配</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div id="main">
        <iframe name="mainFrame" src="welcome.jsp" width="100%" height="100%"></iframe>
    </div>
</div>


<script>
    $(function(){
        $("#li-ul1").hide();
        $("#li-ul2").hide();
        $("#li-ul3").hide();
        /*第一步：把add.jsp这个表单填充到一个div上*/
        $(".model-form").load("office/add.jsp");//list加载之前，就把add加载进来
            function office() {
                event.preventDefault();//阻止默认行为，他可以阻止a标签不跳转页面
                $(".model").fadeIn(300);
                document.getElementById("fm").reset();//重置表单
                ue.setContent("");//把HTML编辑器清空
            }
    });
    function office() {
        $(".model").fadeIn(300);
    }

    function WorkStream(){
        $("#li-ul1").toggle();
    }
    function ZongWu(){
        $("#li-ul2").toggle();
    }
    function system(){
        $("#li-ul3").toggle();
    }
</script>
</body>

</html>
