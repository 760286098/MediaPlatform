package com.AnalyzeSystem.common.vo;

import com.baomidou.mybatisplus.annotations.TableField;

import com.AnalyzeSystem.model.Article;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * VO（View Object）：视图对象，用于展示层，它的作用是把某个指定页面（或组件）的所有数据封装起来。
 */

public class ArticleVO extends Article {
    private static final long serialVersionUID = 1L;

    /**
     * article id
     */
    @TableId(value = "article_id",type=IdType.AUTO)
    private String articleId;

    /**
     * title
     */
    @TableField("title")
    private String title;

    /**
     * content
     */
    @TableField("content")
    private String content;

    @Override
    public String getArticleId() {
        return articleId;
    }

    @Override
    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    @Override
    public String getTitle() {
        return title;
    }

    @Override
    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String getContent() {
        return content;
    }

    @Override
    public void setContent(String content) {
        this.content = content;
    }
}

