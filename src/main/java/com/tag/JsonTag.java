package com.tag;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * Created by Administrator on 2017/7/12.
 */
public class JsonTag extends TagSupport {

    private Object obj;

    @Override
    public int doStartTag() throws JspException {
        ObjectMapper mapper = new ObjectMapper();
        JspWriter out = pageContext.getOut();
        System.out.println(obj);
        if(obj!=null){
            try {
                String json = mapper.writeValueAsString(obj);
                out.print(json);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return SKIP_BODY;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }
}
