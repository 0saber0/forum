package com.milanuo.springboot2mybatisforum.core.Query4Object;

public class Query4Topics {
    private Integer id;
    private Integer pageNum;
    private Integer pageSize;

    public Integer getStart() {
        return (pageNum - 1) * pageSize;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }
}
