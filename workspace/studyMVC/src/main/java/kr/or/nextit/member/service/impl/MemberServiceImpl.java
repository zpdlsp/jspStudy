package kr.or.nextit.member.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.nextit.member.service.MemberSearchVo;
import kr.or.nextit.member.service.MemberService;
import kr.or.nextit.member.service.MemberVo;

@Service("MemberService")
public class MemberServiceImpl implements MemberService{
	
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public List<HashMap<String, Object>> getMemberListMap() throws Exception {

		List<HashMap<String, Object>> memberList = new ArrayList<>();
		
		HashMap<String, Object> memberItem = new HashMap<>();
		memberItem.put("memId", "master");
		memberItem.put("memName", "매스터");
		memberList.add(memberItem);
		
		memberItem = new HashMap<>();
		memberItem.put("memId", "admin");
		memberItem.put("memName", "관리자");
		memberList.add(memberItem);
		
		return memberList;
	}

	@Override
	public List<MemberVo> getMemberListVo(MemberSearchVo memberSearchVo) throws Exception {
		
		return memberMapper.selectMemberList(memberSearchVo);
	}

	@Override
	public int getMemberTotalCnt(MemberSearchVo memberSearchVo) throws Exception {
		
		return memberMapper.selectMemberCnt(memberSearchVo);
	}

	@Override
	public MemberVo selectMemberItem(MemberSearchVo memberSearchVo) throws Exception {
		
		return memberMapper.selectMemberItem(memberSearchVo);
	}

	@Override
	public boolean deleteMemberItem(String memId) throws Exception {

		try {
			memberMapper.deleteMemberItem(memId);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean updateMemberItem(HashMap<String, Object> params) throws Exception {
		
		try {
			memberMapper.updateMemberItem(params);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean insertMemberItem(MemberVo memberVo) throws Exception {
		
		try {
			memberMapper.insertMemberItem(memberVo);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	
}
