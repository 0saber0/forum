package com.milanuo.springboot2mybatisforum.core.Query4Object;

public class Query4Topics {
    private Integer id;
    private Integer pageNum;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPageNum() {
        return (pageNum-1)*20;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }
}
