package com.AnalyzeSystem.controller;

import com.AnalyzeSystem.common.MessagePack;
import com.AnalyzeSystem.common.ReturnCodes.CommonReturnCode;
import com.AnalyzeSystem.common.WebResult;
import com.AnalyzeSystem.model.Message;
import com.AnalyzeSystem.model.UserInfo;
import com.AnalyzeSystem.service.MessageService;
import com.AnalyzeSystem.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class socialController {
   /* @Autowired
    private UserInfoService userInfoService;*/
    @Autowired
    private MessageService messageService;

    @Autowired
    private HttpSession session;

    @GetMapping(value = "/social/social/view")
    public String social(Model model) {
        return "/social/social";
    }

    @GetMapping(value = "/social/social/")
    @ResponseBody
    public Object loadMessage(HttpSession session)
    {

         int lastestMessageId = messageService.getLastestMessageId();

         Message lastestMessage = messageService.selectMessageById(lastestMessageId);

         String userName = messageService.selectUserNameByIdInMessage(lastestMessageId);

        String theTitle = lastestMessage.getTitle();
        String theContent = lastestMessage.getContent();
        Date theTime = lastestMessage.getTime();

        MessagePack messagePack = new MessagePack();
        messagePack.setTitle(theTitle);
        messagePack.setContent(theContent);
        messagePack.setUserName(userName);
        messagePack.setDate(theTime.toString());

        session.setAttribute("messagePack",messagePack);

        return new WebResult(CommonReturnCode.SUCCESS);
        /*try {
            int lastestMessageId = messageService.getLastestMessageId();

            Message lastestMessage = messageService.selectMessageById(lastestMessageId);

            int userId = lastestMessage.getUserId();

            UserInfo thePublisher = userInfoService.selectUserById(userId); //根据message表中对应的user

            String theTitle = lastestMessage.getTitle();
            String theContent = lastestMessage.getContent();
            String theUserName = thePublisher.getName();
            Date theTime = lastestMessage.getTime();

            MessagePack messagePack = new MessagePack();
            messagePack.setTitle(theTitle);
            messagePack.setContent(theContent);
            messagePack.setUserName(theUserName);
            messagePack.setDate(theTime.toString());

            session.setAttribute("messagePack",messagePack);
        }catch (Exception e)
        {
            e.printStackTrace();
            return new WebResult(CommonReturnCode.FAILED);
        }



        return new WebResult(CommonReturnCode.SUCCESS);
*/
    }

    @GetMapping(value = "/social/publishMsg/view")
    public String publishMsg(Model model){ return "/social/publishMsg";}

    @GetMapping(value = "/social/msgDetail/view")
    public String msgDetail(Model model){ return "/social/msgDetail";}

    @PostMapping(value = "/publish")
    @ResponseBody
    public Object publish(@RequestParam(required = false,value = "Message_title")String Message_title,
                          @RequestParam(required = false,value = "Message_content")String Message_content,
                          HttpSession session)
    {
        UserInfo user = (UserInfo) session.getAttribute("userInfo");
        int messageid = messageService.getLastestMessageId()+1;

        Message message = new Message();

        message.setMessageId(messageid);
        message.setUserId(user.getUserId());
        message.setTitle(Message_title);
        message.setContent(Message_content);

        Date GMTtime = new Date();

        message.setTime(GMTtime);


        try
        {
            messageService.insertMessage(message);
        }
        catch(Exception e)
        {
            e.printStackTrace();
            return new WebResult(CommonReturnCode.FAILED);
        }
        return new WebResult(CommonReturnCode.SUCCESS);
    }
}
