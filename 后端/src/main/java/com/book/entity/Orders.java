package com.book.entity;


import lombok.Data;
import lombok.ToString;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Data
@ToString
@Table(name = "orders")
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long user_id;
    private Long book_id;
    private Long price;
    private Long state; //订单状态 0表示未发货 1表示已发货 2表示已签收
    private String information; //订单简介
    private Date date; //订单日期
}
