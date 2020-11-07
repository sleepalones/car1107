package com.ssm.domain;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 铭鸽鸽
 * @create 2020/6/15 22:22
 * 数据传输对象
 */
public class InfoDataJson {
    private String msg;
    private String code;
    private Map<String, Object> dataMap = new HashMap<>();

    /**
     * 操作成功时，返回一个存储了成功信息的传输对象
     */
    public static InfoDataJson success(){
        InfoDataJson infoDataJson = new InfoDataJson();
        infoDataJson.setCode("200");
        infoDataJson.setMsg("操作成功");
        return infoDataJson;
    }

    /**
     * 操作失败时，返回一个存储了失败信息的传输对象
     */
    public static InfoDataJson fail(){
        InfoDataJson infoDataJson = new InfoDataJson();
        infoDataJson.setCode("100");
        infoDataJson.setMsg("操作失败");
        return infoDataJson;
    }

    /**
     * 用于添加数据的方法，并使其可以链式操作
     */
    public InfoDataJson addData(String key, Object value){
        this.getDataMap().put(key,value);
        return this;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }
}
