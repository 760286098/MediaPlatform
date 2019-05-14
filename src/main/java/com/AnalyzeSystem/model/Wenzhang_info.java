package com.AnalyzeSystem.model;

import java.util.Date;

public class Wenzhang_info {
    private int _id;
    private String title;
    private String source_url;
    private String cover_url;
    private String description;
    private Date date_time;
    private int mp_id;
    private String content_url;
    private String author;
    private int qunfa_id;
    private int msg_index;
    private String content;
    private int likes;
    private int browse_times;
    private int comments;
    private String wordCloud_Graph;


    public String getWordCloud_Graph() {
        return wordCloud_Graph;
    }

    public void setWordCloud_Graph(String wordCloud_Graph) {
        this.wordCloud_Graph = wordCloud_Graph;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int get_id() {
        return _id;
    }

    public void set_id(int _id) {
        this._id = _id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSource_url() {
        return source_url;
    }

    public void setSource_url(String source_url) {
        this.source_url = source_url;
    }

    public String getCover_url() {
        return cover_url;
    }

    public void setCover_url(String cover_url) {
        this.cover_url = cover_url;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDate_time() {
        return date_time;
    }

    public void setDate_time(Date date_time) {
        this.date_time = date_time;
    }

    public int getMp_id() {
        return mp_id;
    }

    public void setMp_id(int mp_id) {
        this.mp_id = mp_id;
    }

    public String getContent_url() {
        return content_url;
    }

    public void setContent_url(String content_url) {
        this.content_url = content_url;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getQunfa_id() {
        return qunfa_id;
    }

    public void setQunfa_id(int qunfa_id) {
        this.qunfa_id = qunfa_id;
    }

    public int getMsg_index() {
        return msg_index;
    }

    public void setMsg_index(int msg_index) {
        this.msg_index = msg_index;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getBrowse_times() {
        return browse_times;
    }

    public void setBrowse_times(int browse_times) {
        this.browse_times = browse_times;
    }

    public int getComments() {
        return comments;
    }

    public void setComments(int comments) {
        this.comments = comments;
    }


}
