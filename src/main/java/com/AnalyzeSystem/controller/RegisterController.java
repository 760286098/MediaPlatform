package com.AnalyzeSystem.controller;

import com.AnalyzeSystem.common.ReturnCodes.CommonReturnCode;
import com.AnalyzeSystem.common.ReturnCodes.LoginReturnCode;
import com.AnalyzeSystem.common.ReturnCodes.RegisterReturnCode;
import com.AnalyzeSystem.common.WebResult;
import com.AnalyzeSystem.model.UserInfo;
import com.AnalyzeSystem.service.UserInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.Date;

@Controller
public class RegisterController {

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private HttpServletRequest request;

    /**
     * GET 注册界面
     */
    @GetMapping(value = "/registerPage")
    public String getRegisterPage(Model model){return "/register/register";}


    /**
     * POST 注册信息
     */
    @PostMapping(value = "/register")
    @ResponseBody
    public Object register(@RequestParam("registerName")String registerName,
                           @RequestParam("registerPassword") String registerPassword,
                           @RequestParam("departmentName") String departmentName,
                           @RequestParam("studentNumber") String studentNumber,
                           @RequestParam("phoneNumber") String phoneNumber,
                           @RequestParam("startYear") String startYear,
                           @RequestParam("description")String description)
    {
        /*
         * 准备往表里添加一条注册时间的column
         */
        Date GMTtime = new Date();


        int userid = userInfoService.getLastestUserId()+1; //抽取最新的id+1，预备绑定给新用户

        UserInfo user = new UserInfo();

        user.setUserId(userid);
        user.setName(registerName);
        user.setPassword(registerPassword);
        user.setDepartmentName(departmentName);
        user.setStudentNumber(studentNumber);
        user.setPhoneNumber(phoneNumber);
        user.setStartYear(startYear);
        user.setDescription(description);

        //register.js并不会post来的一个column
        user.setRegisterTime(GMTtime);

        try
        {
            userInfoService.insertUser(user);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return new WebResult(RegisterReturnCode.ADDTO_DATABASE_FAILED);
        }

        return new WebResult(CommonReturnCode.SUCCESS);

    }



}
