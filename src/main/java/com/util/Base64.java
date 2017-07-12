package com.util;

import sun.misc.BASE64Decoder;
import java.io.*;
import java.lang.reflect.Method;

/**
 * base64 转码
 *
 * @author 王天岳
 * @create 2017-04-24 11:15
 **/
public class Base64 {

    public static byte[] decodeBase64(String input,String picName) throws Exception{
//        创建文件夹
        String filePath1 = System.getProperty("xianzhipt.path") + "dist/videoPic";
        File folder = new File(filePath1);
        boolean b = (folder.exists() && folder.isDirectory()) ? true : folder.mkdirs();
        System.out.println("创建文件夹:"+b);
//        图片转码
        Class clazz=Class.forName("com.sun.org.apache.xerces.internal.impl.dv.util.Base64");
        Method mainMethod= clazz.getMethod("decode", String.class);
        mainMethod.setAccessible(true);
        Object retObj=mainMethod.invoke(null, input);
        String path = System.getProperty("xianzhipt.path") + "dist/videoPic/"+picName+".png";
        OutputStream out = new FileOutputStream(path);
        out.write((byte[])retObj);
        out.flush();
        out.close();
        return (byte[])retObj;
    }

}
