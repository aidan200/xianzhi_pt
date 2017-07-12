package com.util;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

/**
 * Created by Administrator on 2017/4/16.
 */
public class SavePicture {
    /**
     * 保存图片到项目
     *
     * @param photoFile
     * @param request
     */
    public static String savePicture(@RequestParam("photoFile") MultipartFile photoFile, HttpServletRequest request) {
        String filePath1 = System.getProperty("xianzhipt.path") + "dist/photo";
        File folder = new File(filePath1);
        boolean b = (folder.exists() && folder.isDirectory()) ? true : folder.mkdirs();
        System.out.println("创建文件夹:" + b);
        String picName = null;
        if (!photoFile.isEmpty()) {
            try {
                // 文件保存路径
//                String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/"
//                        + photoFile.getOriginalFilename();
//                文件名
                picName = System.currentTimeMillis() + photoFile.getOriginalFilename();
                String filePath = System.getProperty("xianzhipt.path") + "dist/photo/"
                        + picName;
                System.out.println(filePath);
                // 转存文件
                photoFile.transferTo(new File(filePath));
                System.out.println("转存成功");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return picName;
    }

    public static void saveVPicture(@RequestParam("photoFile") MultipartFile photoFile, HttpServletRequest request) {
        String filePath1 = System.getProperty("xianzhipt.path") + "dist/videoPic";
        File folder = new File(filePath1);
        boolean b = (folder.exists() && folder.isDirectory()) ? true : folder.mkdirs();
        System.out.println("创建文件夹:" + b);
        if (!photoFile.isEmpty()) {
            try {
                String filePath = System.getProperty("xianzhipt.path") + "dist/videoPic/"
                        + photoFile.getOriginalFilename();
                System.out.println(filePath);
                // 转存文件
                photoFile.transferTo(new File(filePath));
                System.out.println("转存成功");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 保存视频到项目
     *
     * @param videoFile
     * @param request
     */
    public static void saveVideo(@RequestParam("videoFile") MultipartFile videoFile, HttpServletRequest request) {
        String filePath1 = System.getProperty("xianzhipt.path") + "dist/video";
        File folder = new File(filePath1);
        boolean b = (folder.exists() && folder.isDirectory()) ? true : folder.mkdirs();
        System.out.println("创建文件夹:" + b);
        if (!videoFile.isEmpty()) {
            try {
                // 文件保存路径
//                String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/"
//                        + photoFile.getOriginalFilename();
                String filePath = System.getProperty("xianzhipt.path") + "dist/video/"
                        + videoFile.getOriginalFilename();
                System.out.println(filePath);
                // 转存文件
                videoFile.transferTo(new File(filePath));
                System.out.println("转存成功");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 上传视频方法
     * @param request
     * @return
     */
    public static String uploadVideo(HttpServletRequest request) {
        //  创建文件夹
        String filePath1 = System.getProperty("xianzhipt.path") + "dist/video";
        File folder = new File(filePath1);
        boolean b = (folder.exists() && folder.isDirectory()) ? true : folder.mkdirs();
        System.out.println("创建文件夹:" + b);

        System.out.println("上传测试 1");
        // 定义解析器去解析request
        CommonsMultipartResolver mutilpartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //request如果是Multipart类型、
        String fileName = null;
        if (mutilpartResolver.isMultipart(request)) {
            //强转成 MultipartHttpServletRequest
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            //获取文件名
            Iterator<String> it = multiRequest.getFileNames();
            while (it.hasNext()) {
                //获取MultipartFile类型文件
                MultipartFile fileDetail = multiRequest.getFile(it.next());
                if (fileDetail != null) {
                    fileName = System.currentTimeMillis() + fileDetail.getOriginalFilename();
                    String path = System.getProperty("xianzhipt.path") + "dist/video/" + fileName;
                    File localFile = new File(path);
                    //将上传文件写入到指定文件出、核心！
                    try {
                        fileDetail.transferTo(localFile);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    //非常重要、有了这个想做什么处理都可以
                    //fileDetail.getInputStream();
                }
            }
        }
        System.out.println("文件名:" + fileName);
        return fileName;
    }
}
