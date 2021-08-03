package com.book.controller;

import com.book.common.AliOSSConstants;
import com.book.utils.AliyunOSSUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

@RestController
@RequestMapping("/upload")
@Slf4j
public class UploadController {
    @Autowired
    private AliyunOSSUtil aliyunOSSUtil;
    @Autowired
    private AliOSSConstants constantProperties;



    @PostMapping("/toUpload")
    public String toUploadBlogPost(@RequestParam("file")MultipartFile file) {
        log.info("=========>文件上传");
        String uploadUrl =null;
        try {

            if (null != file) {
                String filename = file.getOriginalFilename();
                if (!"".equals(filename.trim())) {
                    File newFile = new File(filename);
                    FileOutputStream os = new FileOutputStream(newFile);
                    os.write(file.getBytes());
                    os.close();
                    file.transferTo(newFile);
                    //上传到OSS
                    uploadUrl = aliyunOSSUtil.upload(newFile);

                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "http://bookshop2.oss-cn-beijing.aliyuncs.com/" + uploadUrl;
    }

    @GetMapping("/getObjectList")
    public List<String> getObjectList() {
        String bucketName = constantProperties.getAccessBucketName();
        System.out.println(bucketName);
        List<String> objectList = aliyunOSSUtil.getObjectList(bucketName);
        return objectList;
    }

    @GetMapping("/delete")
    public String deleteBlog(@RequestParam("key")String key){
        aliyunOSSUtil.deleteBlog(key);
        return "删除成功";
    }
}