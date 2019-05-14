package com.AnalyzeSystem.service.Impl;

import com.AnalyzeSystem.dao.Wenzhang_infoDao;
import com.AnalyzeSystem.model.Wenzhang_info;
import com.AnalyzeSystem.service.Wenzhang_infoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("Wenzhang_infoService")
public class Wenzhang_infoServiceImpl implements Wenzhang_infoService {
    @Resource
    private Wenzhang_infoDao wenzhang_infoDao;

    public List<Wenzhang_info> selectArticleByMpId(int mp_id)
    {
        return wenzhang_infoDao.selectArticleByMpId(mp_id);
    }

    public Wenzhang_info selectArticleById(int _id)
    {
        return wenzhang_infoDao.selectArticleById(_id);
    }

    public Wenzhang_info selectArticleByName(String title)
    {
        return wenzhang_infoDao.selectArticleByName(title);
    };
}
