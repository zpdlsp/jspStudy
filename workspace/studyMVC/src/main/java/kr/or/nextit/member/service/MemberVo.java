package kr.or.nextit.member.service;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class MemberVo {

	private int num;
	private String memId;
	private String memPw;
	private String memName;
	private String memNickname;
	private String memAddr;
	private String regDate;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemNickname() {
		return memNickname;
	}
	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public void setMemAddr(String addr) {
		this.memAddr = addr;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
}
