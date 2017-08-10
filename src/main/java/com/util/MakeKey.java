package com.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date ����ʱ�䣺2017��1��4�� ����1:57:44 
 * @version 1.0 
*/
public class MakeKey {
	public static String makeKey(){
		long l = new Date().getTime();
		String s = l+"";
		String s2 = s.substring(1);
		long a = Long.parseLong(s2);
		long a2 = a - 123456789876L;
		String m = a2+"";
		
		List<Object> strList = new ArrayList<>();
		
		int j = m.length()/2;
		for (int i = 0; i < j; i++) {
			String temp = m.substring(0, 2);
			int c = Integer.parseInt(temp);
			if(c<50){
				c+=50;
			}
			char cc;
			if((c<=57&&c>=48)||(c>=65&&c<=90)){
				if(c>=65&&c<=90){
					if(new Random().nextBoolean()){
						c+=32;
					}
				}
				cc = (char) c;
				strList.add(cc);
			}else{
				strList.add(c);
			}
			String temp2 = m.substring(2,m.length());
			m = temp2;
		}
		String code = "";
		for (Object object : strList) {
			code += object;
		}
		return code;
	}
}
