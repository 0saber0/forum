package com.milanuo.springboot2mybatisforum.core.PageResult;

import java.io.Serializable;

public class BasePageResult implements Serializable {
    private Integer pageNum;
    private Integer pageSize;
    private Integer totalCount;

    public Integer getTotalPage() {
        return (totalCount % pageSize) == 0 ? (totalCount / pageSize) : (totalCount / pageSize) + 1;
    }

    public Integer getPrevPage() {
        return (pageNum - 1) > 0 ? (pageNum - 1) : 1;
    }

    public Integer getNextPage() {
        return (pageNum + 1) > this.getTotalPage() ? (this.getTotalPage()) : (pageNum + 1);
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }
}
