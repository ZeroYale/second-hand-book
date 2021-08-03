package com.book.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class AliOSSConstants {

    private static String endpoint;

    private static String accessKeyId;

    private static String accessKeySecret;

    private static String accessBucketName;

    private static String accessFilehost;

    /**
     * 从yml读取
     * @return
     */
    @Value("${aliyun.config.ossEndPoint}")
    private String endPoint;

    @Value("${aliyun.config.accessKeyId}")
    private String accessKey;

    @Value("${aliyun.config.accessKeySecret}")
    private String secretKey;

    @Value("${aliyun.config.bucketName}")
    private String bucket;

    @Value("${aliyun.config.filehost}")
    private String filehost;


    //利用@PostConstruct将yml中配置的值赋给本地的变量
    @PostConstruct
    public void initParameter(){
        endpoint = this.endPoint;
        accessKeyId = this.accessKey;
        accessKeySecret = this.secretKey;
        accessBucketName = this.bucket;
        accessFilehost = this.filehost;
    }

    public static String getEndpoint() {
        return endpoint;
    }

    public static String getAccessKeyId() {
        return accessKeyId;
    }

    public static String getAccessKeySecret() {
        return accessKeySecret;
    }

    public static String getAccessBucketName() {return accessBucketName;}

    public static String getAccessFilehost() {return accessFilehost;}
}
