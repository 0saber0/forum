package com.milanuo.springboot2mybatisforum.core.PageResult;

import com.milanuo.springboot2mybatisforum.module.reply.pojo.Reply;
import com.milanuo.springboot2mybatisforum.module.user.pojo.User;

import java.io.Serializable;

public class ReplyResult implements Serializable{

    private Reply reply;
    private User user;

    public Reply getReply() {
        return reply;
    }

    public void setReply(Reply reply) {
        this.reply = reply;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
