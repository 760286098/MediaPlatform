package com.AnalyzeSystem.dao;

import com.AnalyzeSystem.model.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentDao{

    //public  CommentDao getInstance();

    void insertComment(@Param("comment")Comment comment);

    Comment selectCommentByCommentId(String commentId);

    List<Comment> selectCommentByUserId(String userId);

    List<Comment> selectCommentByMessageId(String messageId);

    void deleteCommentById(String commentId);

    List<Comment> selectAllOfCurrentMessage(int messageId);
}
