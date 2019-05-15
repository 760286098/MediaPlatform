package com.AnalyzeSystem.service.Impl;

import com.AnalyzeSystem.model.ArticleInfo;
import com.AnalyzeSystem.dao.Mp_infoDao;
import com.AnalyzeSystem.dao.Wenzhang_infoDao;
import com.AnalyzeSystem.model.Wenzhang_info;
import com.AnalyzeSystem.service.Wenzhang_infoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service("Wenzhang_infoService")
public class Wenzhang_infoServiceImpl implements Wenzhang_infoService {
    @Resource
    private Wenzhang_infoDao wenzhang_infoDao;
    @Resource
    private Mp_infoDao mp_infoDao;

    private List<ArticleInfo> infos;
    private List<ArticleInfo> getInfos(){
        if (infos==null)infos=wenzhang_infoDao.selectAllArticles();
        return infos;
    };

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

    public Map<String,Integer> getLikes(){
        Map<String,Integer> map=new HashMap<>();
        List<ArticleInfo> infos= getInfos();
        for (ArticleInfo info :
                infos) {
            Integer mpId=info.getMp_id();
            String GZHname=mp_infoDao.selectNameById(mpId);
            Integer result=map.get(GZHname);
            if (result==null)map.put(GZHname,info.getLikes());
            else map.put(GZHname,result+info.getLikes());
        }
        return map;
    };

    public Map<String,Integer> getBrowseNumber(){
        Map<String,Integer> map=new HashMap<>();
        List<ArticleInfo> infos= getInfos();
        for (ArticleInfo info :
                infos) {
            Integer mpId=info.getMp_id();
            String GZHname=mp_infoDao.selectNameById(mpId);
            Integer result=map.get(GZHname);
            if (result==null)map.put(GZHname,info.getBrowse_times());
            else map.put(GZHname,result+info.getBrowse_times());
        }
        return map;
    }

    public Map<String,int[]> getArticleInfo(int id){//id为公众号id
        Map<String,int[]> map=new HashMap<>();
        List<ArticleInfo> infos=getInfos();
        for (ArticleInfo info :
                infos) {
            if (info.getMp_id()==id){
                int a[]=new int[3];//0浏览量，1点赞量，2评论数
                a[0]=info.getBrowse_times();
                a[1]=info.getLikes();
                a[2]=info.getComments();
                map.put(mp_infoDao.selectNameById(id),a);
            }
        }

        return map;
    }

    public int[] browseTimeChange(int id){//公众号id,获得公众号最近10天的浏览量变化
        List<ArticleInfo> infos=getInfos();
        int a[]=new int[10];
        Date current=new Date();
        for (ArticleInfo info :
                infos) {
            if (info.getMp_id()==id){
                Date publishTime=info.getDate();
                int index=compareDate(current,publishTime);
                if (index<a.length)a[index]+=info.getBrowse_times();
            }
        }
        return a;
    }
    private int compareDate(Date current,Date target){
        return current.getMonth()>target.getMonth()?
                current.getDay()+30-target.getDay():current.getDay()-target.getDay();
    }

    public int[] publishTime(){
        int a[]=new int[6];
        List<ArticleInfo> infos=getInfos();
        for (ArticleInfo info :
                infos) {
            a[info.getDate().getHours()/4]++;
        }
        return a;
    }
}
