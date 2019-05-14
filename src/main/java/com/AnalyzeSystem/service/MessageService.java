package com.AnalyzeSystem.service;

import com.AnalyzeSystem.model.Message;


import java.util.List;

public interface MessageService {

    void insertMessage(Message message);


    Message selectMessageById(int messageId);

    Message selectMessageByTitle(String title);

    void deleteMessage(int messageId);


    int getLastestMessageId();

    String selectUserNameByIdInMessage(int messageId);

    List<Message> selectAll();


}
