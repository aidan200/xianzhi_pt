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

    @ResponseBody
    @RequestMapping("insertProduct")
        public Map insertProduct(@RequestBody XzCompanyProduct xzCompanyProduct){
        Map map=new HashMap();
        int i=xzProductService.insertProduct(xzCompanyProduct);
        map.put("i",i);
        return map;
    }

    @ResponseBody
    @RequestMapping("updateProduct")
    public  Map updateProduct(@RequestBody XzCompanyProduct xzCompanyProduct){
      Map map=new HashMap();
        int i=xzProductService.updateProduct(xzCompanyProduct);
     if (i>0){
         map.put("msg","true");
     }else {
         map.put("msg","err");
     }
        return map;
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
        map.put("productList",productList);
        System.out.println("size:::::::::::::::::::::"+productList.size());
        return map;
    }
}
