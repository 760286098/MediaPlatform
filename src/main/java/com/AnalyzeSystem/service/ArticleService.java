package com.AnalyzeSystem.service;

import com.AnalyzeSystem.common.PageInfo;
import com.AnalyzeSystem.common.dto.ArticlePageDTO;
import com.AnalyzeSystem.model.Article;

import java.util.List;

public interface ArticleService {

    void insertArticle(Article article);

    Article selectArticleById(String articleId);

    Article selectArticleByTitle(String title);

    void deleteArticle(String articleId);

    ArticlePageDTO listByPage(PageInfo pageInfo, String search);



}
