package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.Cost;
import com.xzlcPT.service.CostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

/**
 * 会员交易记录Controller
 *
 * @author 王诗钰
 * @create 2017-04-25 14:48
 **/
@Controller
@RequestMapping("/Cost")
public class CostController extends BaseController {

    @Autowired
    private CostService costService;

    /**
     * 后台插入一条数据
     * @param cost
     * @return
     */
    @RequestMapping("saveCost.emp")
    public ModelAndView saveCost(Cost cost){
        ModelAndView mav = new ModelAndView("backEnd/costEdit");
        try {
            costService.saveCost(cost);
            mav.addObject("msg", "添加成功");
        }catch (Exception ex){
            ex.printStackTrace();
            mav.addObject("msg","添加失败");
        }
        return mav;
    }
    /**
     * 后台删除一条数据
     * @param cost
     * @return
     */
    @RequestMapping("deleteCost.emp")
    public ModelAndView deleteCost(Cost cost, RedirectAttributes attr){
        ModelAndView mav = new ModelAndView("redirect:selectCostAll.emp");
        try{
            costService.deleteCost(cost);
            attr.addAttribute("msg","删除成功");
        }catch (Exception ex){
            ex.printStackTrace();
            attr.addAttribute("msg","删除失败");
        }
        return mav;
    }
    /**
     * 后台修改一条数据
     * @param cost
     * @return
     */
    @RequestMapping("updateCost.emp")
    public ModelAndView updateCost(Cost cost){
        ModelAndView mav = new ModelAndView("backEnd/costEdit");
        try{
            costService.updateCost(cost);
            mav.addObject("msg","修改成功");
        }catch (Exception ex){
            ex.printStackTrace();
            mav.addObject("msg","修改失败");
        }
        return mav;
    }
    /**
     * 后台分页查询所有数据
     * @param cost
     * @return
     */
    @RequestMapping("selectCostAll.emp")
    public ModelAndView selectCostAllEnd(@RequestParam(defaultValue="1")Integer page,
                                         @RequestParam(defaultValue="10")Integer rows,
                                         Date startTime, Date endTime, Cost cost){
        ModelAndView mav = new ModelAndView("backEnd/costShow");
        PageBean<Cost> pageBean = costService.selectCostAllEnd(page,rows,cost,startTime,endTime);
        List<Cost> costList = pageBean.getList();
        mav.addObject("costList",costList);
        mav.addObject("page",pageBean.getPageNum());//当前页数
        mav.addObject("pages",pageBean.getPages());//总页数
        mav.addObject("rows",pageBean.getPageSize());//每页条数
        mav.addObject("total",pageBean.getTotal());//总条数
        mav.addObject("cost",cost);
        mav.addObject("startTime",startTime);
        mav.addObject("endTime",endTime);
        return mav;
    }
    /**
     * 前台分页查询所有数据
     * @param cost
     * @return
     */
    @RequestMapping("selectCostAll.do")
    public ModelAndView selectCostAll(@RequestParam(defaultValue="1")Integer page,
                                      @RequestParam(defaultValue="6")Integer rows,Cost cost){
        ModelAndView mav = new ModelAndView("foreEnd/vipCost");
        PageBean<Cost> pageBean = costService.selectCostAll(page,rows,cost);
        List<Cost> costList = pageBean.getList();
        mav.addObject("costList",costList);
        mav.addObject("page",pageBean.getPageNum());//当前页数
        mav.addObject("pages",pageBean.getPages());//总页数
        mav.addObject("rows",pageBean.getPageSize());//每页条数
        mav.addObject("total",pageBean.getTotal());//总条数
        mav.addObject("cost",cost);
        return mav;
    }
    /**
     * 后台根据主键查询一条数据
     * @param costId
     * @return
     */
    @ResponseBody
    @RequestMapping("costEdit.emp")
    public ModelAndView costEditEnd(Long costId){
        ModelAndView mav = new ModelAndView("backEnd/costEdit");
        Cost cost = new Cost();
        if(null != costId && 0 != costId){
            cost = costService.selectByPrimaryKey(costId);
        }
        mav.addObject("cost",cost);
        return mav;
    }
}
