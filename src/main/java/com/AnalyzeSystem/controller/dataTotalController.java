package com.AnalyzeSystem.controller;

import com.AnalyzeSystem.common.PageInfo;
import com.AnalyzeSystem.common.ReturnCodes.CommonReturnCode;
import com.AnalyzeSystem.common.ReturnCodes.LoginReturnCode;
import com.AnalyzeSystem.common.WebPageResult;
import com.AnalyzeSystem.common.WebResult;
import com.AnalyzeSystem.common.dto.ArticlePageDTO;
import com.AnalyzeSystem.model.Mp_info;
import com.AnalyzeSystem.model.UserInfo;
import com.AnalyzeSystem.model.Wenzhang_info;
import com.AnalyzeSystem.service.ArticleService;
import com.AnalyzeSystem.service.Mp_infoService;
import com.AnalyzeSystem.service.UserInfoService;
import com.AnalyzeSystem.service.Wenzhang_infoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class dataTotalController {

    @Autowired
    private Wenzhang_infoService wenzhang_infoService;

    @Autowired
    private HttpSession session;

    @Autowired
    private Mp_infoService mp_infoService;




    @GetMapping(value = "/dataAnalyze/dataTotal/view")
    public String dataTotal(Model model,HttpSession session) {

        List<Mp_info> mp_infos = mp_infoService.selectAll();
        session.setAttribute("mp_infos",mp_infos);
        return "/dataAnalyze/dataTotal";
    }

    /*@GetMapping(value = "/dataAnalyze/dataTotal/") //每次页面加载都会调用
    @ResponseBody
    public Object listArticle(PageInfo pageInfo, @RequestParam(required = false, value = "search")String search)
    {
        //参数string为bootstraptable在初始化时确定的量，若为真，则记录用户input的string为search
        //bootstraptable的search功能没有实现

        ArticlePageDTO articlePageDTO = articleService.listByPage(pageInfo,search);
        return new WebPageResult(articlePageDTO.getArticleVOs(),articlePageDTO.getPageInfo().getTotal());

    }*/



    @GetMapping(value = "/dataAnalyze/dataDiagram/view")
    public String dataDiagram(Model model) {
        return "/dataAnalyze/dataDiagram";
    }

    @GetMapping(value = "/showArticles")
    @ResponseBody
    public Object data_AllArticles(@RequestParam("mpId")String mpId,
                                   HttpSession session)
    {
        List<Wenzhang_info> wenzhang_infos = wenzhang_infoService.selectArticleByMpId(Integer.parseInt(mpId));
        session.setAttribute("currentArticleList",wenzhang_infos);

        return new WebResult(CommonReturnCode.SUCCESS);
    }

    @GetMapping(value = "/dataAnalyze/data_ArticleList/view")
    public String data_showAllArticles(Model model) {
        return "/dataAnalyze/data_ArticleList";
    }

    //showArticleDetailUsingName
    @GetMapping(value = "/showArticleDetailUsingName")
    @ResponseBody
    public Object data_RecentArticle(@RequestParam("articleName")String articleName,
                                   HttpSession session)
    {
        Wenzhang_info currentArticle = wenzhang_infoService.selectArticleByName(articleName);

        currentArticle.setContent(currentArticle.getContent().replaceAll(" ","&nbsp").replaceAll("\r\n","<br>"));
        session.setAttribute("currentArticle",currentArticle);
        return new WebResult(CommonReturnCode.SUCCESS);
    }


    @GetMapping(value = "/showArticleDetail")
    @ResponseBody
    public Object data_ArticleDetail(@RequestParam("articleId")String articleId,
                                     HttpSession session)
    {
        Wenzhang_info currentArticle = wenzhang_infoService.selectArticleById(Integer.parseInt(articleId));
        currentArticle.setContent(currentArticle.getContent().replaceAll(" ","&nbsp").replaceAll("\r\n","<br>"));
        session.setAttribute("currentArticle",currentArticle);
        return new WebResult(CommonReturnCode.SUCCESS);
    }


    @GetMapping(value = "/dataAnalyze/data_ArticleDetails/view")
    public String data_showAllArticleDetails(Model model) {
        return "/dataAnalyze/data_ArticleDetails";
    }
}
