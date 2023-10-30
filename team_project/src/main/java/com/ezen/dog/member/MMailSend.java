package com.ezen.dog.member;

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

public class MMailSend {
	

	 private static Map<String, String> authKeyMap = new HashMap<String, String>();
	
	 public static void sendMail(String email) {
		 
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
	        
	        // 占쏙옙占쏙옙占�
	        Session ss = Session.getDefaultInstance(p, auth);
	        ss.setDebug(true);
	         
	        try{
	            msg.setSentDate(new Date(0));
	            InternetAddress from = new InternetAddress() ;	
	            from = new InternetAddress("test9987@naver.com");
	            msg.setFrom(from);
	            InternetAddress to = new InternetAddress(email);
	            msg.setRecipient(Message.RecipientType.TO, to);
	            msg.setSubject("[cloggy] 회원가입 메일 인증", "UTF-8");
	            String authKey = createKey();
	            String emailBody = "회원님의 인증번호는 : " + authKey + "입니다.";
	            msg.setText(emailBody, "UTF-8");
	            msg.setHeader("content-Type", "text/html");
	            javax.mail.Transport.send(msg, msg.getAllRecipients());
	            authKeyMap.put(email, authKey);
	            
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

	// 占쏙옙占쏙옙 占쏙옙占쏙옙 占쌘듸옙
	public static String createKey() {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 8; i++) {
			int index = rnd.nextInt(3);
			switch (index) {
			case 0:
				key.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				key.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				key.append((rnd.nextInt(10)));
				break;
			}
		}
		return key.toString();
	}
	
    //  占쏙옙占쏙옙 占쌘듸옙 占쏙옙占쏙옙
    public static boolean verifyKey(String email, String userInputKey) {
        String storedKey = authKeyMap.get(email);
        return storedKey != null && storedKey.equals(userInputKey);
    }

}
