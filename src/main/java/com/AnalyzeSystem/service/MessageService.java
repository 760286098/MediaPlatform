package com.AnalyzeSystem.service;

import com.AnalyzeSystem.model.Message;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface MessageService {

    void insertMessage(Message message);


    Message selectMessageById(int messageId);

    Message selectMessageByTitle(String title);

    void deleteMessage(int messageId);


    int getLastestMessageId();

    String selectUserNameByIdInMessage(int messageId);


}
