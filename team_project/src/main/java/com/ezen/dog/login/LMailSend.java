package com.ezen.dog.login;

import java.net.PasswordAuthentication;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

public class LMailSend {
	
	 public static void sendMail(String email, String password) {
		 
	        Properties p = System.getProperties();
	        p.put("mail.smtp.starttls.enable", "true");
	        p.put("mail.smtp.host", "smtp.naver.com");
	        p.put("mail.smtp.auth","true");
	        p.put("mail.smtp.port", "465");
	        p.put("mail.smtp.socketFactory.port", "465");
	        p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        p.put("mail.smtp.socketFactory.fallback", "false");
	           
	        Authenticator auth = new MyAuthentication();
	        Session session = Session.getDefaultInstance(p, auth);
	        MimeMessage msg = new MimeMessage(session);
	        
	        try{
	            msg.setSentDate(new Date(0));
	            InternetAddress from = new InternetAddress() ;	
	            from = new InternetAddress("test9987@naver.com");
	            msg.setFrom(from);
	            InternetAddress to = new InternetAddress(email);
	            msg.setRecipient(Message.RecipientType.TO, to);
	            msg.setSubject("[cloggy] 비밀번호 찾기", "UTF-8");
	            String emailBody = "안녕하세요. (주)클로기입니다.<br>";
	            emailBody += "회원님의 비밀번호 찾기 결과입니다.<br><br>";
				emailBody += "<table style=\"text-align:center; height: 50px; width:200px; background-color: #e28b3a; font-family: 'Noto Sans KR', sans-serif; border: 1px solid #e28b3a; font-size: 12px;\">";
				emailBody += "<tr>";
				emailBody += "<th style=\"color:#ffffff;\">비밀 번호</th>";
				emailBody += "<td style=\"background-color:#ffffff; color:red; font-weight: bold;\">" + password + "</td>";
				emailBody += "</tr>";
				emailBody += "</table><br>";
	            emailBody += "로그인 창으로 돌아가 로그인해 주세요.<br>";
	            emailBody += "<p style=\"color:gray; \">본 메일은 발신 전용 메일이므로, 문의사항은 홈페이지 내 고객센터를 이용해주세요.</p>";	            
	            msg.setText(emailBody, "UTF-8");
	            msg.setHeader("content-Type", "text/html");
	            javax.mail.Transport.send(msg, msg.getAllRecipients());
	            
	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        }catch (Exception msg_e) {
	            msg_e.printStackTrace();
	        }
	    }
	 
	public static class MyAuthentication extends Authenticator {	
	      
	    javax.mail.PasswordAuthentication pa;
	    public MyAuthentication(){
	        String id = "test9987@naver.com";
	        String pw = "test9987@";
	 
	        pa = new javax.mail.PasswordAuthentication(id, pw);
	    }
	    public javax.mail.PasswordAuthentication getPasswordAuthentication() {
	        return pa;
	    }
	}
}
