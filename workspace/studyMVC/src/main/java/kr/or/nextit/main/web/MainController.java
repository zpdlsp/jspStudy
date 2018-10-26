package kr.or.nextit.main.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.nextit.HomeController;
import kr.or.nextit.com.cmm.service.TestService;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Resource(name="TestService")
	//@Autowired //자동으로 찾아서 연결
	private TestService testService;
	
	@RequestMapping(value = {"/index.do","/","/admin/index.do"})
	public String MainForm(
			@RequestParam HashMap<String, Object> param,
			Model model,
			ModelMap modelMap,
			Locale locale
			) {
		
		logger.debug("param = {}", param);
		logger.debug("Locale = {}", locale.getLanguage());

		model.addAttribute("nugu","나임");
		model.addAttribute("name", "갓길동");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("title", "같이 공부");
		
		try {
			logger.debug("testServiceImpl {}", testService.getTitle("메인 (main)"));
			
			modelMap.addAttribute("testTitle", testService.getTitle("메인 (main)"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "main/mainForm";
	}
	
	@RequestMapping(value = {"/test/index.do"})
	public String TestFrom() {
		return "main/testForm";
	}
	
}