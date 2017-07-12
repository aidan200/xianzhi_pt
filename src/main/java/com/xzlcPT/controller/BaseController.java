package com.xzlcPT.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

import com.util.IntegerEditor;
import com.util.LongEditor;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 默认controller，处理数据类型转换
 */
@ControllerAdvice
public class BaseController {

	private static Long index = (long)0;

	@InitBinder
	public void initBinder(WebDataBinder binder){
		binder.registerCustomEditor(long.class, new LongEditor());
		binder.registerCustomEditor(Long.class, new LongEditor());    
		binder.registerCustomEditor(int.class, new IntegerEditor());
		binder.registerCustomEditor(Integer.class, new IntegerEditor());
		//日期格式
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class,new CustomDateEditor(dateFormat, true));
	}

	/**生成订单号*/
	@RequestMapping("getOrderId")
	public String getOrderId(){
		Date dt= new Date();
		Long time= dt.getTime();//距离1970年1月1日0点0分0秒的毫秒数
		index +=1;
		if(index > 99999){index = (long)0;}
		return (time.toString() + index.toString());
	}
}


