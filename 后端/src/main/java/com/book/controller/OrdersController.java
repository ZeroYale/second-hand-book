package com.book.controller;

import com.book.common.bean.Result;
import com.book.entity.Orders;
import com.book.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/orders")
public class OrdersController {
    @Autowired
    private IOrdersService ordersService;

    @RequestMapping("/list")
    public Result queryUserList() {
        return this.ordersService.queryOrdersList();
    }
}
