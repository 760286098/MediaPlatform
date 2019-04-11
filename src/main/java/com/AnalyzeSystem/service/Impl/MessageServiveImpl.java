package com.AnalyzeSystem.service.Impl;

import com.AnalyzeSystem.dao.MessageDao;
import com.AnalyzeSystem.model.Message;
import com.AnalyzeSystem.service.DaoService;
import com.AnalyzeSystem.service.MessageService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("MessageService") //声明以下类作为service注入
public class MessageServiveImpl implements MessageService
{
    @Resource
    private MessageDao messageDao;

    public void insertMessage(Message message)
    {
        messageDao.insertMessage(message);
    }

    public Message selectMessageById(int messageId)
    {
        return messageDao.selectMessageById(messageId);
    }

    public Message selectMessageByTitle(String title)
    {
        return messageDao.selectMessageByTitle(title);
    }

    public void deleteMessage(int messageId)
    {
        messageDao.deleteMessage(messageId);
    }

    public int getLastestMessageId()
    {
        return messageDao.getLastestMessageId();
    }

    public String selectUserNameByIdInMessage(int messageId){
        return messageDao.selectUserNameByIdInMessage(messageId);
    }
}
