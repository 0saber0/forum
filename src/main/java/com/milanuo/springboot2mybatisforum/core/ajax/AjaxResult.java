package com.milanuo.springboot2mybatisforum.core.ajax;

import java.io.Serializable;

public class AjaxResult implements Serializable {

    private Boolean successful;
    private String describe;
    private Object datas;

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public Object getDatas() {
        return datas;
    }

    public void setDatas(Object datas) {
        this.datas = datas;
    }

    public Boolean getSuccessful() {
        return successful;
    }

    public void setSuccessful(Boolean successful) {
        this.successful = successful;
    }
}
