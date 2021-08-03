package com.book.service;

import com.book.common.bean.Result;
import com.book.entity.Shoppingcar;

import java.util.List;

public interface IShoppingcarService {

    /**
     * 查询所有购物车
     * @return
     */
    Result queryShoppingcarList();

}
