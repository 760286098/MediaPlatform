package com.AnalyzeSystem.model;

import java.util.Date;

public class Message {
    private int messageId;
    private int userId;
    private Date time;
    private String content;
    private String title;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {

        this.messageId = messageId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
