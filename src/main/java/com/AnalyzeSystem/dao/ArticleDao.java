package com.AnalyzeSystem.dao;

import com.AnalyzeSystem.common.PageInfo;
import com.AnalyzeSystem.common.vo.ArticleVO;
import com.AnalyzeSystem.model.Article;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

public interface ArticleDao{

    void insertArticle(@Param("article")Article article);

    Article selectArticleById(String articleId);

    Article selectArticleByTitle(String title);

    void deleteArticle(String articleId);

    List<ArticleVO> listByPage(@Param("pageInfo")PageInfo pageInfo, @Param("search")String search,RowBounds rowBounds);

}
