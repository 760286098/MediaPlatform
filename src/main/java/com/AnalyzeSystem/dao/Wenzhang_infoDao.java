package com.AnalyzeSystem.dao;

import com.AnalyzeSystem.common.ArticleInfo;
import com.AnalyzeSystem.model.Wenzhang_info;

import java.util.List;

public interface Wenzhang_infoDao {

    List<Wenzhang_info> selectArticleByMpId(int mp_id);

    Wenzhang_info selectArticleById(int _id);

    Wenzhang_info selectArticleByName(String title);

    List<ArticleInfo> selectAllArticles();//获得文章的统计信息

    ArticleInfo selectInfoById(int id);
}
