package com.xzlcPT.service;/**
 * Created by Administrator on 2017/7/17.
 */

import com.xzlcPT.bean.XzCompanyProduct;

/**
 * @author 甘汝雷
 * @create 2017-07-17 18:36
 **/
public interface XzProductService {

    int insertProduct(XzCompanyProduct xzCompanyProduct);

    int updateProduct(XzCompanyProduct xzCompanyProduct);
}
