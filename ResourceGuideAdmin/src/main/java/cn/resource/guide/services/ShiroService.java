package  cn.resource.guide.services;

import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.resource.guide.controller.Function;
import cn.resource.guide.entity.Role;
import cn.resource.guide.entity.User;
import cn.resource.guide.mapper.LoginMapper;


public class ShiroService {
	@Autowired
	LoginMapper loginMapper;
	
	
	@RequiresRoles({"admin"})
	public void testMethod(){
		System.out.println("testMethod, time: " + new Date());
		
		Session session = SecurityUtils.getSubject().getSession();
		Object val = session.getAttribute("key");
		
		System.out.println("Service SessionVal: " + val);
	}

	public User getUserByName(String username) {
		
		return loginMapper.getUserByName(username);
	}

	public List<Role> getRoleByUserId(int id) {
		return loginMapper.getRoleByUserId(id);
	}

	public List<Function> getPermissionByUserId(int id) {
		return loginMapper.getPermissionByUserId(id);
	}
	
}
 