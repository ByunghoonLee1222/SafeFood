package com.ssafy.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Member;
import com.ssafy.model.dto.PageBean;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.MemberService;
import com.ssafy.util.KMP;

@Controller
public class FoodController {
	@Autowired
	private FoodService service;
	@Autowired
	private MemberService m_service;
//	
//	@ExceptionHandler
//	public ModelAndView handler(Exception e) {
//		ModelAndView mav = new ModelAndView("ErrorHandler.jsp");
//		mav.addObject("msg", e.getMessage());
//		return mav;
//	}
//	

	@GetMapping("main.do")
	public String getMain(String key, String word, String pageNo,Model model) {
//		String key = request.getParameter("key");		//조회 조건
//		String word = request.getParameter("word");		//검색할 단어
//		String pageNo = request.getParameter("pageNo");	//현재 페이지 번호
//		
		PageBean bean = new PageBean(key, word, pageNo);
		model.addAttribute("list", service.searchAll(bean));
		model.addAttribute("bean", bean);
		
		return "Main";
	}
	
	@GetMapping("foodlist.do")
	public String getFoodList(String key, String word, String pageNo,Model model) {
		PageBean bean = new PageBean(key, word, pageNo);
		model.addAttribute("bean", bean);
		model.addAttribute("list", service.searchAll(bean));
		
		return "foodlist";
	}
	
	@GetMapping("foodInfo.do")
	public String getFoodInfo(Model model, String name) {
		System.out.println(name);
		Food food =service.search("name", name);
		model.addAttribute("f", food);
		model.addAttribute("aler",service.alerSearch(food.getMaterial()));

		return "detailInfo";
	}
	
	@GetMapping("search.do")
	public String search(String sel1, String keyword, String pageNo,Model model) {
		PageBean bean = new PageBean(sel1, keyword, pageNo);
		model.addAttribute("bean", bean);
		System.out.println(sel1 + "  " + keyword);
		model.addAttribute("list", service.searchAll(bean));
		System.out.println(service.searchAll(bean));
		
		return "foodlist";
	}
	
	@PostMapping("sort.do")
	public String sort(String sort, String type,String key, String word, String pageNo,Model model) {
		
		PageBean bean = new PageBean(key, word, pageNo);
		model.addAttribute("bean", bean);
		List<Food> food = service.searchAll(bean);
		switch (sort) {
		case "no":
			
			break;
		case "name":
			Collections.sort(food, new Comparator<Food>() {
				@Override
				public int compare(Food o1, Food o2) {
					return o1.getName().compareTo(o2.getName());
				}
			});
			break;
		case "kal":
			Collections.sort(food, new Comparator<Food>() {
				@Override
				public int compare(Food o1, Food o2) {
					return o1.getNutr_cont1().compareTo(o2.getNutr_cont1());
				}
			});
			break;
		default:
			break;
		}
		if(type.equals("내림차순")) {
			System.out.println("!!");
			Collections.reverse(food);
		}
		model.addAttribute("list", food);
		return "Main";
	}
	
	@GetMapping("filter.do")
	public String filter(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userID = (String)session.getAttribute("id");
		Member mem = m_service.search(userID);
		System.out.println(mem);
		String material = mem.getMaterial();
		String[] mat = material.split(",");
		List<Food> result = new LinkedList<Food>();
		
		String key = request.getParameter("key");		//조회 조건
		String word = request.getParameter("word");		//검색할 단어
		String pageNo = request.getParameter("pageNo");	//현재 페이지 번호
		
		PageBean bean = new PageBean(key, word, pageNo);
		request.setAttribute("bean", bean);
		List<Food> food = service.searchAll(bean);

		for (int i = 0, size=food.size(); i < size; i++) {
			String input = food.get(i).getMaterial()+ food.get(i).getName();
			if(!KMP.KMPSearch(input,mat)) {
				result.add(food.get(i));
			}
		}
		request.setAttribute("list", result);
		return "Main";
	}
//	@GetMapping("productList.do")
//	public String productList(Model model) {
//		System.out.println("컨트롤 들어옴");
//		model.addAttribute("list", service.searchAll());
//		
//		return "product/ProductList";
//	}
//	@GetMapping("productSearch.do")
//	public String productSearch(String id, Model model) {
//		model.addAttribute("faq", service.select(id));
//		return "product/FAQSearch";
//	}
//	@GetMapping("productDelete.do")
//	public String productList(String id) {
//		service.delete(id);
//		return "redirect:productList.do";
//	}
//	@GetMapping("productUpdateForm.do")
//	public String productUpdateForm(String id, Model model) {
//		model.addAttribute("faq", service.select(id));
//		return "product/faqUpdate";
//	}
//	@PostMapping("productUpdate.do")
//	public String productList(Product product) {
//		service.update(product);
//		return "redirect:productSearch.do?no="+product.getId();
//	}
}
