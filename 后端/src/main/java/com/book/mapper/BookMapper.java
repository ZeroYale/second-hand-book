package com.book.mapper;

import com.book.entity.Book;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.common.Mapper;

public interface BookMapper extends Mapper<Book> {

    @Select("Select * from book where id=#{id} ")
    Book selectById(int id);
}
