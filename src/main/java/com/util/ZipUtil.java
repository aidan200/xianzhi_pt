package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.CRC32;
import java.util.zip.CheckedOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Created by Administrator on 2017/8/3.
 */
public class ZipUtil {

    static final int BUFFER = 2048;

    public static void main(String[] args) {
        List<File> files = new ArrayList<>();
        File file = new File("e:/tttest.pdf");
        files.add(file);
        compress("e:/aaa.zip",files);
    }

    public static File compress(String zipPath, List<File> Files) {
        //压缩后的文件对象
        File zipFile = new File(zipPath);
        try {
            //创建写出流操作
            FileOutputStream fileOutputStream = new FileOutputStream(zipFile);
            CheckedOutputStream cos = new CheckedOutputStream(fileOutputStream,new CRC32());
            ZipOutputStream out = new ZipOutputStream(cos);
            for(File file:Files){
                //创建需要压缩的文件对象
                if (!file.exists()){
                    throw new RuntimeException(file.getName() + "不存在！");
                }
                compressFile(file, out);
            }
            out.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return zipFile;
    }

    private static void compressFile(File file, ZipOutputStream out) {
        if (!file.exists()) {
            return;
        }
        try {
            BufferedInputStream bis = new BufferedInputStream(
                    new FileInputStream(file));
            //创建Zip实体，并添加进压缩包
            ZipEntry entry = new ZipEntry(file.getName());
            out.putNextEntry(entry);
            //读取待压缩的文件并写进压缩包里
            int count;
            byte data[] = new byte[BUFFER];
            while ((count = bis.read(data, 0, BUFFER)) != -1) {
                out.write(data, 0, count);
            }
            bis.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
