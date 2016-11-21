package com.kedu.arias.email;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {
	
	@Autowired
	private JavaMailSender mailsender;
	
	public void SendEmail(EmailDto email) throws Exception{
	
	System.out.println("EmailSender email : "+email);
	
	String host = "smtp.gmail.com";
	String from = "sookyykim@gmail.com";
	String to = email.getReceiver();
	String subject = "ARIAS Travle 비밀번호 확인 메일입니다.";
	String content = email.getContent();
	
	try {
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.user", from);
		props.put("mail.smtp.auth", "true");
		
		System.out.println("Properties : " + props);
		
		Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
			
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("sookyykim","kzpjthwujpjwbmgh");
			}
		});
		
		MimeMessage msg = new MimeMessage(mailSession);
		msg.setFrom(new InternetAddress(from, MimeUtility.encodeText("ARIAS Travle 입니다.", "utf-8", "B")));
	
		InternetAddress[] address1 = {new InternetAddress(to) };
		msg.setRecipients(Message.RecipientType.TO,	address1);
		msg.setSubject(subject);
		msg.setSentDate(new java.util.Date());	
		msg.setContent(content, "text/html; charset=euc-kr");
		
		
		/*MimeMessageHelper helper = new MimeMessageHelper(msg, true, "UTF-8");
		
		helper.setSubject(email.getSubject());
		helper.setText(email.getContent());
		helper.setTo(email.getReceiver());*/
		
		Transport.send(msg);
		
		System.out.println("SendEmail msg : " + msg);
	} catch(Exception e) {
		e.printStackTrace();
	} 
		
	/*try {
		msg.setSubject(email.getSubject());
		msg.setText(email.getContent());
		msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
		
	} catch(Exception e) {
		System.out.println("MessageingException");
		e.printStackTrace();
	}
	
	System.out.println("SendEmail msg : " + msg);
	try {
		mailsender.send(msg);
	} catch(Exception e) {
		System.out.println("Mail Exception 발생");
		e.printStackTrace();
	}*/
	}
}