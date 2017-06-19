package cn.resource.guide.mapper;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Component;

import cn.resource.guide.entity.User;

@MapperScan
@Component
public interface RegisterMapper {

	public  int register(User user);//注册
	public  int userRole(String id);
	
}
