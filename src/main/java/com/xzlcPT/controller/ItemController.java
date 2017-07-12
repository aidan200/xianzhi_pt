package com.xzlcPT.controller;


import com.util.PageBean;
import com.xzlcPT.bean.Item;
import com.xzlcPT.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;

/**
 * 项目Controller
 *
 * @author 王诗钰
 * @create 2017-04-25 19:52
 **/
@Controller
@RequestMapping("/Item")
public class ItemController  extends BaseController{

    @Autowired
    private ItemService itemService;

    /**
     * 后台插入一条数据
     * @param item
     * @return
     */
    @RequestMapping("saveItem.emp")
    public ModelAndView saveItem(@Validated(Item.F1.class) Item item, BindingResult bindingResult){
        ModelAndView mav = new ModelAndView("backEnd/itemEdit");
        if(bindingResult.hasErrors()){

        }else{
            try {
                itemService.saveItem(item);
                mav.addObject("msg", "添加成功");
            }catch (Exception ex){
                ex.printStackTrace();
                mav.addObject("msg","添加失败");
            }
        }
        return mav;
    }
    /**
     * 后台删除一条数据
     * @param item
     * @return
     */
    @RequestMapping("deleteItem.emp")
    public ModelAndView deleteItem(Item item, RedirectAttributes attr){
        ModelAndView mav = new ModelAndView("redirect:selectItemAll.emp");
        try{
            itemService.deleteItem(item);
            attr.addAttribute("msg","删除成功");
        }catch (Exception ex){
            ex.printStackTrace();
            attr.addAttribute("msg","删除失败");
        }
        return mav;
    }
    /**
     * 后台修改一条数据
     * @param item
     * @return
     */
    @RequestMapping("updateItem.emp")
    public ModelAndView updateItem(@Validated(Item.F1.class) Item item, BindingResult bindingResult){
        ModelAndView mav = new ModelAndView("backEnd/itemEdit");
        if(bindingResult.hasErrors()){

        }else{
            try{
                itemService.updateItem(item);
                mav.addObject("msg","修改成功");
            }catch (Exception ex){
                ex.printStackTrace();
                mav.addObject("msg","修改失败");
            }
        }
        return mav;
    }
    /**
     * 后台分页查询所有数据
     * @param item
     * @return
     */
    @RequestMapping("selectItemAll.emp")
    public ModelAndView selectItemAllEnd(@RequestParam(defaultValue="1")Integer page,
                                         @RequestParam(defaultValue="10")Integer rows,
                                         Date startTime, Date endTime, Item item){
        ModelAndView mav = new ModelAndView("backEnd/itemShow");
        PageBean<Item> pageBean = itemService.selectItemAllEnd(page,rows,item,startTime,endTime);
        List<Item> itemList = pageBean.getList();
        mav.addObject("itemList",itemList);
        mav.addObject("page",pageBean.getPageNum());//当前页数
        mav.addObject("pages",pageBean.getPages());//总页数
        mav.addObject("rows",pageBean.getPageSize());//每页条数
        mav.addObject("total",pageBean.getTotal());//总条数
        mav.addObject("item",item);
        mav.addObject("startTime",startTime);
        mav.addObject("endTime",endTime);
        return mav;
    }
    /**
     * 前台分页查询所有数据
     * @param item
     * @return
     */
    @RequestMapping("selectItemAll.do")
    public ModelAndView selectItemAll(@RequestParam(defaultValue="1")Integer page,
                                      @RequestParam(defaultValue="10")Integer rows,Item item){
        ModelAndView mav = new ModelAndView("foreEnd/items");
        PageBean<Item> pageBean = itemService.selectItemAll(page,rows,item);
        List<Item> itemList = pageBean.getList();
        mav.addObject("itemList",itemList);
        mav.addObject("page",pageBean.getPageNum());//当前页数
        mav.addObject("pages",pageBean.getPages());//总页数
        mav.addObject("rows",pageBean.getPageSize());//每页条数
        mav.addObject("total",pageBean.getTotal());//总条数
        mav.addObject("item",item);
        return mav;
    }
    /**
     * 前台分页查询部分数据(index页面使用)
     * @param item
     * @return
     */
    @ResponseBody
    @RequestMapping("itemEditIndex.do")
    public ModelAndView selectEditIndex(@RequestParam(defaultValue = "1")Integer page,
                                        @RequestParam(defaultValue = "6")Integer rows, Item item){
        ModelAndView mav = new ModelAndView("forward:eventEditIndex.do");
        PageBean<Item> pageBean = itemService.selectItemAll(page,rows,item);
        List<Item> itemList = pageBean.getList();
        mav.addObject("itemList",itemList);
        mav.addObject("item",item);
        return mav;
    }
    /**
     * 后台根据主键查询一条数据
     * @param itemId
     * @return
     */
    @ResponseBody
    @RequestMapping("itemEdit.emp")
    public ModelAndView itemEditEnd(Long itemId){
        ModelAndView mav = new ModelAndView("backEnd/itemEdit");
        Item item = new Item();
        if(null != itemId && 0 != itemId){
            item = itemService.selectByPrimaryKey(itemId);
        }
        mav.addObject("item",item);
        return mav;
    }

}
