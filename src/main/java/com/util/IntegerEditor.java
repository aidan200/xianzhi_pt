package com.util;

import java.beans.PropertyEditorSupport;

/** 
 * @author  gycx E-mail: gycxmilkyway@163.com
 * @date ����ʱ�䣺2017��1��6�� ����9:18:36 
 * @version 1.0 
*/
public class IntegerEditor extends PropertyEditorSupport{

	@Override
	public String getAsText() {
		 return getValue().toString();
	}

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if(text==null||text.equals("")){
			text="0";
		}
		setValue(Integer.parseInt(text));    
	}
	

}


