package itwillbs.p2c3.class_will.handler;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;

public class MailAuthenticator extends Authenticator{
	PasswordAuthentication passwordAuthentication;

	public MailAuthenticator() {
		passwordAuthentication = new PasswordAuthentication("bonnyjo106@naver.com", "BTRZCZKR96YN");
		
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}

	@Override
	public String toString() {
		return "MailAuthenticator [passwordAuthentication=" + passwordAuthentication + "]";
	}
	
	
}
