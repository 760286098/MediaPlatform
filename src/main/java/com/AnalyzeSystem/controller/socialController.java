package com.AnalyzeSystem.controller;

import com.AnalyzeSystem.common.CommentPack;
import com.AnalyzeSystem.common.MessagePack;
import com.AnalyzeSystem.common.ReturnCodes.CommonReturnCode;
import com.AnalyzeSystem.common.WebResult;
import com.AnalyzeSystem.model.Comment;
import com.AnalyzeSystem.model.Message;
import com.AnalyzeSystem.model.UserInfo;
import com.AnalyzeSystem.service.CommentService;
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class socialController {
   /* @Autowired
    private UserInfoService userInfoService;*/
    @Autowired
    private MessageService messageService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private UserInfoService userInfoService;

    @Autowired
    private HttpSession session;

    @GetMapping(value = "/social/social/view")
    public String social(Model model,HttpSession session) {

        List<Message> oldmessages = messageService.selectAll();
        List<MessagePack> messages = new ArrayList<MessagePack>();
        for(int i=0;i<oldmessages.size();i++)
        {
            MessagePack message = new MessagePack();
            Message oldMessage = oldmessages.get(i);
            message.setTitle(oldMessage.getTitle());
            message.setUserName(messageService.selectUserNameByIdInMessage(oldMessage.getUserId()));
            message.setContent(oldMessage.getContent());

            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            message.setDate(df.format(oldMessage.getTime()));
            message.setMessageId(oldMessage.getMessageId());

            messages.add(message);
        }

        session.setAttribute("messages",messages);
        return "social/social";
    }





    @GetMapping(value = "/social/publishMsg/view")
    public String publishMsg(Model model){ return "/social/publishMsg";}

    @GetMapping(value = "/social/msgDetail/view")
    public String msgDetail(Model model,HttpSession session){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        MessagePack currentMessage = (MessagePack)session.getAttribute("currentMessage");
        try
        {
            List<Comment> oldComments = commentService.selectAllOfCurrentMessage(currentMessage.getMessageId());


            List<CommentPack> comments = new ArrayList<CommentPack>();
            for(int i=0;i<oldComments.size();i++)
            {
                CommentPack comment = new CommentPack();
                Comment oldComment = oldComments.get(i);
                comment.setContent(oldComment.getContent());
                comment.setDate(df.format(oldComment.getTime()));

                int userId = oldComment.getUserId();
                UserInfo commenter = userInfoService.selectUserById(userId);
                comment.setUserName(commenter.getName());

                comments.add(comment);
            }
            session.setAttribute("comments",comments);
        }
        catch(Exception e)
        {
            List<CommentPack> comments = null;
            session.setAttribute("comments",comments);
        }
        return "/social/msgDetail";}

    @GetMapping(value = "/viewDetails")
    @ResponseBody
    public Object viewMsgDetails(@RequestParam("messageId")String messageId,
                                 HttpSession session)
    {
        Message currentMessage = messageService.selectMessageById(Integer.parseInt(messageId));

        MessagePack message = new MessagePack();

        message.setTitle(currentMessage.getTitle());
        message.setUserName(messageService.selectUserNameByIdInMessage(currentMessage.getUserId()));
        message.setContent(currentMessage.getContent());

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        message.setDate(df.format(currentMessage.getTime()));
        message.setMessageId(currentMessage.getMessageId());

        session.setAttribute("currentMessage",message);

        try
        {
            List<Comment> oldComments = commentService.selectAllOfCurrentMessage(Integer.parseInt(messageId));
            List<CommentPack> comments = new ArrayList<CommentPack>();
            for(int i=0;i<oldComments.size();i++)
            {
                CommentPack comment = new CommentPack();
                Comment oldComment = oldComments.get(i);
                comment.setContent(oldComment.getContent());
                comment.setDate(df.format(oldComment.getTime()));

                int userId = oldComment.getUserId();
                UserInfo commenter = userInfoService.selectUserById(userId);
                comment.setUserName(commenter.getName());

                comments.add(comment);
            }
            session.setAttribute("comments",comments);
        }
        catch(Exception e)
        {
            List<CommentPack> comments = null;
            session.setAttribute("comments",comments);
        }

        return new WebResult(CommonReturnCode.SUCCESS);
    }


    @PostMapping(value ="/publishComment")
    @ResponseBody
    public Object publishComment(@RequestParam("content")String content,
                                 HttpSession session)
    {
        Comment comment = new Comment();
        comment.setContent(content);

        MessagePack currentMessage = (MessagePack)session.getAttribute("currentMessage");
        UserInfo user = (UserInfo) session.getAttribute("userInfo");
        comment.setMessageId(currentMessage.getMessageId());
        comment.setTime(new Date());
        comment.setUserId(user.getUserId());

        commentService.insertComment(comment);
        return new WebResult(CommonReturnCode.SUCCESS);
    }


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
