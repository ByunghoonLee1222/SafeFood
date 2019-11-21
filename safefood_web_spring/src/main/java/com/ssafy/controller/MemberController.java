package com.ssafy.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
//	
//	@ExceptionHandler
//	public ModelAndView handler(Exception e) {
//		ModelAndView mav = new ModelAndView("ErrorHandler.jsp");
//		mav.addObject("msg", e.getMessage());
//		return mav;
//	}
//	
	@GetMapping("login.do")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println(id+","+pw);
		
		try {
			service.login(id, pw);
			addToSession(request, "id", id);  
			Cookie cookie = new Cookie("id", id);
			cookie.setMaxAge(100000000);
			response.addCookie(cookie);
			System.out.println("login success!!");
			return "redirect:main.do";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			return "forward:main.do";
		}
	}
	
	private void addToSession(HttpServletRequest request, String key, Object value) {
		HttpSession session = request.getSession();
		session.setAttribute(key, value);
	}

	@GetMapping("logout.do")
	public String getFoodList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("session invalidate");
		return "redirect:main.do";
	}
	@PostMapping("memberregit.do")
	public String memberRegit(HttpServletRequest request) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phoneNumber");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String[] alergy = request.getParameterValues("material");
		String material="";
		for (String string : alergy) {
			material+=string+",";
		}
		System.out.println(material);
		Member member = new Member(id, password, name, email, phone, address, material);
		service.add(member);
		return "redirect:main.do";
	}
	
	@GetMapping("memberinfo.do")
	public String memberInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println((String)session.getAttribute("id"));
		session.setAttribute("member", service.search((String)session.getAttribute("id")));
		return "myInfo";
	}
	
	@PostMapping("updateMem.do")
	public String memberUpdate(HttpServletRequest request) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phoneNumber");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String[] alergy = request.getParameterValues("material");
		String material="";
		for (String string : alergy) {
			material+=string+",";
		}
		System.out.println(material);
		Member member = new Member(id, password, name, email, phone, address, material);
		service.update(member);
		return "redirect:memberinfo.do";
	}
	
	@PostMapping("delete.do")
	public String memberDelete(HttpServletRequest request) {
		HttpSession session = request.getSession();
		service.remove((String)session.getAttribute("id"));
		return "redirect:logout.do";
	}
	
	@GetMapping("findPW.do")
	public String findPW(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("id:------------------------"+id);
		try {
			Member member = service.search(id);
			request.setAttribute("id", id);
			request.setAttribute("password", member.getPassword());
			System.out.println("pw:------------------------"+member.getPassword());
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
		}
		return "PWResult";
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
