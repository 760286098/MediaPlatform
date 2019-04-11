package com.AnalyzeSystem.controller;

import com.AnalyzeSystem.common.PageInfo;
import com.AnalyzeSystem.common.ReturnCodes.CommonReturnCode;
import com.AnalyzeSystem.common.ReturnCodes.LoginReturnCode;
import com.AnalyzeSystem.common.WebPageResult;
import com.AnalyzeSystem.common.WebResult;
import com.AnalyzeSystem.common.dto.ArticlePageDTO;
import com.AnalyzeSystem.model.UserInfo;
import com.AnalyzeSystem.service.ArticleService;
import com.AnalyzeSystem.service.UserInfoService;
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
    private ArticleService articleService;

    @Autowired
    private HttpSession session;




    @GetMapping(value = "/dataAnalyze/dataTotal/view")
    public String dataTotal(Model model) {
        return "/dataAnalyze/dataTotal";
    }

    @GetMapping(value = "/dataAnalyze/dataTotal/") //每次页面加载都会调用
    @ResponseBody
    public Object listArticle(PageInfo pageInfo, @RequestParam(required = false, value = "search")String search)
    {
        //参数string为bootstraptable在初始化时确定的量，若为真，则记录用户input的string为search
        //bootstraptable的search功能没有实现

        ArticlePageDTO articlePageDTO = articleService.listByPage(pageInfo,search);
        return new WebPageResult(articlePageDTO.getArticleVOs(),articlePageDTO.getPageInfo().getTotal());

    }

    @GetMapping(value = "/dataAnalyze/dataDiagram/view")
    public String dataDiagram(Model model) {
        return "/dataAnalyze/dataDiagram";
    }

}
