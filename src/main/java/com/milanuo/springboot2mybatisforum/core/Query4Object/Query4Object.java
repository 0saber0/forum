package com.milanuo.springboot2mybatisforum.core.Query4Object;

import java.io.Serializable;

/**
 * 查询条件封装
 */
public class Query4Object implements Serializable {
    private String keyWord;//关键字查询
    private Boolean default1 = true;//默认全查
    private Boolean good;//查询精华
    private Integer pageNum = 1;//查询结果显示第几页，默认未第一页
    private Integer pageSize = 17;//每页最多显示几条数据，默认为17条
    private Boolean newest;//查询最新的文章
    private Boolean zeroComment;//查询评论数为0的文章

    public String getKeyWord() {
        return this.notEmpty(this.keyWord) ? keyWord : null;
    }

    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    public Boolean getDefault1() {
        return default1;
    }

    public void setDefault1(Boolean default1) {
        this.default1 = default1;
    }

    public Boolean getZeroComment() {
        return zeroComment;
    }

    public void setZeroComment(Boolean zeroComment) {
        this.zeroComment = zeroComment;
        this.default1 = false;
    }

    public Integer getStart() {
        return (pageNum - 1) * pageSize;
    }

    public Boolean getNewest() {
        return newest;
    }

    public void setNewest(Boolean newest) {
        this.newest = newest;
        this.default1 = false;
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

    public Boolean getGood() {
        return good;
    }

    public void setGood(Boolean good) {
        this.good = good;
        this.default1 = false;
    }

    /**
     * 判断字符串是否为空或空串
     *
     * @param obj
     * @return
     */
    private Boolean notEmpty(String obj) {
        return obj != null && !"".equals(obj.trim());
    }
}
