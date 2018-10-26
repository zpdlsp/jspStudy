package kr.or.nextit.main.web;

import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SubController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value= "main/subPage.do")
	public String getSubPage(Model model) {
		
		model.addAttribute("title", "subPage return (String)");
		
		// jsp 파일 경로 path + 파일명(확장자 제외)
		return "main/subPage";
	}
	
	@RequestMapping(value= "main/subPage2.do")
	public ModelAndView testModelAndView(
			ModelAndView modelAndView, 
			Model model,
			ModelMap modelMap
			) throws Exception {
		
		logger.info("실행 클래스 : {}",this.getClass().getName());
		
		modelAndView.setViewName("main/subPage");
		//modelAndView.addObject("title", "subPage return (ModelAndView)");
		//model.addAttribute("title", "subPage return (ModelAndView)");
		modelMap.addAttribute("title", "subPage return (ModelAndView)");
		
		modelAndView.addObject(modelMap);
		Map<String, Object> modelMaps = modelAndView.getModel();
		
		Set<String> keyNames = modelMaps.keySet();
		for(String key : keyNames) {
			logger.debug("key : {}, value : {}", key, modelMaps.get(key));
			logger.debug(key);
			logger.debug("{}",modelMaps.containsKey(key));
		
		}
		
		return modelAndView;
	}
	
}
