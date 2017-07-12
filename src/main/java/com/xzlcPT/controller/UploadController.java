package com.xzlcPT.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/6.
 */
@Controller
@RequestMapping("/upload")
public class UploadController extends BaseController{
    @ResponseBody
    @RequestMapping("/img")
    public Map<String,Object> uploadImg(MultipartFile file, HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        String fileName = (file.getOriginalFilename());
        System.out.println("开始");
        String path = request.getSession().getServletContext().getRealPath("uploadImg");
        String prefix=fileName.substring(fileName.lastIndexOf(".")+1);
        fileName = new Date().getTime()+"."+prefix;
        System.out.println(path);
        File targetFile = new File(path, fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        //保存
        try {
            file.transferTo(targetFile);
            map.put("msg","ok");
            map.put("imgName",fileName);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg","err");
        }
        return map;
    }
}
