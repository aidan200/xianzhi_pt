package com.xzlcPT.controller;

import com.util.PageBean;
import com.xzlcPT.bean.*;
import com.xzlcPT.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 会员Controller
 *
 * @author 王诗钰
 * @create 2017-04-24 14:25
 **/
@Controller
@RequestMapping("/Vip")
@SessionAttributes("userLogin")
public class VipController extends BaseController{

    @Autowired
    private VipService vipService;

    @Autowired
    private CostService costService;

    @Autowired
    private LoginUserService loginUserService;

    @Autowired
    private VideoRecordService videoRecordService;

    /**
     * 后台删除一条数据
     * @param vip
     * @return
     */
    @RequestMapping("deleteVip.emp")
    public ModelAndView deleteVip(Vip vip, RedirectAttributes attr){
        ModelAndView mav = new ModelAndView("redirect:selectVipAllEnd.emp");
        try{
            vipService.deleteVip(vip.getVipId());
            attr.addAttribute("msg","删除成功");
        }catch (Exception ex){
            ex.printStackTrace();
            attr.addAttribute("msg","删除失败");
        }
        return mav;
    }
    /**
     * 后台修改一条数据
     * @param leaguer
     * @return
     */
    @RequestMapping("updateVip.emp")
    public ModelAndView updateVip(Leaguer leaguer){
        ModelAndView mav = new ModelAndView("backEnd/vipEdit");
        try{
            Vip vip = new Vip();
            vip.setVipId(leaguer.getVipId());
            vip.setVipLevel(leaguer.getVipLevel());
            vip.setExpireTime(leaguer.getExpireTime());
            vip.setVipScore(leaguer.getVipScore());
            vip.setVipRest(leaguer.getVipRest());
            vipService.updateVip(vip);
            mav.addObject("msg","修改成功");
        }catch (Exception ex){
            ex.printStackTrace();
            mav.addObject("msg","修改失败");
        }
        return mav;
    }
    /**
     * 后台分页查询所有数据
     * @param leaguer
     * @param startTime
     * @param endTime
     * @return
     */
    @RequestMapping("selectVipAllEnd.emp")
    public ModelAndView selectVipAllEnd(@RequestParam(defaultValue = "1")Integer page,
                          @RequestParam(defaultValue = "10")Integer rows, Leaguer leaguer, Date startTime,Date endTime,
                                        Double minRest, Double maxRest, Long minScore, Long maxScore){
        ModelAndView mav = new ModelAndView("backEnd/vipShow");
        PageBean<Leaguer> pageBean = vipService.selectVipAllEnd(page,rows,leaguer,startTime,endTime,minRest,maxRest,minScore,maxScore);
        List<Leaguer> leaguerList = pageBean.getList();
        mav.addObject("leaguerList",leaguerList);
        mav.addObject("page",pageBean.getPageNum());//当前页数
        mav.addObject("pages",pageBean.getPages());//总页数
        mav.addObject("rows",pageBean.getPageSize());//每页条数
        mav.addObject("total",pageBean.getTotal());//总条数
        mav.addObject("leaguer",leaguer);
        mav.addObject("startTime",startTime);
        mav.addObject("endTime",endTime);
        mav.addObject("minRest",minRest);
        mav.addObject("maxRest",maxRest);
        mav.addObject("minScore",minScore);
        mav.addObject("maxScore",maxScore);
        return mav;
    }
    /**
     * 前台根据主键查询一条数据
     * @param userLogin
     * @return
     */
    @ResponseBody
    @RequestMapping("interceptVipEdit.do")
    public ModelAndView vipEdit(@ModelAttribute("userLogin") XzLogin userLogin){
        ModelAndView mav = new ModelAndView("foreEnd/vipCenter");
        if(null != userLogin && !"".equals(userLogin.getLoginCount())) {
            if(1 == userLogin.getLoginType()) {//个人账户
                mav.addObject("type","person");
                Leaguer leaguer = vipService.selectVipByLoginId(userLogin.getLoginId());
                if(null != leaguer && 0 != leaguer.getVipId()) {
                    mav.addObject("leaguer", leaguer);
                    if (null != vipService.selectExpireTime(leaguer.getVipId())) {//会员
                        mav.addObject("msg", "is vip");
                    } else if (null != leaguer.getVipLevel() && !"0".equals(leaguer.getVipLevel())) {//充过会员
                        if (null != vipService.selectThreeMonth(leaguer.getVipId())) {//过期会员
                            mav.addObject("tip", "过期会员");}
                        mav.addObject("msg", "outTime vip");
                    } else {//普通用户
                        mav.addObject("msg", "not vip");}
                    Double money = 0.00;//查询某用户一共花了多少钱(总支出金额)
                    if (null != costService.selectSumCostMoney(leaguer.getVipId())) {
                        money = costService.selectSumCostMoney(leaguer.getVipId()).getCostMoney();}
                    mav.addObject("money", money);
                }
            }
            if(2 == userLogin.getLoginType()){//公司账户
                mav.addObject("type","company");
                CompanyVip companyVip = vipService.selectVipCompanyByLoginId(userLogin.getLoginId());
                mav.addObject("companyVip",companyVip);
                if (null != vipService.selectExpireTime(companyVip.getVipId())) {//会员
                    mav.addObject("msg", "is vip");
                } else if (null != companyVip.getVipLevel() && !"0".equals(companyVip.getVipLevel())) {//充过会员
                    if (null != vipService.selectThreeMonth(companyVip.getVipId())) {//过期会员
                        mav.addObject("tip", "过期会员");}
                    mav.addObject("msg", "outTime vip");
                    System.out.print("");
                }else{//普通用户
                    mav.addObject("msg","not vip");}
                Double money = 0.00;
                if(null != costService.selectSumCostMoney(companyVip.getVipId())){
                    money = costService.selectSumCostMoney(companyVip.getVipId()).getCostMoney();}
                mav.addObject("money",money);
            }
        }
        mav.addObject("userLogin",userLogin);
        return mav;
    }
    /**
     * 后台根据主键查询一条数据
     * @param vipId
     * @return
     */
    @ResponseBody
    @RequestMapping("vipEdit.emp")
    public ModelAndView vipEditEnd(Long vipId){
        ModelAndView mav = new ModelAndView("backEnd/vipEdit");
        Leaguer leaguer = new Leaguer();
        if(null != vipId && 0 != vipId){
            leaguer = vipService.selectByPrimaryKey(vipId);
        }
        mav.addObject("leaguer",leaguer);
        return mav;
    }
    /**
     * 跳转到会员充值页面
     */
    @RequestMapping("turnInsider.do")
    public ModelAndView turnInsider(){
        ModelAndView mav = new ModelAndView("foreEnd/insider");
        return mav;
    }
    /**
     * 跳转到用户充值页面
     */
    @RequestMapping("turnUserInsider.do")
    public ModelAndView turnUserInsider(){
        ModelAndView mav = new ModelAndView("foreEnd/userInsider");
        return mav;
    }
    /**
     * 扣费接口
     * @param rest
     * @param videoPrice
     * @return
     */
    @RequestMapping("minusRest.do")
    public ModelAndView minusRest(Double rest, Double videoPrice, Long videoId,
                                  @ModelAttribute("userLogin") XzLogin userLogin){
        ModelAndView mav = new ModelAndView("redirect:/XzVideo/playVideo.do");
        String jumpAddress = "/Vip/minusRest.do";
        if(videoPrice <= rest){
            rest -= videoPrice;
            //修改Vip表中数据
            Vip v = new Vip();
            v.setLoginID(userLogin.getLoginId());
            v.setVipRest(rest);
            vipService.minusVipRest(v);
            //添加观看记录
            XzVideoRecord xzVideoRecord = new XzVideoRecord();
            xzVideoRecord.setLoginID(userLogin.getLoginId());
            xzVideoRecord.setVideoID(videoId);
            List<XzVideoRecord> list1 = videoRecordService.selectRecord(xzVideoRecord);
            int a = 0;
            if (list1 == null || list1.size() == 0) {
                xzVideoRecord.setRecordType(2);
                xzVideoRecord.setRecordDate(new Date());
                a = videoRecordService.insertVideoRecord(xzVideoRecord);
            }
            if (a != 0) {
                System.out.println("插入记录成功");
            } else {
                System.out.println("插入记录失败");
            }
            //添加交易记录
            Cost cost = new Cost();
            if(1 == userLogin.getLoginType()){
                cost.setVipId(vipService.selectVipByLoginId(userLogin.getLoginId()).getVipId());}
            if(2 == userLogin.getLoginType()){
                cost.setVipId(vipService.selectVipCompanyByLoginId(userLogin.getLoginId()).getVipId());}
            cost.setCostMoney(videoPrice);
            cost.setCostType("支出");
            cost.setCostReason("观看付费视频");
            cost.setCostTime(new Date());
            costService.insert(cost);
            mav.addObject("videoID",videoId);
            mav.addObject("jumpAddress",jumpAddress);
        }
        return mav;
    }
}
