package kr.or.nextit.mber.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import kr.or.nextit.member.MemberVo;

//mybatis Mapper.xml 에서 자동으로 해주는 작업
public class MapTest {

	public static void main(String[] args) {
	
		HashMap<String, Object> parameterType = new HashMap<>();
		parameterType.put("memberVo", new MemberVo());
		parameterType.put("userID", "master");
		parameterType.put("userID", 3);
		parameterType.put("userID", 3.254);
		parameterType.put("1", new MemberVo());
		parameterType.put("2", new MemberVo());
		parameterType.put("3", new MemberVo());
		parameterType.put("4", new MemberVo());
		parameterType.put("5", new MemberVo());
		
		
		List<MemberVo> memberList = new ArrayList<>();
		Set<String> keys = parameterType.keySet();
		for(String key : keys) {
			System.out.println(key);
			System.out.println(parameterType.get(key));
			memberList.add((MemberVo)parameterType.get(key));
		}
		
		for(MemberVo memberInfo : memberList) {
			System.out.println(memberInfo);
		}
		
		HashMap<String, Object> resultType = new HashMap<>();
		
		MemberVo memberVo = new MemberVo();
		memberVo.setUserID("");
		
		
		HashMap<String, Object> vo = new HashMap<>();
		vo.put("userID", memberVo.getUserID());
		vo.put("userName", memberVo.getUserName());
		vo.put("userEmail", memberVo.getUserEmail());
		
		
	}
	
}
