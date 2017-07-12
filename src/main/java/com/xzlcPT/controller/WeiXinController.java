package com.xzlcPT.controller;

import com.util.weixin.GenerateQrcode;
import com.util.weixin.WeixinPay;
import com.xzlcPT.bean.TrackOrderResponse;
import com.xzlcPT.bean.UnifiedOrderResponse;
import com.xzlcPT.service.OrderRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 微信支付 controller
 *
 * @author 王天岳
 * @create 2017-05-25 18:31
 **/
@Controller
@RequestMapping("weixin")
public class WeiXinController {

    @Autowired
    private OrderRecordService orderRecordService;
    /**
     * 向微信端发送订单请求
     * @param total_fee (付款金额)
     */
    @RequestMapping("sentInfo.do")
    public ModelAndView sentInfo(String total_fee){
//        System.out.println(total_fee);
        ModelAndView mv = new ModelAndView("foreEnd/weixinPay");
//        UnifiedOrderResponse response =  WeixinPay.result(Double.valueOf(total_fee)*100);
        UnifiedOrderResponse response =  WeixinPay.result(Double.valueOf(1));
        String qrcodeName = GenerateQrcode.generateQrcode(response.getCode_url()); //调用 生成二维码方法 返回二维码图片名称
        response.setQrcodeName(qrcodeName);
        response.setTotal_fee(Double.valueOf(1));
        mv.addObject("response",response);
        TrackOrderResponse trackOrderInfo = WeixinPay.trackOrder(response.getOut_trade_no());
        int a = orderRecordService.insertOrderRecord(trackOrderInfo);
        if (a!=0){
            System.out.println("插入记录成功!");
        }else{
            System.out.println("插入记录失败!");
        }

        return mv;
    }

    public ModelAndView status(String xml){
        ModelAndView mv = new ModelAndView();
        return mv;
    }

    /**
     * 查询订单方法
     * @param out_trade_no
     * @return
     */
    @ResponseBody
    @RequestMapping("trackOrder.do")
    public Map<String,Object> trackOrder(String out_trade_no){
        Map<String,Object> map = new HashMap<>();
        TrackOrderResponse trackOrderResponse = orderRecordService.selectOrderRecord(out_trade_no);
        boolean b1 = !"SUCCESS".equals(trackOrderResponse.getTrade_state());
        if(b1){
            TrackOrderResponse trackOrderInfo = WeixinPay.trackOrder(out_trade_no);
            System.out.println("trackOrder.do1 "+trackOrderInfo);
            System.out.println("trackOrder.do3 "+trackOrderInfo.getTrade_state());
            System.out.println("trackOrder.do4 "+trackOrderInfo.getOrder_id());
            if ("SUCCESS".equals(trackOrderInfo.getTrade_state())){

                trackOrderInfo.setOrder_id(trackOrderResponse.getOrder_id());
                trackOrderInfo.setRecord_time(new Date());
                System.out.println("trackOrder.do5 "+trackOrderInfo);

                int a = orderRecordService.updateOrderRecord(trackOrderInfo);

                if(a!=0){
                    System.out.println("修改记录成功");
                }else{
                    System.out.println("修改记录失败");
                }
            }
            map.put("trackOrder",trackOrderInfo.getTrade_state());
        }else{
            map.put("trackOrder",trackOrderResponse.getTrade_state());
        }
        return map;
    }

}
