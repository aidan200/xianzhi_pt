package com.xzlcPT.controller;

import com.xzlcPT.bean.XzField;
import com.xzlcPT.service.XzFieldService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/10.
 */
@Controller
@RequestMapping("Field")
public class FieldController {
    @Autowired
    private XzFieldService fieldService;

    @ResponseBody
    @RequestMapping("selByType")
    public Map selByType(int type){
        Map<String,Object> map = new HashMap<>();
        List<XzField> fields = fieldService.selectByType(type);
        map.put("fieldList",fields);
        return map;
    }

}
