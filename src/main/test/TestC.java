import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xzlcPT.bean.Cost;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2017/7/6.
 */
public class TestC {
    public static void main(String[] args) {

        Pattern p = Pattern.compile("^[\\w,\\.,-]*@[0-9A-Za-z]{1,20}((\\.com)|(\\.net)|(\\.com.cn)){1}$");
        Matcher m = p.matcher("aidan200@sina.student.com");
        boolean bl = m.matches();
        System.out.println(bl);
    }
}
