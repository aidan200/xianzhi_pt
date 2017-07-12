package com.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * Created by Administrator on 2017/4/20.
 */
public class PageTag extends TagSupport {
    private int pBegin;
    private int pEnd;
    private int page;
    private int pages;
    private int length;

    @Override
    public int doStartTag() throws JspException {
        fen(length,page,pages);
        JspWriter out = pageContext.getOut();
        try {
            if(page==1){
                out.print("<li><a class=\"a\" onclick=\"pToSub()\">&laquo;</a></li>");
            }else{
                out.print("<li><a class=\"b\" onclick=\"pToSub(1)\">&laquo;</a></li>");
            }
            for(int i = pBegin;i <= pEnd;i++){
                out.print("<li ");
                if(i==page){
                    out.print("class='active'");
                }
                out.print("><a class=\"b\" onclick=\"pToSub(");
                if(i!=page){
                    out.print(i);
                }
                out.print(")\">"+i+"</a></li>");
            }
            if(pEnd==page){
                out.print("<li><a class=\"a\" onclick=\"pToSub()\">&raquo;</a></li>");
            }else{
                out.print("<li><a class=\"b\" onclick=\"pToSub("+pages+")\">&raquo;</a></li>");
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return SKIP_BODY;
    }

    private void fen(int length,int page,int pages){
        if(pages>length){
            pBegin = page-length/2;
            if(pBegin<=0){
                pBegin = 1;
            }
            pEnd = length+pBegin-1;
            if(pEnd>pages){
                pEnd = pages;
                pBegin = pEnd -length+1;
            }
        }else{
            pBegin = 1;
            pEnd =pages;
        }
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }
}
