package com.book.common.bean;


import com.book.common.constants.ResultConstants;
import com.book.common.enums.ErrorEnum;
import lombok.Data;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.StringUtils;

/**
 * 用于向前端返回统一的结果对象
 *
 * @param <T>
 */
@Data
@Accessors(chain = true)
public class Result<T> {

    private String code; // 结果编码
    private String message; // 提示信息
    private T data; // 结果对象


    // 禁止空参构造
    private Result() {
    }



    public static <T> Result<T> createWithSuccessMessage() {
        Result result = new Result();
        result.setCode(ResultConstants.OPERATION_SUCCESS);
        result.setMessage(ResultConstants.SUCCESS_MESSAGE);
        return result;
    }

    public static <T> Result<T> createWithSuccessMessage(String message) {
        Result result = new Result();
        result.setCode(ResultConstants.OPERATION_SUCCESS);
        result.setMessage(StringUtils.isBlank(message) ? ResultConstants.SUCCESS_MESSAGE : message);
        return result;
    }

    public static <T> Result<T> createWithModel(T data) {
        Result result = createWithSuccessMessage();
        result.setData(data);
        return result;
    }

    public static <T> Result<T> createWithModel(String message, T data) {
        Result result = createWithSuccessMessage(message);
        result.setData(data);
        return result;
    }



    public static <T> Result<T> createWithErrorMessage(String message, String errorCode) {
        Result result = new Result();
        result.setMessage(message);
        result.setCode(errorCode);
        return result;
    }

    public static <T> Result<T> createWithErrorMessage(String message) {
        Result result = new Result();
        result.setMessage(message);
        return result;
    }

    public static <T> Result<T> createWithErrorMessage(ErrorEnum errorEnum) {
        return createWithErrorMessage(errorEnum.getMsg(errorEnum.getCode()), errorEnum.getCode());
    }

    public static <T> Result<T> createWithError() {
        return createWithErrorMessage(ErrorEnum.ERROR);
    }
}
