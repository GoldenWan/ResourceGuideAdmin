package cn.resource.guide.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.resource.guide.entity.User;
import cn.resource.guide.mapper.RegisterMapper;

@Service
public class RegisterService {

	@Autowired
	private RegisterMapper registerMapper;
	
    public int register(User user) {
        return registerMapper.register(user);
    }
}
