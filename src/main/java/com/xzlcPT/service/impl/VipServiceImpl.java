package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.CompanyVip;
import com.xzlcPT.bean.Leaguer;
import com.xzlcPT.bean.Vip;
import com.xzlcPT.dao.VipMapper;
import com.xzlcPT.service.VipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 会员serviceImpl
 *
 * @author 王诗钰
 * @create 2017-04-24 14:11
 **/
@Service("vipService")
public class VipServiceImpl implements VipService {

    @Autowired
    private VipMapper vipMapper;

    /**
     * 向VIP 表中 插入数据
     * @param vip
     * @return
     */
    @Override
    public int insertVip(Vip vip) {
        return vipMapper.insertVip(vip);
    }

    /**
     * 根据LoginID 查询
     * @param loginID
     * @return
     */
    @Override
    public Vip selectVipByLoginID(Long loginID) {
        Vip vip = new Vip();
        if(loginID != 0){
            vip = vipMapper.selectVipByLoginID(loginID);
        }
        return vip;
    }

    /**插入一条数据*/
    @Override
    public int insert(Vip vip){
        int a = vipMapper.insert(vip);
        return a;
    }

    /**同上，无区别*/
    public int saveVip(Vip vip){
        int a = vipMapper.insert(vip);
        return a;
    }

    /**删除一条数据*/
    @Override
    public int deleteByPrimaryKey(Long vipId){
        vipMapper.deleteByPrimaryKey(vipId);
        return 0;
    }

    /**同上，无区别*/
    public int deleteVip(Long vipId){
        int a = vipMapper.deleteByPrimaryKey(vipId);
        return a;
    }

    /**修改一条数据*/
    @Override
    public int updateVip(Vip vip){
        int a = vipMapper.updateByPrimaryKey(vip);
        return a;
    }

    /**
     * 观看视频时扣费操作
     */
    public int minusVipRest(Vip vip){
        return vipMapper.minusVipRest(vip);
    }

    /**根据login_id查询单条记录(前台)*/
    public Leaguer selectVipByLoginId(Long loginId){
        return vipMapper.selectVipByLoginId(loginId);
    }

    /**根据login_id查询公司会员信息(前台)*/
    public CompanyVip selectVipCompanyByLoginId(Long loginId){
        return vipMapper.selectVipCompanyByLoginId(loginId);
    }

    /**查询某用户的会员是否过期(前台，vipId)*/
    public Vip selectExpireTime(Long vipId){
        return vipMapper.selectExpireTime(vipId);
    }

    /**查询会员是否过期三个月*/
    public Vip selectThreeMonth(Long vipId){return vipMapper.selectThreeMonth(vipId);}

    /**根据主键查询一条数据*/
    @Override
    public Leaguer selectByPrimaryKey(Long vipId){
        return vipMapper.selectByPrimaryKey(vipId);
    }

    /**查询所有数据*/
    public PageBean<Vip> selectVipAll(Integer page, Integer rows, Vip vip){
        PageHelper.startPage(page,rows);
        List<Vip> vipList = vipMapper.selectVipAll(vip);
        return new PageBean<Vip>(vipList);
    }

    /**(后台)条件查询数据*/
    public PageBean<Leaguer> selectVipAllEnd(Integer page, Integer rows, Leaguer leaguer, Date startTime, Date endTime,
                                             Double minRest, Double maxRest, Long minScore, Long maxScore){
        PageHelper.startPage(page,rows);
        Map<String,Object> timeMap = putVipMap(leaguer);
        if(null != startTime){timeMap.put("startTime",startTime);}
        if(null != endTime){timeMap.put("endTime",endTime);}
        if(null != minRest && 0 != minRest){timeMap.put("minRest",minRest);}
        if(null != maxRest && 0 != maxRest){timeMap.put("maxRest",maxRest);}
        if(null != minScore && 0 != minScore){timeMap.put("minScore",minScore);}
        if(null != maxScore && 0 != maxScore){timeMap.put("maxScore",maxScore);}
        List<Leaguer> vipList = vipMapper.selectVipAllEnd(timeMap);
        return new PageBean<Leaguer>(vipList);
    }
    /**后台条件查询Map*/
    private Map<String,Object> putVipMap(Leaguer leaguer){
        Map<String,Object> timeMap = new HashMap<>();
        timeMap.put("vipId",leaguer.getVipId());
        timeMap.put("loginCount",leaguer.getLoginCount());
        timeMap.put("vipLevel",leaguer.getVipLevel());
        timeMap.put("vipScore",leaguer.getVipScore());
        timeMap.put("vipRest",leaguer.getVipRest());
        timeMap.put("loginType",leaguer.getLoginType());
        return timeMap;
    }
}
