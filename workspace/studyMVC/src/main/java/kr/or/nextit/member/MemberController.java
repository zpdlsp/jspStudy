package kr.or.nextit.member;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import kr.or.nextit.HomeController;
import kr.or.nextit.member.service.MemberSearchVo;
import kr.or.nextit.member.service.MemberService;
import kr.or.nextit.member.service.MemberVo;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private final Logger log = LoggerFactory.getLogger(this.getClass());
	
    //@Autowired
	@Resource(name="MemberService")
	private MemberService memberService;
	
	@RequestMapping(value= {"/memberInsert.do"})
	public ModelAndView insertMemberItem(
			@ModelAttribute MemberVo memberVo
			) {
		
		ModelAndView modelAndView = new ModelAndView("member/memberInsert");
		
		return modelAndView;
	}
	
	@RequestMapping(value= {"/memberInsertProc.do"})
	public String memberInsertProc(
			@ModelAttribute("memberItem") MemberVo memberVo
			) throws Exception {
		
		log.debug("memberVo : {}", memberVo);
		
		try {
			 boolean result = memberService.insertMemberItem(memberVo);
			 if(result) {		 
				 return "redirect:/member/memberList.do";
//				 return "redirect:/member/memberView.do?memId=" + memberVo.getMemId();
			 } else {
				 throw new SQLException("누락된 데이터가 있습니다");
			 }
		} catch (Exception e) {
			e.printStackTrace();
			log.error("ID 체크 : {}", e.getMessage());
			return "member/memberInsert";
		}
	
	}
	
	
	
	//					   /member/memberList.do
	@RequestMapping(value="/memberList.do")
	public String getMemberList(
			Model model,
			ModelMap modelMap,
			@RequestParam HashMap<String, Object> params,
			@ModelAttribute MemberSearchVo memberSearchVo
			) throws Exception{
		
//		List<HashMap<String, Object>> memberList = memberService.getMemberListMap();
//		
//		model.addAttribute("memberList", memberList);
		
		log.debug("params : {}", params);
		
		log.debug("memberSearchVo : {}", memberSearchVo);
		
		int totalCount = memberService.getMemberTotalCnt(memberSearchVo);
		
		log.debug("검색 결과 조회수 : {}", totalCount);
		
		List<MemberVo> memberList = memberService.getMemberListVo(memberSearchVo);
		
		model.addAttribute("memberList", memberList);
		
		return "member/memberList";
	}
	
	@RequestMapping(value= {"/memberView.do"})
	public ModelAndView getMemberItemView(
			ModelAndView modelAndView,
			@RequestParam HashMap<String, Object> params,
			@ModelAttribute("searchVo") MemberSearchVo memberSearchVo
			) {
		
		log.debug("params : {}", params);
		log.debug("memberSearchVo : {}", memberSearchVo);
		
		try {
			MemberVo memberItemResult = memberService.selectMemberItem(memberSearchVo);
			
			modelAndView.addObject("memberItem", memberItemResult);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		modelAndView.setViewName("member/memberView");
		
		
		return modelAndView;
	}
	
	@RequestMapping(value= {"/memberDelete.do"})
	public ModelAndView deleteMemberItemView(
			ModelAndView modelAndView,
			MemberSearchVo memberSearchVo
			) throws Exception {
		
		boolean result = memberService.deleteMemberItem(memberSearchVo.getMemId());
		
		RedirectView redirectView = new RedirectView();
		if(result) {
			// 삭제 성공
			redirectView.setUrl("/member/memberList.do");
		} else {
			// 삭제 실패
			redirectView.setUrl("/member/memberView.do");
			redirectView.addStaticAttribute("memId", memberSearchVo.getMemId());
		}
		
		modelAndView.setView(redirectView);
		
		return modelAndView;
	}
	
	@RequestMapping(value= {"/memberUpdate.do"})
	public String updateMemberForm(
			Model modelMap,
			@RequestParam HashMap<String, Object> params,
			@ModelAttribute MemberSearchVo memberSearchVo
			) throws Exception {
		
		log.debug("params : {}", params);
		log.debug("memberSearchVo : {}", memberSearchVo);
		
		MemberVo memberItem = memberService.selectMemberItem(memberSearchVo);
		
		modelMap.addAttribute("memberItem", memberItem);
		
		return "member/memberUpdate";
	}
	
	@RequestMapping(value= {"/memberUpdateProc.do"})
	public String updateMemberProc(
			@ModelAttribute MemberVo memberVo,
			@RequestParam HashMap<String, Object> params
			) throws Exception {
		
		log.debug("params : {}", params);
		log.debug("memberVo : {}", memberVo);
		
		try {
			 boolean result = memberService.updateMemberItem(params);
			 if(result) {
				 
				 return "redirect:/member/memberView.do?memId=" + memberVo.getMemId() ;
			 } else {
				 throw new SQLException("질의어 수행 시 에러가 발생");
			 }
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception(e.getMessage(), e);
		}
		
		
	}
	
}
