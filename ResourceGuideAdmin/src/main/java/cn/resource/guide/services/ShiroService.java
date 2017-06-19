package  cn.resource.guide.services;

import java.util.Date;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;

import cn.resource.guide.entity.Function;
import cn.resource.guide.entity.Role;
import cn.resource.guide.entity.User;
import cn.resource.guide.mapper.LoginMapper;


public class ShiroService {
	@Autowired
	LoginMapper loginMapper;
	
	
	@RequiresRoles({"1"})
	public void testMethod(){
		System.out.println("testMethod, time: " + new Date());
		
		Session session = SecurityUtils.getSubject().getSession();
		Object val = session.getAttribute("key");
		
		System.out.println("Service SessionVal: " + val);
	}

	public User getUserByName(String username) {
		
		return loginMapper.getUserByName(username);
	}

	public List<Role> getRoleByUserId(String id) {
		return loginMapper.getRoleByUserId(id);
	}

	public List<Function> getPermissionByUserId(String id) {
		return loginMapper.getPermissionByUserId(id);
		
	}
	
}
 