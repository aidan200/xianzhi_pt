package com.xzlcPT.controller;/**
 * Created by Administrator on 2017/7/17.
 */

import com.xzlcPT.bean.XzCompanyProduct;
import com.xzlcPT.service.XzProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 甘汝雷
 * @create 2017-07-17 18:43
 **/
@Controller
@RequestMapping("/Product")
public class ProductController extends BaseController{
    @Autowired
    private XzProductService xzProductService;

    @RequestMapping("insertProduct")
    public ModelAndView insertProduct(XzCompanyProduct xzCompanyProduct){
        ModelAndView mv=new ModelAndView("/foreEnd3/test1");
        int i=xzProductService.insertProduct(xzCompanyProduct);
        mv.addObject("i",i);
        return mv;
    }
    @RequestMapping("updateProduct")
    public  ModelAndView updateProduct(XzCompanyProduct xzCompanyProduct){
        ModelAndView mv=new ModelAndView("/foreEnd3/test1");
        int i=xzProductService.updateProduct(xzCompanyProduct);
        mv.addObject("i",i);
        return mv;
    }
    @ResponseBody
    @RequestMapping("selectByPrimaryKey")
    public Map selectByPrimaryKey(Long productId){
        Map map = new HashMap();
        XzCompanyProduct xzCompanyProduct=xzProductService.selectByPrimaryKey(productId);
        map.put("xzCompanyProduct",xzCompanyProduct);
        return map;
    }
    @ResponseBody
    @RequestMapping("selectByCompanyId")
    public Map selectByCompanyId(Long companyId) {
        Map map = new HashMap();
        List<XzCompanyProduct> productList = xzProductService.selectByCompanyId(companyId);
        for (int i=0;i<productList.size();i++){
            XzCompanyProduct xzCompanyProduct=productList.get(i);
            map.put("xzCompanyProduct",xzCompanyProduct);
        }
        return map;
    }
}
