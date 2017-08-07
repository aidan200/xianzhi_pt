package com.xzlcPT.service.impl;

import com.github.pagehelper.PageHelper;
import com.util.PageBean;
import com.xzlcPT.bean.XzCompany;
import com.xzlcPT.dao.CompanyInfoMapper;
import com.xzlcPT.dao.XzCompanyMapper;
import com.xzlcPT.service.CompanyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ServiceImpl 层 CompanyInfoServiceImpl
 *
 * @author 王天岳
 * @create 2017/3/30 17:43
 **/
@Service("companyInfoService")
public class CompanyInfoServiceImpl implements CompanyInfoService {

    @Autowired
    private CompanyInfoMapper companyInfoMapper;
    @Autowired
    private XzCompanyMapper companyMapper;

    /**
     * 前台方法
     */

    @Override
    public XzCompany selCompanyInfo(Long id) {
        return companyMapper.selCompanyInfo(id);
    }

    /**
     * 添加公司信息
     * @param companyInfo
     * @return
     */
    @Override
    public int insertCompanyInfo(XzCompany companyInfo) {
        int a = 0;
        if(companyInfo!=null){
            a = companyInfoMapper.insertCompanyInfo(companyInfo);
        }
        return a;
    }

    /**
     * 根据公司名称查询
     * @param companyName
     * @return
     */
    @Override
    public XzCompany selectByCompany(String companyName) {
        XzCompany newCompanyInfo = new XzCompany();
        if (companyName!=null){
            newCompanyInfo = companyInfoMapper.selectByCompanyName(companyName);
        }
        return newCompanyInfo;
    }

    /**
     * 根据登录ID查询
     * @param loginID
     * @return
     */
    @Override
    public XzCompany selectByLoginID(long loginID) {
        XzCompany newCompanyInfo = new XzCompany();
        if(loginID!=0){
            XzCompany newXz = new XzCompany();
            newXz.setLoginId(loginID);
            newCompanyInfo =  companyInfoMapper.selectByLoginID(newXz);
        }
        return newCompanyInfo;
    }

    /**
     * 修改公司信息
     * @param xzCompany
     * @return
     */
    @Override
    public int updateCompanyInfo(XzCompany xzCompany) {
        return companyInfoMapper.updateCompanyInfo(xzCompany);
    }

    /**
     * 根据公司ID查询
     * @param companyID
     * @return
     */
    @Override
    public XzCompany selectByCompanyID(long companyID) {
        XzCompany xzCompany=new XzCompany();
        if (companyID!=0){
            xzCompany = companyInfoMapper.selectByCompanyID(companyID);
        }
        return xzCompany;
    }

    /**
     * 后台方法
     */

    /**
     * 根据条件查询公司信息
     * @param page
     * @param rows
     * @param xzCompany
     * @return
     */
    @Override
    public PageBean<XzCompany> selAllCompanyEnd(Integer page, Integer rows, XzCompany xzCompany) {
        PageHelper.startPage(page,rows);
        List<XzCompany> companyList = companyInfoMapper.selAllCompanyEnd(xzCompany);
        return new PageBean<XzCompany>(companyList);
    }

    /**
     * 修改公司信息
     * @param xzCompany
     * @return
     */
    @Override
    public int updateCompanyEnd(XzCompany xzCompany) {

        return companyInfoMapper.updateCompanyEnd(xzCompany);
    }

    /**
     * 删除公司信息
     * @param loginID
     * @return
     */
    @Override
    public int deleteCompanyEnd(long loginID) {
        return companyInfoMapper.deleteCompanyEnd(loginID);
    }

    /**
     * 根据ID查询公司信息
     * @param loginID
     * @return
     */
    @Override
    public XzCompany selByLoginIDEnd(Long loginID) {
        return companyInfoMapper.selByLoginIDEnd(loginID);
    }
}
