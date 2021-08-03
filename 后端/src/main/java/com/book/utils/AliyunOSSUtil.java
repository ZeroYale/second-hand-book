package com.book.utils;

import com.aliyun.oss.ClientException;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSException;
import com.aliyun.oss.model.*;
import com.book.common.AliOSSConstants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
@Slf4j
public class AliyunOSSUtil {
    @Autowired
    private AliOSSConstants constantProperties;
    private static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

    /**
     * 上传
     * @param file
     * @return
     */
    public  String upload(File file){
        log.info("=========>OSS文件上传开始："+file.getName());
        String endpoint= constantProperties.getEndpoint();
        String accessKeyId= constantProperties.getAccessKeyId();
        String accessKeySecret=constantProperties.getAccessKeySecret();
        String bucketName=constantProperties.getAccessBucketName();
        String fileHost=constantProperties.getAccessFilehost();
        System.out.println(endpoint+"endpoint");

        if(null == file){
            return null;
        }

        OSSClient ossClient = new OSSClient(endpoint,accessKeyId,accessKeySecret);
        try {
            //创建文件路径
            String fileUrl = fileHost+"/"+ file.getName();
            //上传文件
            PutObjectResult result = ossClient.putObject(new PutObjectRequest(bucketName, fileUrl, file));
            //设置权限 这里是公开读
            ossClient.setBucketAcl(bucketName,CannedAccessControlList.PublicRead);
            if(null != result){
                log.info("==========>OSS文件上传成功,OSS地址："+fileUrl);
                return fileUrl;
            }
        }catch (OSSException oe){
            log.error(oe.getMessage());
        }catch (ClientException ce){
            log.error(ce.getMessage());
        }finally {
            //关闭
            ossClient.shutdown();
        }
        return null;
    }


    /**
     * 删除
     * @param fileKey
     * @return
     */
    public  String deleteBlog(String fileKey){
        log.info("=========>OSS文件删除开始");
        String endpoint= constantProperties.getEndpoint();
        String accessKeyId= constantProperties.getAccessKeyId();
        String accessKeySecret=constantProperties.getAccessKeySecret();
        String bucketName=constantProperties.getAccessBucketName();
        String fileHost = constantProperties.getAccessFilehost();
        try {
            OSSClient ossClient = new OSSClient(endpoint,accessKeyId,accessKeySecret);

                log.info("==============>开始删除Object");
                ossClient.deleteObject(bucketName,fileKey);
                log.info("==============>Object删除成功："+fileKey);
                return "==============>Object删除成功："+fileKey;
        }catch (Exception ex){
            log.info("删除Object失败",ex);
            return "删除Object失败";
        }
    }

    /**
     * 查询文件名列表
     * @param bucketName
     * @return
     */
    public List<String> getObjectList(String bucketName){
        List<String> listRe = new ArrayList<>();
        String endpoint= constantProperties.getEndpoint();
        String accessKeyId= constantProperties.getAccessKeyId();
        String accessKeySecret=constantProperties.getAccessKeySecret();
        try {
            log.info("===========>查询文件名列表");
            OSSClient ossClient = new OSSClient(endpoint,accessKeyId,accessKeySecret);
            ListObjectsRequest listObjectsRequest = new ListObjectsRequest(bucketName);
            ObjectListing list = ossClient.listObjects(listObjectsRequest);
            for(OSSObjectSummary objectSummary : list.getObjectSummaries()){
                System.out.println(objectSummary.getKey());
                listRe.add(objectSummary.getKey());
            }
            return listRe;
        }catch (Exception ex){
            log.info("==========>查询列表失败",ex);
            return new ArrayList<>();
        }
    }


}