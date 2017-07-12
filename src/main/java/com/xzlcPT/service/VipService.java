package com.xzlcPT.service;

import com.util.PageBean;
import com.xzlcPT.bean.CompanyVip;
import com.xzlcPT.bean.Leaguer;
import com.xzlcPT.bean.Vip;

import java.util.Date;

/**
 * 会员service
 * Create by 王诗钰 2017/4/24
 */
public interface VipService {
    /**
     * 向VIP表中 插入数据
     * @param vip
     * @return
     */
    int insertVip(Vip vip);

    /**
     * 根据登录表ID 查询
     * @param loginID
     * @return
     */
    Vip selectVipByLoginID(Long loginID);

    /**插入一条数据*/
    int insert(Vip vip);

    /**同上，无区别*/
    int saveVip(Vip vip);

    /**删除一条数据*/
    int deleteByPrimaryKey(Long vipId);

    /**同上，无区别*/
    int deleteVip(Long vipId);

    /**修改一条数据*/
    int updateVip(Vip vip);

    /**观看视频时扣费操作*/
    int minusVipRest(Vip vip);

    /**根据login_id查询用户会员信息(前台)*/
    Leaguer selectVipByLoginId(Long loginId);

    /**根据login_id查询公司会员信息(前台)*/
    CompanyVip selectVipCompanyByLoginId(Long loginId);

    /**根据主键查询一条记录*/
    Leaguer selectByPrimaryKey(Long vipId);

    /**查询某用户的会员是否过期(前台，vipId)*/
    Vip selectExpireTime(Long vipId);

    /**查询会员是否过期三个月*/
    Vip selectThreeMonth(Long vipId);

    /**前台查询所有数据*/
    PageBean<Vip> selectVipAll(Integer page, Integer rows, Vip vip);

    /**后台根据条件查询数据*/
    PageBean<Leaguer> selectVipAllEnd(Integer page, Integer rows, Leaguer leaguer, Date startTime,
                                      Date endTime, Double minRest, Double maxRest, Long minScore, Long maxScore);
}
