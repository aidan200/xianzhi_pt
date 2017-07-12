import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xzlcPT.bean.Cost;

/**
 * Created by Administrator on 2017/7/6.
 */
public class TestC {
    public static void main(String[] args) {

        Cost c = new Cost();
        c.setCostReason("aasdasdasd");

        ObjectMapper mapper = new ObjectMapper();
        try {
            String json = mapper.writeValueAsString(c);
            System.out.println(json);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }
}
