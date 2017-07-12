package com.xzlcPT.controller;

import com.sun.tracing.dtrace.ModuleAttributes;
import com.util.SavePicture;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;

/**
 * 测试AJAX 上传文件
 *
 * @author 王天岳
 * @create 2017-05-17 15:20
 **/
@Controller
@RequestMapping("testFile")
@SessionAttributes("fileName")
public class TestUpdateController {

    @ResponseBody
    @RequestMapping("uploadTest")
    public String testUpload(HttpServletRequest request, ModelMap model) {
        String fileName = SavePicture.uploadVideo(request);
        return fileName;
    }
}