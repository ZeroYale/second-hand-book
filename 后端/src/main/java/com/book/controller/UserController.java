package com.book.controller;

import com.book.common.PageResult;
import com.book.common.bean.Result;
import com.book.entity.Book;
import com.book.entity.User;
import com.book.service.IUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;


@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @RequestMapping("/login")
    public Result queryUser(@RequestBody HashMap<String, String> map, HttpServletRequest request) {
        String phone = map.get("phone");
        String password = map.get("psw");
       // request.getSession().setAttribute("phone", phone);
        return userService.queryUser(phone,password);
    }



    @GetMapping("{id}")
    public ResponseEntity<User> queryUserById(@PathVariable("id")Integer id) {
        User user = this.userService.queryUserById(id);
        if (user == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(user);
    }

    @RequestMapping("/list")
    public Result queryUserList() {
        return this.userService.queryUserList();
    }

    @PostMapping("/register")
    public Result saveUser(@RequestBody User user) {
        this.userService.saveUser(user);
        return Result.createWithSuccessMessage();
    }

    @RequestMapping("/delete")
    public Result deleteUserById(@RequestBody HashMap<String, String> map) {
        this.userService.deleteUserById(Long.parseLong(map.get("id")));
        return Result.createWithSuccessMessage();
    }

    @RequestMapping("/update")
    public Result updateUserByPhone(@RequestBody HashMap<String, String> map) {

        String phone = map.get("phone");
        String username = map.get("username");
        String id = map.get("id");
        User record = this.userService.updateUserById(Integer.parseInt(id),phone,username);
        return Result.createWithModel(record);
    }

    @PostMapping("page")
    public Result queryUserByPage(@RequestBody HashMap<String, String> map){
        String data = map.get("data");

        return this.userService.queryUsersByPage(data);
    }
}
