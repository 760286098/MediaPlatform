package com.AnalyzeSystem.common;
import java.util.Date;

public class ArticleInfo {
    int mp_id;
    int likes;
    int browse_times;
    int comments;
    Date date;

    public int getMp_id() {
        return mp_id;
    }

    public void setMp_id(int mp_id) {
        this.mp_id = mp_id;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
