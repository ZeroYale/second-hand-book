package com.book.entity;


import lombok.Data;
import lombok.ToString;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

@Data
@ToString
@Table(name = "address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String detail; //书本描述

    private String acceptusername; //收货人名字
    @Pattern(regexp = "^1[356789]\\d{9}$",message = "手机号不合法")
    private String phone; //收货人手机号
    private Long status; //商品状态 1表示已发货 2表示已收货 0表示未发货
    private String province; //收货人省份
    private String city; //收货人城市
    private String area; //收货人地址
}
