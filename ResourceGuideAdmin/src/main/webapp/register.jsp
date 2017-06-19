<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
     <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="cssjs.jsp" type="text/css"/> 
    
    <style>
       

        .clearfixed:after {
            content: '';
            display: block;
            clear: both;
        }

        /*表格*/
        .tbl_frm .tb_info{
            margin-top: 20px;
        }
        .tbl_frm table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
        }
        .tbl_frm01 .tbl_wrap{
            margin-bottom: 30px;
        }
        .tbl_frm th {
            width: 200px;
            font-size: 12px;
            padding: 14px 13px;
            background-color: #f9f9f9;
            border: 1px solid #e9e9e9;
            border-left: 0;
            text-align: left;
        }

        .tbl_frm th {

        }
        .tbl_frm td {
            font-size: 12px;
        }

        .tbl_frm .frm_input {
            height: 29px;
            background-color: #fff;
        }
        .tbl_frm textarea,
        .tbl_frm .frm_input {
            border: 1px solid #e4eaec;
            background: #f7f7f7;
            color: #000;
            vertical-align: middle;
            line-height: 2em;
        }
        .tbl_frm td {
            padding: 7px 10px;
            border-top: 1px solid #e9e9e9;
            border-bottom: 1px solid #e9e9e9;
            background: transparent;
        }
        .check_agree {
            text-align: center;
            font-size: 14px;
        }
        .check_agree a{
            color:#0054a6;
        }
        #captcha #captcha_key {
            margin: 0 0 0 33px;
            padding: 0 5px;
            width: 70px;
            height: 60px;
            border: 1px solid #b8c9c2;
            background: #f7f7f7;
            font-size: 1.333em;
            font-weight: bold;
            text-align: center;
            line-height: 2.8em;
            vertical-align: top;
        }
        /*注册条*/
        .btn_confirm {
            text-align: center;
        }
        .btn_confirm .btn_submit {
            border:0px;
            width: 152px;
            text-align: center;
            padding: 10px;
            background: #193c96;
            color: #fff;
            font-size: 12px;
        }
    </style>
</head>
<body>
<form id="fm" class="tbl_frm"  method="post" >
     
    <div class="container">
        <div class="tbl_frm01 tbl_wrap">
            <table>
                <caption>ID信息</caption>
                 <div id="msg"></div>
                <tbody>
                <tr>
                    <th scope="row"><label for="username">账号</label></th>
                    <td>
                       
                        <input type="text" name="username" value="" id="username" class="frm_input required " >
                        <span class="frm_info">* 只能输入英文, 数字, _ . 请至少输入6位以上</span>
                        
                    </td>
                </tr>
                <tr>
                 
                    <th scope="row"><label for="password">新密码</label></th>
                    <td>
                        <input type="password" name="password" id="password" 
                               class="frm_input required" maxlength="13"  >
                        <span class="frm_info">* 请输入英文/数字组合8至13位</span>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label for="rpwd">确认密码</label>
                    </th>
                    <td>
                        <input type="password" name="rpwd" id="rpwd" 
                               class="frm_input required"  maxlength="13" >
                        <span class="frm_info">* 请重新输入密码</span>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="tbl_frm01 tbl_wrap">
            <table>
                <caption>个人信息</caption>
                <div id=msg2></div>
                <tbody>
                <tr>
                    <th scope="row"><label for="realname">姓名</label></th>
                    <td>
                        <input type="text" id="realname" name="realname"  class="frm_input required " 
                           size="10" >
                        <span class="frm_info">* 请输入您的实名</span>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label for="alias">网名</label></th>
                    <td>
                        <input type="text" id="alias" name="alias"  class="frm_input required " 
                           size="10"  >
                        <span class="frm_info">* 请输入您的网名</span>
                    </td>
                </tr>
                <tr>
                    <th scope="row"><label for="identitynumber">身份证号</label></th>
                    <td>
                        <input type="text" id="identitynumber" name="identitynumber" value="" 
                          class="frm_input required " maxlength="18"   >
                        <span class="frm_info">*请输入18位身份证号</span>
                    </td>
                </tr>
                 
                <tr>
                    <th scope="row"><label for="sex">性别</label></th>
                    <td>
                        <input type="radio" name="sex" value="0" id="sex1"  > 女
                        <input type="radio" name="sex" value="1" id="sex2"  > 男
                    </td>
                </tr>

                <tr>
                    <th scope="row"><label for="telephone">手机</label></th>
                    <td><input type="text" name="telephone" value="" id="telephone" 
                        class="frm_input " maxlength="11" >
                        <span class="frm_info">*请输入11位手机号</span>
                     </td>
                </tr>
                
                <tr>
                    <th scope="row"><label for="qq">QQ</label></th>
                    <td><input type="text" name="qq" value="" id="qq" 
                        class="frm_input " maxlength="11" >
                        <span class="frm_info">*请输入QQ号</span>
                     </td>
                </tr>
                
                <tr>
                    <th scope="row"><label for="weixin">微信</label></th>
                    <td><input type="text" name="weixin" value="" id="weixin" 
                        class="frm_input " maxlength="11" >
                        <span class="frm_info">*请输入微信号</span>
                     </td>
                </tr>

                <tr>
                    <th scope="row"><label for="email">邮件</label></th>
                    <td>
                      
                        <input type="text" name="email" value="" id="email"
                        class="frm_input email required" size="70" maxlength="100" >
                        <span class="frm_info">* 请输入您的邮件地址</span>
                    </td>
                </tr>

                
                </tbody>
            </table>
        </div>
        
        <div class="btn_confirm">
            <input type="submit" value="注册完成" id="btn_submit" class="btn_submit" accesskey="s">
            <input type="submit" value="取消"  class="btn_submit" accesskey="s">
            
        </div>
    </div>
</form>
<script src="static/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
     $(function(){
        $("#btn_submit").click(function(){
               /* url="register";
               $.post(url,$("#fm").serialize(),function(data){
                   alert(data.msg);
               },"json"); */
               
              $.ajax({
				   type: "POST",
				   url: "register",
				   async: false,
				   data: $("#fm").serialize(),
				   success: function(data,json){
				     alert(  data.msg );
				   },
			   });
        });
   });
</script>
	
<!-- <script type="text/javascript">
	        
	         function checkUser(){
	            var flag;
	            var uloginname=document.getElementById("uloginname");
	            var userval=uloginname.value;
                msg.innerHTML="";
          		var reg = /^(\w{3,20}|\d{3,20}|_{3,20})$/gi;
	            var flag=reg.test(userval);
		          if(userval==""){
		             msg.innerHTML = "<li>用户名不能为空</li>";
		             msg.className ="selected";
		             flag=false;
		          }else if(!flag){
		             msg.innerHTML = "<li>用户名格式不对</li>";
		             msg.className ="selected";
		             flag=false;
		          }else{
		            flag=true;
		          }
		          return flag;
	         }
	        
	         function checkPwd(){
	           var flag;
	           msg.innerHTML="";
	           var pwd=document.getElementById("pwd");
	           var pwdval=pwd.value;
	           var reg =/^(\w{8,13}|\d{8,13})$/;
	           var flag=reg.test(pwdval);
	           
	           if(pwdval==""){
		             msg.innerHTML = "<li>密码不能为空</li>";
		             msg.className="selected";
		             flag=false;
          		}else if(!flag){
          		     msg.innerHTML = "<li>密码格式不对</li>";
		             msg.className ="selected";
		             flag=false;
          		}else{
		             flag=true;
          		}
          		return flag;
	         }
	         
	         function checkRpwd(){
	           var flag;
	           var rpwd=document.getElementById("rpwd");
	           var pwd=document.getElementById("pwd");
	           msg.innerHTML="";
	            if(rpwd.value==""){
		             msg.innerHTML = "<li>请重新输入密码！</li>";
		             msg.className="selected";
		             flag=false;
          		}else if(pwd.value!=rpwd.value){
	                 msg.innerHTML = "<li>两次输入的密码不一致，请重新输入！</li>";
		             msg.className ="selected";
		             flag=false;
	           }else{
	              flag=true;
	           }
	           return flag;
	         }
	        function checkUname(){
	             var flag;
	             msg.innerHTML="";
	             var uname = document.getElementById("uname");
	             var uval = uname.value;
	           /*   console.log(uval); */
	             var reg =/^[\u4e00-\u9fa5]+$/gi;
	              if(uval==""){
		             msg2.innerHTML = "<li>请输入姓名！</li>";
		             msg2.className="selected";
		             flag=false;
          		  }else if(!(reg.test(uval))){
	                 msg2.innerHTML = "<li>请输入汉字！</li>";
			         msg2.className ="selected2";
		             flag=false;
		          }else{
	                 flag=true;
		          }
		          return flag;
	        }
           function checkUidcard(){
                 msg2.innerHTML=""; 
                 var flag;
	             var uidcard = document.getElementById("uidcard");
                 var uval = uidcard.value;
                 var reg=/[0-9]{18}/;
                 
                 if(uval==""||!(reg.test(uval))){
	                 msg2.innerHTML = "<li>请输入18位身份证号!</li>";
			         msg2.className ="selected2";
			         flag=false;
		          }else{
			         flag=true;
		          }
		          return flag;
           }
           function checkUmobile(){
                 var flag;
                 msg2.innerHTML="";
	             var umobile = document.getElementById("umobile");
	             var  uval=umobile.value;
                 var reg=/[0-9]{11}/;
                 if(uval==""){
		             msg2.innerHTML = "<li>请输入11位手机号码！</li>";
		             msg2.className="selected";
		             flag= false;
          		 }else if(!(reg.test(uval))){
	                 msg2.innerHTML = "<li>请输入11位手机号码！</li>";
			         msg2.className ="selected2";
			         flag=false;
		         }else{
	                flag=true;
		         }
		         return flag;
           }
           function checkUemail(){
                 var flag;
                 msg2.innerHTML="";
                 var uemail = document.getElementById("uemail");
	             var uval=uemail.value;
                 var reg = /^\w+@\w+(\.\w+)+$/i;
                 if(uval==""){
		             msg2.innerHTML = "<li>请输入邮箱！</li>";
		             msg2.className="selected";
		             flag= false;
          		 }else if(!(reg.test(uval))){
	                 msg2.innerHTML = "<li>邮箱格式不对，请重新输入！</li>";
			         msg2.className ="selected2";
			         flag=false;
		         }else{
	                flag=true;
		         }
		         return flag;
           }
           function checkUbirth(){
                 var flag;
                 var ubirth = document.getElementById("ubirth");
	             var uval=uemail.value;
	             if(uval=="" ){
	                  msg2.innerHTML = "<li>请输入生日！</li>";
		              msg2.className="selected";
		              flag= false;
	             }else{
	                msg2.innerHTML="";
	                flag=true;
		         }
		         return flag;
           }
           function checkUsex(){
                 var flag;
                 msg2.innerHTML="";
                 var usex1 = document.getElementById("usex1");
                 var usex2 = document.getElementById("usex2");
                  if(!(usex1.checked)&&!(usex2.checked)){
	                  msg2.innerHTML = "<li>请选择性别！</li>";
		              msg2.className="selected";
		              flag= false;
	             }else{
	                flag=true;
		         }
		         return flag;
           }
           function checkForm(){
				if(checkUser()&&checkPwd()&&checkRpwd()&&checkUname()&&checkUidcard()&&checkUbirth()&&checkUsex()&&checkUmobile()&&checkUemail())
					return true;
				return false;
			}
</script> -->
</body>
</html>