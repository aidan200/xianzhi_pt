import com.util.AlipayUtil;
import com.xzlcPT.bean.XzVideo;
import com.xzlcPT.service.VideoService;
import com.xzlcPT.service.impl.VideoServiceImpl;

import java.io.FileWriter;
import java.io.IOException;


/**
 * Created by Administrator on 2017/5/2.
 */
public class Test {
    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(AlipayUtil.log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
