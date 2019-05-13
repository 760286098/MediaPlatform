package com.AnalyzeSystem.dao;


import com.AnalyzeSystem.model.Article;
import com.AnalyzeSystem.model.Message;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public interface MessageDao{
    void insertMessage(@Param("message")Message message);

    Message selectMessageById(int messageId);

    Message selectMessageByTitle(String title);

    void deleteMessage(int messageId);

    int getLastestMessageId();

    String selectUserNameByIdInMessage(int messageId);

    List<Message> selectAll();


}
