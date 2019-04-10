package com.AnalyzeSystem.common.ReturnCodes;

public enum CommonReturnCode implements IReturnCode{
    FAILED(0, "failed"),
    SUCCESS(1, "success"),
    UNKNOWN_ERROR(-1, "未知错误"),
    OK(200, "请求成功"),
    BAD_REQUEST(400, "请求参数出错"),
    UNAUTHORIZED(401, "您未登录或者登录已超时,请先登录!"),
    FORBIDDEN(403, "没有权限"),
    NOT_FOUND(404, "找不到页面"),
    RESOURCE_NOT_FOUND(500,"资源无法加载");

    /**
     * 返回状态码
     */
    private Integer code;

    /**
     * 返回消息
     */
    private String message;

    private CommonReturnCode(Integer code, String message) {
        this.code = code;
        this.message = message;
    }


    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
