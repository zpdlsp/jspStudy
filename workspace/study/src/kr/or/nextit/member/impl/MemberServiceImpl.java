package kr.or.nextit.member.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.nextit.function.MemberUtil;
import kr.or.nextit.function.service.CommCodeVo;
import kr.or.nextit.jdbc.MybatisSqlSessionFactory;
import kr.or.nextit.member.MemberService;
import kr.or.nextit.member.MemberVo;

public class MemberServiceImpl implements MemberService {

	// mybatis session Factory 객체 인스턴스 생성
	private SqlSessionFactory sessionFactory = MybatisSqlSessionFactory.getSqlSessionFactory();
	private MemberMapper memberMapper;
	
	@Override
	public List<MemberVo> getMemberList(MemberVo memberVo) throws Exception {
	
		SqlSession session = null;
		
		
		try {
			session = sessionFactory.openSession();
	
			memberMapper = session.getMapper(MemberMapper.class);
			
			return memberMapper.selectMemberList(memberVo);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if(session != null) {
				session.close();
			}
		}
		
		
	}
	
	@Override
	public void insertUserInfo(HashMap<String, Object> params) {
		
		System.out.println(params);
		System.out.println(params);
		System.out.println(params);
		
	}

	@Override
	public MemberVo insertUserInfo(String userID, HashMap<String, Object> params) {
		
		MemberVo result = new MemberVo();
		
		result.setUserID(userID);
		result.setUserName((String)params.get("userName"));
		result.setUserEmail(String.format("%s", params.get("userEmail")));
		
		List<CommCodeVo> hobbyItems = MemberUtil.getHobbyItems();	// 전체리스트
		String[] userHobbys = (String[])params.get("userHobby");	// 선택한 값들
		
		int i = 0;
		for(String userHobby : userHobbys) {		// 선택한 값을
			for(CommCodeVo item : hobbyItems) {		// 전체리스트와 비교
				if(userHobby.equals(item.getKey())) {
					userHobbys[i] = String.format("%s (%s)", item.getValue(), item.getKey());
					i++;
					break;
				}
			}
		}
		
		result.setUserHobby(userHobbys);
		
		return result;
	}

	@Override
	public MemberVo getMemberItem(String userID) throws Exception {
		
		SqlSession session = null;
		
		try {
			session = sessionFactory.openSession();
			
			memberMapper = session.getMapper(MemberMapper.class);
			
			MemberVo memberInfo = memberMapper.selectMemberItem(userID);
			// insert, update, delete 사용 시 꼭 사용;
			//session.commit();
			return memberInfo;
		} catch (Exception e) {
			e.printStackTrace();
			// insert, update, delete 구현 시 에러가 발생하면,
			// 추가 변경 삭제된 데이터를 원래 상태로 복구
			//session.rollback();
			//return new MemberVo();
			//			memberVo.getUserID() != null
			return null;
		} finally {
			if(session != null) {
				try {
					session.close();
				} catch (Exception e) {
					System.err.println(e.getMessage());
				}
			}
		}
	}

	

}
