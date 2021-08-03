package com.book.service;

import com.book.common.PageResult;
import com.book.common.bean.Result;
import com.book.entity.User;

import java.util.HashMap;
import java.util.List;

public interface IUserService {
    /**
     * 用户登录
     * @param phone
     * @param password
     * @return
     */
    Result queryUser(String phone, String password);

    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    User queryUserById(Integer id);

    /**
     * 查询所有用户
     * @return
     */
    Result queryUserList();

    /**
     * 新增用户
     * @param user
     */
    void saveUser(User user);


    /**
     * 根据id删除用户
     * @param id
     */
    void deleteUserById(Long id);

    /**
     * 根据phone更新用户
     * @param phone
     * @param username
     * @return
     */
    User updateUserById(int id, String phone, String username);

    /**
     * 根据条件查询用户
     * @param key
     * @return
     */
    Result queryUsersByPage(String key);
}
