package com.util;

import org.springframework.beans.propertyeditors.PropertiesEditor;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date ����ʱ�䣺2017��1��6�� ����3:28:04 
 * @version 1.0 
*/
public class LongEditor extends PropertiesEditor{
	@Override    
    public void setAsText(String text) throws IllegalArgumentException {    
        if (text == null || text.equals("")) {    
            text = "0";    
        }    
        setValue(Long.parseLong(text));    
    }    
    
    @Override    
    public String getAsText() {
	    Object o;
	    o = getValue();
	    if(o!=null){
            return getValue().toString();
        }else{
	        return  null;
        }
    }
}
