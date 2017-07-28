import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xzlcPT.bean.Cost;
import org.apache.poi.xwpf.usermodel.ParagraphAlignment;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by Administrator on 2017/7/6.
 */
public class TestC {
    public static void main(String[] args) {

        /*Pattern p = Pattern.compile("^[\\w,\\.,-]*@[0-9A-Za-z]{1,20}((\\.com)|(\\.net)|(\\.com.cn)){1}$");
        Matcher m = p.matcher("aidan200@sina.student.com");
        boolean bl = m.matches();
        System.out.println(bl);*/

        //Blank Document
        XWPFDocument document= new XWPFDocument();

        //Write the Document in file system
        try {
            FileOutputStream out = new FileOutputStream(new File("e:/tttest.docx"));
            //添加标题
            XWPFParagraph titleParagraph = document.createParagraph();
            //设置段落居中
            titleParagraph.setAlignment(ParagraphAlignment.CENTER);

            XWPFRun titleParagraphRun = titleParagraph.createRun();
            titleParagraphRun.setText("Java PoI");
            titleParagraphRun.setColor("000000");
            titleParagraphRun.setFontSize(20);


            document.write(out);
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
