package com.AnalyzeSystem.service.Impl;

import com.AnalyzeSystem.dao.Mp_infoDao;
import com.AnalyzeSystem.model.Mp_info;
import com.AnalyzeSystem.service.Mp_infoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("Mp_infoService")
public class Mp_infoServiceImpl implements Mp_infoService {
    @Resource
    private Mp_infoDao mp_infoDao;

    public List<Mp_info> selectAll()
    {
        return mp_infoDao.selectAll();
    }
}
