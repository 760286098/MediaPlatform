package com.AnalyzeSystem.service.Impl;

import com.AnalyzeSystem.common.PageInfo;
import com.AnalyzeSystem.common.dto.ArticlePageDTO;
import com.AnalyzeSystem.common.vo.ArticleVO;
import com.AnalyzeSystem.dao.ArticleDao;
import com.AnalyzeSystem.model.Article;
import com.AnalyzeSystem.service.ArticleService;

import com.baomidou.mybatisplus.plugins.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("ArticleService") //声明以下类作为service注入
public class ArticleServiceImpl implements ArticleService
{
    @Resource
    private ArticleDao articleDao;

    public void insertArticle(Article article)
    {
        articleDao.insertArticle(article);
    }

    public void deleteArticle(String articleId)
    {
        articleDao.deleteArticle(articleId);
    }

    public Article selectArticleById(String articleId)
    {
        return articleDao.selectArticleById(articleId);
    }

    public Article selectArticleByTitle(String title)
    {
        return articleDao.selectArticleByTitle(title);
    }

    public ArticlePageDTO listByPage(PageInfo pageInfo, String search)
    {
        Page<ArticleVO> page = new Page<>(pageInfo.getCurrent(),pageInfo.getLimit());//分页实体，注意此处page为mybatis-plus扩展框架的类，创建对象没有经过序列化，故不经过spring注入，直接new就行
        List<ArticleVO> articleVOs = articleDao.listByPage(pageInfo, search, page);
        pageInfo.setTotal((int)page.getTotal());
        return new ArticlePageDTO(articleVOs,pageInfo);
    }


}
