package  cn.resource.guide.services;

import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.session.Session;

import cn.resource.guide.controller.Function;
import cn.resource.guide.entity.Role;
import cn.resource.guide.entity.User;


public class ShiroService {
	
	@RequiresRoles({"admin"})
	public void testMethod(){
		System.out.println("testMethod, time: " + new Date());
		
		Session session = SecurityUtils.getSubject().getSession();
		Object val = session.getAttribute("key");
		
		System.out.println("Service SessionVal: " + val);
	}

	public User getUserByName(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Role> selectRoleByUserId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Function> selectPermissionByUserId(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
 