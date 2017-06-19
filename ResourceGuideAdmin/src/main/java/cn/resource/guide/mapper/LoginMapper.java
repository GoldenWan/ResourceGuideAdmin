package cn.resource.guide.mapper;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Component;

import cn.resource.guide.controller.Function;
import cn.resource.guide.entity.Role;
import cn.resource.guide.entity.User;

@Component
@MapperScan("loginMapper")
public interface LoginMapper {

	User getUserByName(String username);

	List<Role> getRoleByUserId(int id);

	List<Function> getPermissionByUserId(int id);

	
}
