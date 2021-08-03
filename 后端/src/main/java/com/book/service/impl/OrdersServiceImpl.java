package com.book.service.impl;

import com.book.common.bean.Result;
import com.book.entity.Orders;
import com.book.mapper.OrdersMapper;
import com.book.service.IOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersServiceImpl implements IOrdersService {

    @Autowired
    private OrdersMapper ordersMapper;

    @Override
    public Result queryOrdersList() {

        List<Orders> list =  this.ordersMapper.selectAll();
        return Result.createWithModel(list);
    }
}
