package com.AnalyzeSystem.controller;

import com.AnalyzeSystem.common.ReturnCodes.CommonReturnCode;
import com.AnalyzeSystem.common.ReturnCodes.RegisterReturnCode;
import com.AnalyzeSystem.common.WebResult;
import com.AnalyzeSystem.model.UserInfo;
import com.AnalyzeSystem.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class InfoController {
    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private HttpSession session;


    @GetMapping(value = "/info/viewPersonInfo/view")
    public String viewPersonInfo(Model model) {
        return "/info/viewPersonInfo";
    }

    @GetMapping(value = "/info/changePersonInfo/view")
    public String changePersonInfo(Model model) {
        return "/info/changePersonInfo";
    }

    @PostMapping(value = "/changeInfo")
    @ResponseBody
    public Object changeInfo(@RequestParam("departmentName") String departmentName,
                             @RequestParam("studentNumber") String studentNumber,
                             @RequestParam("phoneNumber") String phoneNumber,
                             @RequestParam("startYear") String startYear,
                             @RequestParam("description") String description,
                             HttpSession session)
    {
        UserInfo oldUser = (UserInfo) session.getAttribute("userInfo");

        UserInfo newUser = new UserInfo();

        newUser.setUserId(oldUser.getUserId());
        newUser.setPassword(oldUser.getPassword());
        newUser.setName(oldUser.getName());
        newUser.setDepartmentName(departmentName);
        newUser.setStudentNumber(studentNumber);
        newUser.setPhoneNumber(phoneNumber);
        newUser.setStartYear(startYear);
        newUser.setDescription(description);
        newUser.setRegisterTime(oldUser.getRegisterTime());

        try
        {
            userInfoService.updateUser(newUser); //通过update的方式去修改现有的user
            session.setAttribute("userInfo",newUser);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return new WebResult(RegisterReturnCode.ADDTO_DATABASE_FAILED);
        }

        return new WebResult(CommonReturnCode.SUCCESS);
    }

}
