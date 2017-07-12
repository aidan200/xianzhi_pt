package com.util.weixin;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * 生成二维码方法
 *
 * @author 王天岳
 * @create 2017-05-26 15:47
 **/
public class GenerateQrcode {
    public static String generateQrcode(String codeurl) {
        File foldler = new File(System.getProperty("xianzhipt.path") + "dist/qrcode");
        if(!foldler.exists()) {
            foldler.mkdirs();
        }

        String f_name = System.currentTimeMillis()+StochasticNumber.buildRandom(5) + ".png";
        try {
            File f = new File(System.getProperty("xianzhipt.path") + "dist/qrcode", f_name);
            FileOutputStream fio = new FileOutputStream(f);
            MultiFormatWriter multiFormatWriter = new MultiFormatWriter();
            Map hints = new HashMap();
            hints.put(EncodeHintType.CHARACTER_SET, "UTF-8"); //设置字符集编码类型
            BitMatrix bitMatrix = null;
            bitMatrix = multiFormatWriter.encode(codeurl, BarcodeFormat.QR_CODE, 300, 300,hints);
            BufferedImage image = MatrixToImageWriter.toBufferedImage(bitMatrix);
            //输出二维码图片流
            ImageIO.write(image, "png", fio);
            return f_name;
        } catch (Exception e1) {
            e1.printStackTrace();
            return null;
        }
    }
}
