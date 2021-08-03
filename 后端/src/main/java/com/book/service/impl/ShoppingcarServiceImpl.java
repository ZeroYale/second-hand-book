package com.book.service.impl;

import com.book.common.bean.Result;
import com.book.entity.Shoppingcar;
import com.book.mapper.ShoppingcarMapper;
import com.book.service.IShoppingcarService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ShoppingcarServiceImpl implements IShoppingcarService {

    @Autowired
    private ShoppingcarMapper shoppingcarMapper;

    @Override
    public Result queryShoppingcarList() {
        log.info("查找所有购物车中...");
        List<Shoppingcar> list =  this.shoppingcarMapper.selectAll();
        return Result.createWithModel(list);
    }
}
