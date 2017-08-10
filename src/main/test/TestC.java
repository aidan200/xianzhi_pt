

import com.util.MakeKey;

import java.io.File;
import java.io.FileOutputStream;
import java.math.BigInteger;

/**
 * Created by Administrator on 2017/7/6.
 */
public class TestC {
    public static void main(String[] args) {

        /*Pattern p = Pattern.compile("^[\\w,\\.,-]*@[0-9A-Za-z]{1,20}((\\.com)|(\\.net)|(\\.com.cn)){1}$");
        Matcher m = p.matcher("aidan200@sina.student.com");
        boolean bl = m.matches();
        System.out.println(bl);*/
        String key = MakeKey.makeKey();
        System.out.println(key);
    }
}
