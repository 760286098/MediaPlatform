package com.AnalyzeSystem.service;

import com.AnalyzeSystem.dao.CommentDao;
import com.AnalyzeSystem.model.Comment;

import java.util.List;

public interface CommentService {
    //public CommentDao getInstance();

    public void insertComment(Comment comment);

    public Comment selectCommentByCommentId(String commentId);

    public List<Comment> selectCommentByUserId(String userId);

    public List<Comment> selectCommentByMessageId(String messageId);

    public void deleteCommentById(String commentId);

    public List<Comment> selectAllOfCurrentMessage(int messageId);
}
