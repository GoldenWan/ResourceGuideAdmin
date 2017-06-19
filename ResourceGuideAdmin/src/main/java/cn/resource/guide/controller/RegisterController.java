package cn.resource.guide.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.resource.guide.entity.User;
import cn.resource.guide.services.RegisterService;
import cn.resource.guide.utils.IPGenerator;
import cn.resource.guide.utils.UUIDGenerator;

@Controller
public class RegisterController {

	@Autowired
	private  RegisterService registerService;
	@RequestMapping(value = "/register", method = {RequestMethod.POST, RequestMethod.GET})
    public  @ResponseBody Map add(HttpServletRequest req,User user) {

		User u=new User();
		u.setId(UUIDGenerator.getUUID());
		u.setUsername(user.getUsername());
		
		String hashAlgorithmName = "MD5";//算法名
		Object credentials = user.getPassword();
		Object salt = ByteSource.Util.bytes(user.getUsername());;
		int hashIterations = 1024;
		Object result = new SimpleHash(hashAlgorithmName, credentials, salt, hashIterations);
		u.setPassword(result.toString());
		
		u.setQq(user.getQq());
		u.setWeixin(user.getWeixin());
		u.setTelephone(user.getTelephone());
		u.setIdentitynumber(user.getIdentitynumber());
		u.setEmail(user.getEmail());
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		u.setRegistertime(sdf.format(new Date()));
		
		// 获取用户的ip地址
		u.setRegisterip(IPGenerator.getIpAddr(req));
		u.setRealname(user.getRealname());
		u.setSex(user.getSex());
		u.setAlias(user.getAlias());
		
		u.setState(0);
		u.setScore(1000);
		u.setIslock(0);
		
		Map map=new HashMap();
		int i=registerService.register(u);
		if(i>0){
			 map.put("msg","注册成功！");
		}else{
			 map.put("msg","注册失败！");
		}
	    return map;
    }
	
	
}
