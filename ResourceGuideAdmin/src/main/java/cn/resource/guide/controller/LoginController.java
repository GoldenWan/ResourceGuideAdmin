package cn.resource.guide.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.resource.guide.services.ShiroService;


@Controller
@Scope(value="prototype")
@RequestMapping(value="/user")
public class LoginController {
	private static final Logger logger=Logger.getLogger(LoginController.class);

	@Autowired
	private ShiroService shiroService;
	
	@RequestMapping("/login")
	public String login(@RequestParam("username") String username, 
			@RequestParam("password") String password){
		Subject currentUser = SecurityUtils.getSubject();
		
		if (!currentUser.isAuthenticated()) {
        	// 把用户名和密码封装为 UsernamePasswordToken 对象
            UsernamePasswordToken token = 
            		new UsernamePasswordToken(username, password);
            // rememberme
            token.setRememberMe(true);
            try {
            	logger.info("1. " + token.hashCode());
            	// 执行登录. 
                currentUser.login(token);
            } 
            catch (UnknownAccountException uae) {
    			System.out.println("账户不存在!");
    		} catch (IncorrectCredentialsException ice) {
    			System.out.println("密码不正确!");
    		} catch (LockedAccountException lae) {
    			System.out.println("账户被禁了!");
    		} catch (AuthenticationException ae) {
    			System.out.println("认证错误!");
    		}
        }
		
		return "list";
	}
	
    @RequestMapping("logout")  
    public String logout(HttpServletRequest request){  
        SecurityUtils.getSubject().logout();    
        return "redirect:login.jsp";  
    }  
    @ResponseBody  
    @RequestMapping("json")  
    public String content(HttpServletRequest request){  
        return "{\"hello\":\"wellcome content\"}";  
        
        
    }  
}
