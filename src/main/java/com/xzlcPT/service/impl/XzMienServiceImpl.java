package com.xzlcPT.service.impl;/**
 * Created by Administrator on 2017/7/17.
 */


import com.xzlcPT.bean.XzCompanyMien;
import com.xzlcPT.dao.XzCompanyMienMapper;
import com.xzlcPT.service.XzMienService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author 甘汝雷
 * @create 2017-07-17 20:35
 **/
@Service("XzMienService")
public class XzMienServiceImpl implements XzMienService{
    @Autowired
    private XzCompanyMienMapper xzCompanyMienMapper;

    @Override
    public int insertMien(XzCompanyMien xzCompanyMien) {
       int i=xzCompanyMienMapper.insertMien(xzCompanyMien);
        return i;
    }

    @Override
    public int updateMien(XzCompanyMien xzCompanyMien) {
       int i=xzCompanyMienMapper.updateMien(xzCompanyMien);
        return i;
    }

    @Override
    public XzCompanyMien selectByMienId(Long mienId) {
       XzCompanyMien xzCompanyMien=xzCompanyMienMapper.selectByMienId(mienId);
        return xzCompanyMien;
    }

    @Override
    public List<XzCompanyMien> selectByCompanyId(Long companyId) {
        List<XzCompanyMien> MienList=xzCompanyMienMapper.selectByCompanyId(companyId);
        return MienList;
    }

    @Override
    public int updateMienPicture(XzCompanyMien xzCompanyMien) {
       int i=xzCompanyMienMapper.updateMienPicture(xzCompanyMien);
        return i;
    }
}
