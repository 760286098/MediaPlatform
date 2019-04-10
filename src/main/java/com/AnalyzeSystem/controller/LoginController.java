package com.AnalyzeSystem.controller;

import com.AnalyzeSystem.common.ReturnCodes.CommonReturnCode;
import com.AnalyzeSystem.common.ReturnCodes.LoginReturnCode;
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


/**
 * SpringMVC的控制器controller，相当于web项目中的servlet
 * 拦截/响应一个请求，并给出请求的处理方法
 */

/*
   @RequestMapping("/test")
   public class TestController
   {
        @RequestMapping("/m01")
        public String m01()
        {
             return "m01";
        }
   }
   如果在类上配置了@RequestMapping,则整个url访问路径为
   http://localhost:8080/项目名/test/m01.do
 */

@Controller
public class LoginController {

    @Autowired
    private UserInfoService userInfoService; //自动寻找合适的service的bean（UserInfoServiceImpl）并注入

    private HttpServletRequest request;

    /**
     * GET 登陆页面
     * @param model
     * @return
     */
    @GetMapping(value = "/login")
    public String getLoginPage(Model model){
        return "/login/login";
    }

    /**
     * POST 登录信息
     * @param loginName
     * @param loginPassword
     * @return
     */
    @PostMapping(value = "/login")
    @ResponseBody
    public Object login(@RequestParam(required = false, value = "loginName") String loginName,
                        @RequestParam(required = false, value = "loginPassword") String loginPassword,
                        HttpSession session)
    {

        String msg = "";
        //根据登入名字判断此用户是否存在
        UserInfo user = userInfoService.selectUserByName(loginName);

        if(user == null)
        {
            return new WebResult(LoginReturnCode.USER_NOT_EXIST);
        }
        else
        {
            if(user.getPassword().equals(loginPassword))
            {
                /*model.addAttribute("userInfo",user);*/
                session.setAttribute("userInfo",user);
                return new WebResult(CommonReturnCode.SUCCESS);
            }
            else
            {
                return new WebResult(LoginReturnCode.WRONG_PASSWORD);
            }
        }
    }

}


  /*  *//**
     * 用户登入
     * @param userInfo
     * @return
     *//*
    @RequestMapping("login")
    public String login(UserInfo userInfo, Model model)
    {
        String msg = "";
        //根据登入名字判断此用户是否存在
        UserInfo user = userInfoService.selectUserByName(userInfo.getName());

        if(user == null)
        {
            msg = "用户不存在！";
        }
        else
        {
            if(user.getPassword().equals(userInfo.getPassword()))
            {
                //验证成功
                model.addAttribute("userInfo",user);
                return "homepage";
            }
            else
            {
                msg = "密码错误";
            }
        }
        model.addAttribute("msg",msg);
        return "login";
    }


}*/



