<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.mail.*,javax.mail.internet.*,java.util.Properties;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mail</title>
</head>
<body>
<%

String from = request.getParameter("from");
from = "suratsurat51@gmail.com";

//Get properties object    
Properties props = new Properties();    
props.put("mail.smtp.host", "smtp.gmail.com");    
props.put("mail.smtp.socketFactory.port", "465");    
props.put("mail.smtp.socketFactory.class",    
          "javax.net.ssl.SSLSocketFactory");    
props.put("mail.smtp.auth", "true");    
props.put("mail.smtp.port", "465");    
//get Session   
Session mailSession = Session.getDefaultInstance(props,    
 new javax.mail.Authenticator() {    
 protected PasswordAuthentication getPasswordAuthentication() {    
 return new PasswordAuthentication(from,"s1u2r3a4t5");  
 }    
});    
//compose message    
try {    
 MimeMessage message = new MimeMessage(mailSession);    
 message.addRecipient(Message.RecipientType.TO,new InternetAddress("suratsurat51@gmail.com"));    
 message.setSubject("Subject");    
 message.setText("Hai");    
 //send message  
 Transport.send(message);    
 System.out.println("message sent successfully");    
} catch (MessagingException e) {throw new RuntimeException(e);}    
   


%>
</body>
</html>