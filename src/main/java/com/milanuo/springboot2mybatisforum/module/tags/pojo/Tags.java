package com.milanuo.springboot2mybatisforum.module.tags.pojo;

import java.io.Serializable;

public class Tags implements Serializable{
    private Integer id;

    private String tag;

    private String describ;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag == null ? null : tag.trim();
    }

    public String getDescrib() {
        return describ;
    }

    public void setDescrib(String describ) {
        this.describ = describ == null ? null : describ.trim();
    }
}