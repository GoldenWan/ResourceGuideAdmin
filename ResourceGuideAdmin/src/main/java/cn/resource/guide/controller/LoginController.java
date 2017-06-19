package cn.resource.guide.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.resource.guide.entity.Function;
import cn.resource.guide.entity.Json;
import cn.resource.guide.entity.Role;
import cn.resource.guide.entity.User;
import cn.resource.guide.services.ShiroService;
import cn.resource.guide.utils.ConstValues;


@Controller
@Scope(value="prototype")
@RequestMapping(value="/user")
public class LoginController {
	private static final Logger logger=Logger.getLogger(LoginController.class);
	@Autowired
	private HttpServletRequest request;
	@Autowired
	public ShiroService shiroService;
	
	@RequestMapping("/login")
	public @ResponseBody Json  login(@RequestParam("username") String username, 
			@RequestParam("password") String password){
		Json json=new Json();
	
		Subject currentUser = SecurityUtils.getSubject();
        	// 把用户名和密码封装为 UsernamePasswordToken 对象,token==doGetAuthenticationInfo(token)
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            token.setRememberMe(true);
       
            String error =ConstValues.LOGINSUCCESS; 
            int errorCode=0;
            try {  
            	currentUser.login(token);  
            } catch (UnknownAccountException e) {  
                error = ConstValues.ACCOUNTERROR;  
                errorCode=1;
            } catch (IncorrectCredentialsException e) {  
                error = ConstValues.PASSERROR;   
                errorCode=2;
            } catch (ExcessiveAttemptsException e) {  
                error = "登录失败多次，账户锁定10分钟"; //
                errorCode=3;  
            } catch (LockedAccountException e) {  
                error = ConstValues.ACCOUNTLOCK;   
                errorCode=4;
            } catch (AuthenticationException e) {  
                // 其他错误，比如锁定，如果想单独处理请单独catch处理  
                error = "其他错误：" + e.getMessage();   
                errorCode=5;
            }  
             logger.info(error);
            
             if(errorCode==0){
            	 json.setSuccess( true);
            	 json.setMsg(ConstValues.LOGINSUCCESS);
             }
             else if(errorCode==1){
            	 json.setSuccess( false);
            	 json.setMsg(ConstValues.ACCOUNTERROR);
             }
			else if(errorCode==2){
				 json.setSuccess( false);
            	 json.setMsg(ConstValues.PASSERROR); 	 
			             }
			else if(errorCode==3){
				 
			}
			else if(errorCode==4){
				json.setSuccess( false);
           	    json.setMsg(ConstValues.ACCOUNTLOCK); 
			}
			else{
				json.setSuccess( false);
           	    json.setMsg(ConstValues.LOGINFAIL);
			}
             User user =shiroService.getUserByName(username);
             request.getSession().setAttribute("currentUser", user);
             return json;
       
		
	}
	
    @RequestMapping("logout")  
    public String logout(HttpServletRequest request){  
        SecurityUtils.getSubject().logout();   
        logger.info("注销");
        return "redirect:login.jsp";  
    }  
    @ResponseBody  
    @RequestMapping("json")  
    public String content(HttpServletRequest request){  
    	 User user =shiroService.getUserByName("root");
    	List<Role> roleList = shiroService.getRoleByUserId(user.getId());
		// 操作
		List<Function> permList = shiroService.getPermissionByUserId(user.getId());
		logger.info(roleList.size()+"---"+permList.size());
		if (roleList != null && roleList.size() > 0) {
			for (Role role : roleList) {
				if (role.getName() != null) {
					// 添加角色
					logger.info("role.getName():"+role.getName()+role.getId());
				}
			}
		}

		if (permList != null && permList.size() > 0) {
			for (Function perm : permList) {
				if (perm.getName() != null) {
					logger.info("perm.getName():"+perm.getName()+perm.getId());
				}
			}
       } 
		return "{\"hello\":\"wellcome content\"}";  
		}
    
}
