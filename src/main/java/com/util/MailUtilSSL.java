package com.util;

import com.util.bean.EmailConf;
import com.util.bean.MessageInfo;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.security.Security;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

/**
 * Created by Administrator on 2017/7/19.
 */
public class MailUtilSSL {
    public static boolean sslSend(MessageInfo msg1, EmailConf emailAccount)
            throws AddressException, MessagingException, IOException {
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        // Get a Properties object
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", emailAccount.getPlace());
        props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.auth", "true");

        final String username = emailAccount.getUsername();
        final String password = emailAccount.getPassword();
        Session session = Session.getDefaultInstance(props, new Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }});
        Message msg = new MimeMessage(session);

        // 设置发件人和收件人
        msg.setFrom(new InternetAddress(emailAccount.getUsername()));
        List<String> tos = msg1.getTo();
        Address to[] = new InternetAddress[tos.size()];
        for(int i=0;i<tos.size();i++){
            to[i] = new InternetAddress(tos.get(i));
        }
        // 多个收件人地址
        msg.setRecipients(Message.RecipientType.TO, to);
        msg.setSubject(msg1.getSubject()); // 标题
        msg.setText(msg1.getMsg());// 内容
        msg.setSentDate(new Date());
        Transport.send(msg);
        System.out.println("EmailUtil ssl协议邮件发送打印" +msg.toString());
        return true;
    }

    public static void main(String[] args) {
        EmailConf ec = new EmailConf();
        ec.setUsername("xianzhi_lc@sina.com");
        ec.setPassword("tt6403947");
        ec.setPlace("smtp.sina.com");
        MessageInfo mi = new MessageInfo();
        mi.setFrom("xianzhi_lc@sina.com");
        List<String> toMailList = new ArrayList<>();
        toMailList.add("372944573@qq.com");
        mi.setTo(toMailList);
        mi.setSendDate(new Date());
        mi.setSubject("先知平台测试邮件");
        mi.setMsg("测试一下");
        try {
            sslSend(mi,ec);
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
