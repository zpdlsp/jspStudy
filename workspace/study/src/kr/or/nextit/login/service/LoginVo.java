package kr.or.nextit.login.service;

import java.io.Serializable;

public class LoginVo implements Serializable {
	
	private String userName;
	private String userID;
	private String userPW;
	private String userEmail;
	private String userHP;
	private String userRemember;
	
	private boolean result;
	private String message;
	
	public LoginVo() {
		
	}
	
	public LoginVo(String userName, String userID, String userPW, String userEmail) {
		this.userName = userName;
		this.userID = userID;
		this.userPW = userPW;
		this.userEmail = userEmail;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserRemember() {
		return userRemember;
	}
	public void setUserRemember(String userRemember) {
		this.userRemember = userRemember;
	}

	public String getUserHP() {
		return userHP;
	}

	public void setUserHP(String userHP) {
		this.userHP = userHP;
	}
	
	
}
