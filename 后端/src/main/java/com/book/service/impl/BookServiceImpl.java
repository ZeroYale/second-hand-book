package com.book.service.impl;

import com.book.common.PageResult;
import com.book.common.bean.Result;
import com.book.entity.Book;
import com.book.mapper.BookMapper;
import com.book.service.IBookService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
@Slf4j
public class BookServiceImpl implements IBookService {

    @Autowired
    private BookMapper bookMapper;

    @Override
    public Result queryBookList() {
        List<Book> list =  this.bookMapper.selectAll();
        return Result.createWithModel(list);
    }

    @Override
    public void saveBook(Book book) {
        log.info("新增图书中...");
        this.bookMapper.insertSelective(book);
        log.info("新增图书完成...");
    }

    @Override
    public void deleteBookById(Long id) {
        log.info("删除图书中...");
        Book book = this.bookMapper.selectByPrimaryKey(id);
        this.bookMapper.delete(book);
    }



    /**傻逼方法
    @Override
    public Book queryBookById(String id, String image, String name, long price, String detail,String author) {
        log.info("修改图书中...");
        Book record =  this.bookMapper.selectById(Integer.parseInt(id));
        Book book = new Book();
        book.setAuthor(author);
        book.setId(record.getId());
        book.setCategory_name(record.getCategory_name());
        book.setImage(image);
        book.setName(name);
        book.setDetail(detail);
        book.setPrice(price);
        log.info("image---->" + book.getImage());
        this.bookMapper.updateByPrimaryKey(book);
        return book;
    }
*/
    /**
     * 智慧的方法
     * @param book
     * @return
     */
    @Override
    public Book updateBookById(Book book) {
        Book record = new Book();
        record.setAuthor(book.getAuthor());
        record.setId(book.getId());
        record.setDetail(book.getDetail());
        record.setImage(book.getImage());
        record.setName(book.getName());
        record.setCategory_name("无");
        record.setPrice(book.getPrice());
        return record;
    }




    /**
     * 根据查询条件分页并排序查询品牌信息
     * @param key
     * @param page
     * @param rows
     * @param sortBy
     * @param desc
     * @return
     */
    public PageResult<Book> queryBrandsByPage(String key, Integer page, Integer rows, String sortBy, Boolean desc) {

        //初始化example对象
        Example example = new Example(Book.class);
        Example.Criteria criteria = example.createCriteria();

        //根据name模糊查询，或者根据首字母查询
        if(StringUtils.isNotBlank(key)){
            criteria.andLike("name","%"+ key+"%").orEqualTo("price",key);
        }

        //添加分页条件
        PageHelper.startPage(page,rows);

        //添加排序条件
        if(StringUtils.isNotBlank(sortBy)){
            example.setOrderByClause(sortBy + " " + (desc ? "desc":"asc"));
        }
        List<Book> brands = this.bookMapper.selectByExample(example);
        //包装成pageInfo
        PageInfo<Book> pageInfo = new PageInfo<>(brands);
        //包装成分页结果集返回
        return new PageResult<>(pageInfo.getTotal(),pageInfo.getList());
    }
    /**
     * 根据查询条件分页并排序查询品牌信息
     * @param key
     * @param page
     * @param rows
     * @return
     */
    public PageResult<Book> queryBrandsByPage(String key, Integer page, Integer rows) {

        //初始化example对象
        Example example = new Example(Book.class);
        Example.Criteria criteria = example.createCriteria();
        log.info("key: "+ key +" -- page : " + page + " --  rows : "+ rows);
        //根据name模糊查询
        if(StringUtils.isNotBlank(key)){
            criteria.andLike("name","%"+ key+"%").orEqualTo("name",key).orEqualTo("author",key).orEqualTo("category_name",key);
        }

        //添加分页条件
        PageHelper.startPage(page,rows);

        List<Book> brands = this.bookMapper.selectByExample(example);
        //包装成pageInfo
        PageInfo<Book> pageInfo = new PageInfo<>(brands);
        //包装成分页结果集返回
        return new PageResult<>(pageInfo.getTotal(),pageInfo.getList());
    }
}
