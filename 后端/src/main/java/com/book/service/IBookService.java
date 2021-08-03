package com.book.service;

import com.book.common.PageResult;
import com.book.common.bean.Result;
import com.book.entity.Book;

import java.util.List;

public interface IBookService {
    /**
     * 查询所有书本
     * @return
     */
    Result queryBookList();

    /**
     * 新增书本
     * @param book
     */
    void saveBook(Book book);

    /**
     * 根据id删除书本
     * @param id
     */
    void deleteBookById(Long id);


    Book updateBookById(Book book);

 //   PageResult<Book> queryBrandsByPage(String key, Integer page, Integer rows, String sortBy, Boolean desc);

    PageResult<Book> queryBrandsByPage(String key, Integer page, Integer rows);
}
