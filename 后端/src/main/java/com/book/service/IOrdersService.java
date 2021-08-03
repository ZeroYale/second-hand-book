package com.book.service;

import com.book.common.bean.Result;
import com.book.entity.Orders;

import java.util.List;

public interface IOrdersService {

    /**
     * 查询所有订单
     * @return
     */
    Result queryOrdersList();
}
