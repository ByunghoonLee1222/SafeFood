package com.ssafy.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.service.FoodService;
import com.ssafy.service.FoodServiceImpl;
import com.ssafy.service.MemberService;
import com.ssafy.service.MemberServiceImp;
import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;
import com.ssafy.vo.Member;

@WebServlet({ "/main.do", "/logcheck.do" })
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
	private FoodService foodService = new FoodServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "main.jsp";
		String action = request.getParameter("action");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

//		HttpSession session = request.getSession();
//		session.setAttribute("id", "ssafy");
		System.out.println("action....................." + action);
		try {
			if (action != null) {
				if (action.endsWith("mainform.do")) {
					url = "./main.jsp";
				} else if (action.endsWith("login.do")) {
					System.out.println("login.do");
					url = login(request, response);
				} else if (action.endsWith("logout.do")) {
					url = logout(request, response);
				}  else if (action.endsWith("memberinsert.do")) {
					url = memberinsert(request, response);
				}  else if (action.endsWith("memberinfo.do")) {
					url = memberinfo(request, response);
				} else if (action.endsWith("userinfoForm.do")) {
					url = "./userInformation.jsp";
				} else if (action.endsWith("userDelete.do")) {
					url = userDelete(request, response);
				} else if (action.endsWith("userUpdate.do")) {
					url = userUpdate(request, response);
				} else if (action.endsWith("foodList.do")) {
					url = foodList(request, response);
				} else if (action.endsWith("itemInfor.do")) {
					url = itemInfor(request, response);
				} else if (action.endsWith("list.do")) {
					url = list(request, response);
				} else if (action.endsWith("foodList2.do")) {
					url = foodList2(request, response);
				}
			}else {
				url =start(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			url = "ErrorHandler.jsp";
		}

		if (url.startsWith("{") || url.startsWith("[")) {
			// url이 { or [로 시작하면 JSON 데이터 이므로 contents type 변경후
			response.setContentType("application/json;charset=utf-8");
			// 직접 출력
			response.getWriter().append(url);
		} else if (url.startsWith("redirect")) {
			response.sendRedirect(url.substring(url.indexOf(":") + 1));
		} else {
			request.getRequestDispatcher(url).forward(request, response);
		}
	}

	private String foodList2(HttpServletRequest request, HttpServletResponse response) {
		String key = request.getParameter("key");
		// 검색어
		String word = request.getParameter("word");
		System.out.println("key: "+key+" word: "+word);
		FoodPageBean bean = new FoodPageBean(key, word, "", 0);
		request.setAttribute("bean", bean);
		List<Food> list = new ArrayList<>();
		list = foodService.searchAll(bean);
		request.setAttribute("foodList", list);
		return "itemList.jsp";
	}

	private String list(HttpServletRequest request, HttpServletResponse response) {
		List<Food> list = new ArrayList<>();
		list = foodService.searchAll(new FoodPageBean());
		request.setAttribute("foodList", list);
		return "itemList.jsp";
	}

	private String itemInfor(HttpServletRequest request, HttpServletResponse response)
			throws NumberFormatException, SQLException {
		System.out.println("itemInfor...................................");
		String code = request.getParameter("code");
		System.out.println(code);

		Food food = foodService.search(Integer.parseInt(code));
		request.setAttribute("item", food);
		System.out.println(food);
		return "itemInformation.jsp";

	}

	private String start(HttpServletRequest request, HttpServletResponse response) {
		List<Food> list = new ArrayList<>();
		list = foodService.searchAll(new FoodPageBean());
		request.setAttribute("foodList", list);
		for (Food food : list) {
			System.out.println(food);
		}
		return "main.jsp";
	}

	private String foodList(HttpServletRequest request, HttpServletResponse response) {
		// 검색 조건 분류(검색조건(all), 상품명, 제조사, 첨가물)
		String key = request.getParameter("key");
		// 검색어
		String word = request.getParameter("word");
		FoodPageBean bean = new FoodPageBean(key, word, "", 0);
		request.setAttribute("bean", bean);
		List<Food> list = new ArrayList<>();
		list = foodService.searchAll(bean);
		request.setAttribute("foodList", list);

		return "main.jsp";
	}
	private String userUpdate(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String allergy = request.getParameter("allergy");
		Member member = new Member(id, pw, name, email, phone, address, allergy);
		try {
			memberService.update(member);
			request.setAttribute("msg", "수정되었습니다!");
		}catch (Exception e) {
			request.setAttribute("msg", e.getMessage());
		}
		return "main.do?action=memberinfo.do";
	}

	private String userDelete(HttpServletRequest request, HttpServletResponse response) {
		String id = getId(request);
		memberService.remove(id);
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:main.jsp";
	}

	private String memberinfo(HttpServletRequest request, HttpServletResponse response) {
		String id = getId(request);
		request.setAttribute("member", memberService.search(id));
		return "main.do?action=userinfoForm.do";
	}

	private String memberinsert(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("1");
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String allergy[] = request.getParameterValues("allergy");
		String allergys = "";
		for (int i = 0; i < allergy.length; ++i) {
			allergys += allergy[i] + ",";
		}
		Member member = new Member(id, pw, name, email, phone, address, allergys);
		memberService.add(member);
		return "redirect:main.jsp";
	}


	private String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:main.jsp";
	}

	private String login(HttpServletRequest request, HttpServletResponse response) {
		// 1. 요청 데이터 추출
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String idsave = request.getParameter("idsave");

		// 2.2 인증 처리
		try {
			memberService.login(id, pw);
			addToSession(request, "id", id);// 인증정보를 session에 저장

			return "redirect:logout.jsp";

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.getMessage());
			return "main.jsp";
		}
	}

	private void addToSession(HttpServletRequest request, String key, Object value) {
		HttpSession session = request.getSession();
		session.setAttribute(key, value);
	}

	public String getId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		return (String) session.getAttribute("id");
	}
}
