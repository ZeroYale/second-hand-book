package com.book.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import java.util.Date;
@Data
@ToString
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String phone;
    private String username;
    @Length(min = 6, max = 30,message = "密码必须在6-30位之间")
    //@JsonIgnore //对象序列化为json字符串时，忽略该属性
    private String password;
    private Date create_at; // 创建时间
    private Long books_num;// 所卖的书本数量
    private Long status; //0表示普通用户 1表示管理员
}
