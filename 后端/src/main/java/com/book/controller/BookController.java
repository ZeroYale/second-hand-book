package com.book.controller;


import com.book.common.PageResult;
import com.book.common.bean.Result;
import com.book.entity.Book;
import com.book.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;


@RestController
@RequestMapping("/book")
public class BookController {

    @Autowired
    private IBookService bookService;

    @RequestMapping("/list")
    public Result queryBookList() {
        return this.bookService.queryBookList();
    }

    @PostMapping("/save")
    public Result saveBook(@RequestBody Book book) {
        this.bookService.saveBook(book);
        return Result.createWithSuccessMessage();
    }

    @RequestMapping("/delete")
    public Result deleteBookById(@RequestBody HashMap<String, String> map) {
        this.bookService.deleteBookById(Long.parseLong(map.get("id")));
        return Result.createWithSuccessMessage();
    }


    @RequestMapping("/update")
    public Result updateBookById(@RequestBody Book book){

        Book record = this.bookService.updateBookById(book);
        return Result.createWithModel(record);
    }

    /**
     * 根据查询条件分页并排序查询品牌信息
     *
     * @return
     */
    @PostMapping("page")
    public Result queryBrandByPage(@RequestBody HashMap<String, String> map){
        String searchContent = map.get("searchContent");
        Integer pageNum = Integer.parseInt(map.get("pageNum"));
        Integer pageSize = Integer.parseInt(map.get("pageSize"));
        PageResult<Book> result = this.bookService.queryBrandsByPage(searchContent,pageNum,pageSize);
        return Result.createWithModel(result);
    }

}
