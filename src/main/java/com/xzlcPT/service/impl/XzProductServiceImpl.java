package com.xzlcPT.service.impl;/**
 * Created by Administrator on 2017/7/17.
 */

import com.xzlcPT.bean.XzCompany;
import com.xzlcPT.bean.XzCompanyProduct;
import com.xzlcPT.dao.XzCompanyProductMapper;
import com.xzlcPT.service.XzProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 甘汝雷
 * @create 2017-07-17 18:35
 **/
@Service("xzProductService")
public class XzProductServiceImpl implements XzProductService {

    @Autowired
    private XzCompanyProductMapper xzCompanyProductMapper;
    @Override
    public int insertProduct(XzCompanyProduct xzCompanyProduct) {
        int i=xzCompanyProductMapper.insertProduct(xzCompanyProduct);
        return i;
    }

    @Override
    public int updateProduct(XzCompanyProduct xzCompanyProduct) {
        int i=xzCompanyProductMapper.updateProduct(xzCompanyProduct);
        return i;
    }

    @Override
    public XzCompanyProduct selectByPrimaryKey(Long productId) {
        XzCompanyProduct xzCompanyProduct=xzCompanyProductMapper.selectByPrimaryKey(productId);
        return xzCompanyProduct;
    }

    @Override
    public List<XzCompanyProduct> selectByCompanyId(Long companyId) {
        List<XzCompanyProduct> productList=xzCompanyProductMapper.selectByCompanyId(companyId);
        return productList;
    }
}
