package com.xzlcPT.dao;/**
 * Created by Administrator on 2017/7/17.
 */

import com.xzlcPT.bean.XzCompany;
import com.xzlcPT.bean.XzCompanyMien;

import java.util.List;

/**
 * @author 甘汝雷
 * @create 2017-07-17 20:00
 **/
public interface XzCompanyMienMapper {
    int insertMien(XzCompanyMien xzCompanyMien);

    int updateMien(XzCompanyMien xzCompanyMien);

    XzCompanyMien selectByMienId(Long mienId);

    List<XzCompanyMien> selectByCompanyId(Long companyId);

}
