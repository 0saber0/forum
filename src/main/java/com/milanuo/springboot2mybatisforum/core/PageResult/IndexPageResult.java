package com.milanuo.springboot2mybatisforum.core.PageResult;

import com.milanuo.springboot2mybatisforum.module.topic.pojo.Topic;
import com.milanuo.springboot2mybatisforum.module.user.pojo.User;

import java.io.Serializable;

public class IndexPageResult implements Serializable{
    private User user;
    private Topic topic;
    private Integer replyCount;

    public Integer getReplyCount() {
        return replyCount;
    }

    public void setReplyCount(Integer replyCount) {
        this.replyCount = replyCount;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }
}
