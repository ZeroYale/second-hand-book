package com.book.service.impl;


import com.book.common.PageResult;
import com.book.common.bean.Result;
import com.book.common.constants.ResultConstants;
import com.book.entity.Book;
import com.book.entity.User;
import com.book.mapper.UserMapper;
import com.book.service.IUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;


import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
@Slf4j
public class UserServiceImpl implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public Result queryUser(String phone, String password) {
        log.info("登录中...");
        log.info(phone);
        log.info(password);
        User record = new User();
        record.setPhone(phone);

        User user = this.userMapper.selectOne(record);
        //判断User是否为空
        if (user == null){
            return Result.createWithErrorMessage(ResultConstants.USER_NOT_EXIST);
        }
        //加密算法

        //和数据库中的密码比较
        if (StringUtils.equals(password,user.getPassword())){
            System.out.println(user);
            return Result.createWithModel(user);
        }
        return Result.createWithErrorMessage(ResultConstants.PSW_ERROR);
    }



    @Override
    public User queryUserById(Integer id) {
        return this.userMapper.selectByPrimaryKey(id);
    }

    @Override
    public Result queryUserList() {
        log.info("查找所有用户中...");
        List<User> list = this.userMapper.selectAll();
        return Result.createWithModel(list);
    }

    @Override
    public void saveUser(User user) {
        log.info("注册用户...");
        user.setCreate_at(new Date());
        user.setBooks_num(0L);
        user.setStatus(0L);
        this.userMapper.insertSelective(user);
    }

    @Override
    public void deleteUserById(Long id) {
        log.info("删除用户中...");
        User user = this.userMapper.selectByPrimaryKey(id);
        this.userMapper.delete(user);
    }



    @Override
    public User updateUserById(int id, String phone, String username) {
        log.info("更新用户中...");
        User record = this.userMapper.selectByPrimaryKey(id);
        User user = new User();
        user.setId(id);
        user.setPhone(phone);
        user.setUsername(username);
        user.setPassword(record.getPassword());
        user.setBooks_num(record.getBooks_num());
        user.setCreate_at(record.getCreate_at());
        user.setStatus(record.getStatus());
        this.userMapper.updateByPrimaryKey(user);
        return user;
    }



    public Result queryUsersByPage(String key) {

        //初始化example对象
        Example example = new Example(User.class);
        Example.Criteria criteria = example.createCriteria();
        log.info("根据条件查询用户" + key);
        //根据name模糊查询
        if(StringUtils.isNotBlank(key)){
            criteria.andLike("username","%"+ key+"%").orEqualTo("phone",key);
        }

        List<User> user = this.userMapper.selectByExample(example);

        //包装成分页结果集返回
        return Result.createWithModel(user);
    }
}
