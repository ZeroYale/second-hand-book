package com.book.mapper;

import com.book.entity.User;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UserMapper extends Mapper<User> {


    @Select("Select * from user where phone=#{phone}")
    User updateUserByPhone(String phone);
}
