package kr.or.nextit.member.service;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class MemberSearchVo {

	private String searchType;
	private String searchText;
	
	private String memId;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
}
