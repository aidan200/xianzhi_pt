package com.xzlcPT.dao;

/**
 * mapper 层 EducationMapper
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/

import com.xzlcPT.bean.XzEducation;

import java.util.List;

public interface EducationMapper {
    //    根据登录表ID 新增用户信息
    int addEducation(XzEducation user);
    //    根据登录表ID 查询学历信息
    List<XzEducation> selectEducationByID(XzEducation id);
    //  memberId 查询
    List<XzEducation> selectMemberId(Long memberId);


    //    根据 学历ID 修改学历信息
    int updateEducation(XzEducation ed);
    //    根据学历表ID 删除学历信息
    int delateEducation(long ed);
    //      根据学历表ID 查询学历信息
    XzEducation selectEducationByEID(long id);

    //    后台
//    查询全部学历信息
    List<XzEducation> selAllEducationEnd(XzEducation xzEducation);

    /**
     * 后台添加学历信息
     * @param xzEducation
     * @return
     */
    int addEducationEnd(XzEducation xzEducation);

    //    修改学历信息
    int updateEducationEnd(XzEducation xzEducation);

    //    删除学历信息
    int deleteEducationEnd(long eid);

    //    根据ID查询学历信息
    XzEducation selByLoginIDEnd(long eid);
}
