package com.xzlcPT.dao;

import com.xzlcPT.bean.CompanyVip;
import com.xzlcPT.bean.Leaguer;
import com.xzlcPT.bean.Vip;

import java.util.List;
import java.util.Map;

/**
 * 会员dao
 * Create by 王诗钰 2017/4/24
 */
public interface VipMapper {
    /**
     * 向VIP表 插入数据
     *
     * @param vip
     * @return
     */
    int insertVip(Vip vip);

    /**
     * 根据登录ID查询
     *
     * @param loginID
     * @return
     */
    Vip selectVipByLoginID(Long loginID);

    /**
     * 插入一条数据
     */
    int insertSelective(Vip vip);

    /**
     * 同上，无区别
     */
    int insert(Vip vip);

    /**
     * 删除一条数据
     */
    int deleteByPrimaryKey(Long vipId);

    /**
     * 修改一条数据
     */
    int updateByPrimaryKeySelective(Vip vip);

    /**
     * 观看视频时扣费操作
     */
    int minusVipRest(Vip vip);

    /**
     * 同上，无区别
     */
    int updateByPrimaryKey(Vip vip);

    /**
     * 前台查询所有数据
     */
    List<Vip> selectVipAll(Vip vip);

    /**
     * 后台根据条件查询数据
     */
    List<Leaguer> selectVipAllEnd(Map<String, Object> timeMap);

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
}
