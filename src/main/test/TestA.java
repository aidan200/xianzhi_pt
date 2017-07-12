import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 测试正则
 *
 * @author 王天岳
 * @create 2017-05-24 17:41
 **/
public class TestA {
    /**
     * 测试方法
     *
     * @param name
     * @return
     */
    public static boolean test1(String name) {
        String regEx = "Register|Xz|Company|Video|XzResumeSend|Skill|VideoClass|SendResume|goIndex|Login|Experience|Education|Recruit|Project|MD5|Base64|ComPareDate|Mobile|SavePicture"; //选中的文件名字段

        String regEx2 = "CompanyVip|Recent|VideoDiscuss"; //排除的文件名字段

        Pattern p = Pattern.compile(regEx);

        Pattern p2 = Pattern.compile(regEx2);

        Matcher m = p.matcher(name);

        Matcher m2 = p2.matcher(name);

        if (m.find() && !m2.find()) {
            return true;
        } else {
            return false;
        }
    }

    public static void main(String[] args) {
        String str = "For my money, the important thing " + "about the meeting was bridge-building";
        String regEx = "company"; //表示a或f
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        boolean result = m.find();
        System.out.println(result);
    }
}
