package com.book.controller;


import com.book.common.bean.Result;
import com.book.entity.Shoppingcar;
import com.book.entity.User;
import com.book.service.IShoppingcarService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/shoppingcar")
@Slf4j
public class ShoppingcarController {

    @Autowired
    private IShoppingcarService shoppingcarService;


    @RequestMapping("/list")
    public Result queryUserList() {
        return this.shoppingcarService.queryShoppingcarList();
    }
}
