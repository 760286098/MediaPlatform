package com.AnalyzeSystem.common.dto;

import com.AnalyzeSystem.common.PageInfo;
import com.AnalyzeSystem.common.vo.ArticleVO;

import java.io.Serializable;
import java.util.List;
public class ArticlePageDTO implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * article 列表信息
     */
    private List<ArticleVO> articleVOs;

    /**
     * 分页信息
     */
    private PageInfo pageInfo;

    public ArticlePageDTO(List<ArticleVO> articleVOs, PageInfo pageInfo)
    {
        super();
        this.articleVOs = articleVOs;
        this.pageInfo = pageInfo;
    }

    public List<ArticleVO> getArticleVOs() {
        return articleVOs;
    }

    public void setArticleVOs(List<ArticleVO> articleVOs) {
        this.articleVOs = articleVOs;
    }

    public PageInfo getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(PageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }

}

