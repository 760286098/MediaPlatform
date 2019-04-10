package com.AnalyzeSystem.controller;

import com.AnalyzeSystem.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class socialController {
    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private HttpSession session;


    //目前homepage没有什么业务，写几个响应get请求的mapping


    @GetMapping(value = "/system/social")
    public String social(Model model) {
        return "social/social";
    }
}
