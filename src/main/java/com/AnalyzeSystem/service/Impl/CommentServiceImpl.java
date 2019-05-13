package com.AnalyzeSystem.service.Impl;

import com.AnalyzeSystem.dao.CommentDao;
import com.AnalyzeSystem.model.Comment;
import com.AnalyzeSystem.service.CommentService;
import com.AnalyzeSystem.service.DaoService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("CommentService")
public class CommentServiceImpl implements CommentService
{

    @Resource
    private CommentDao commentDao;


    public void insertComment(Comment comment)
    {
        commentDao.insertComment(comment);
    };

    public Comment selectCommentByCommentId(String commentId)
    {
        return commentDao.selectCommentByCommentId(commentId);
    };

    public List<Comment> selectCommentByUserId(String userId)
    {
        return commentDao.selectCommentByUserId(userId);
    };

    public List<Comment> selectCommentByMessageId(String messageId)
    {
        return commentDao.selectCommentByMessageId(messageId);
    };

    public void deleteCommentById(String commentId)
    {
        commentDao.deleteCommentById(commentId);
    };

    public List<Comment> selectAllOfCurrentMessage(int messageId)
    {
        return commentDao.selectAllOfCurrentMessage(messageId);
    };
}
