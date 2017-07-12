package com.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {
	public static void sendMail(String fromMail, String user, String password,  
            String toMail,  
            String mailTitle,  
            String mailContent ) throws Exception {  
			
		
			Properties props = new Properties();//可以加载一个配置文件
			// 使用smtp：简单邮件传输协议
			props.put("mail.smtp.host", "smtp.sina.com");//存储发送邮件服务器的信息
			props.put("mail.smtp.auth", "true");//同时通过验证
			
			props.setProperty("mail.debug", "true");
			props.setProperty("mail.transport.protocol", "smtp");
			Session session = Session.getInstance(props);//根据属性新建一个邮件会话
			//session.setDebug(true);  //有他会打印一些调试信息。
			
			MimeMessage message = new MimeMessage(session);//由邮件会话新建一个消息对象
			message.setFrom(new InternetAddress(fromMail));//设置发件人的地址
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail));//设置收件人,并设置其接收类型为TO
			message.setSubject(mailTitle);//设置标题
			//�����ż�����  
			//message.setText(mailContent); //发送 纯文本 邮件 todo
			message.setContent(mailContent, "text/html;charset=gbk");  //发送HTML邮件，内容样式比较丰富
			message.setSentDate(new Date());//设置发信时间
			message.saveChanges();//存储邮件信息

			//发送邮件
			//Transport transport = session.getTransport("smtp");  
			Transport transport = session.getTransport();  
			transport.connect(user, password);  
			transport.sendMessage(message, message.getAllRecipients());//发送邮件,其中第二个参数是所有已设好的收件人地址
			transport.close();  
	}  
	public static void main(String[] args) throws Exception {  
		sendMail("xianzhi_lc@sina.com", "xianzhi_lc@sina.com", "tt6403947",
		"372944573@qq.com",
		"感谢您使用新浪免费邮箱",
		"新浪免费邮箱安全、快速、稳定，简洁，国际顶级的反垃圾引擎，超大存储，2G超大附件，优异的海外通讯能力，高品质客户服务。我们将竭诚为您提供最专业的服务，致力成为您最满意的选择。\n" +
				"如果您是第一次使用新浪邮箱，有几点不得不说～");
	}  
}
