package cn.fby.ssm.service.impl;

import cn.fby.ssm.mapper.UserMapper;
import cn.fby.ssm.pojo.User;
import cn.fby.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public int addUser(User user) {
        return userMapper.insertUser(user);
    }
}
