package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.Calendar;

/**
 * Created by Administrator on 2017/7/21.
 */
public class AgeTag extends TagSupport {

    private String year;

    @Override
    public int doStartTag() throws JspException {
        if(year!=null&&!year.equals("")){
            JspWriter out = pageContext.getOut();
            Calendar a= Calendar.getInstance();
            int dyear = a.get(Calendar.YEAR);
            try {
                out.print(dyear-Integer.parseInt(year));

            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return SKIP_BODY;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }
}
