package com.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by Administrator on 2017/4/1.
 */
public class MD5 {
    public static String md5(String str)
    {
        MessageDigest md;
        StringBuffer sb = new StringBuffer();
        try {
            md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            byte[] data = md.digest();
            int index;
            for(byte b : data) {
                index = b;
                if(index < 0) index += 256;
                if(index < 16) sb.append("0");
                sb.append(Integer.toHexString(index));
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
    public static void main(String args[]){
        String a = MD5.md5("qweqwe");
        String b = MD5.md5("qweqwe1");
        System.out.println(a);
        System.out.println(b);
    }
}
