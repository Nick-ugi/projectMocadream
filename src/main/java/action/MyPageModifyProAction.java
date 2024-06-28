package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MyPageModifyProService;
import vo.ActionForward;
import vo.Mc_users;

public class MyPageModifyProAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean isSuccess = false;

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pw = request.getParameter("pw"); // 수정할 비밀번호 추가
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String myaddr = request.getParameter("myaddr");
		String addr = "";

		// 회원 객체 생성 및 정보 설정
		Mc_users member = new Mc_users();
		member.setId(id);
		member.setPw(pw); // 수정할 비밀번호 설정
		member.setName(name);
		member.setTel(tel);
		member.setEmail(email);
		if (request.getParameter("addNum").equals("")) {
			member.setAddr(myaddr);
		} else {
			addr = request.getParameter("addNum") + " " + request.getParameter("addr1") + " "
					+ request.getParameter("addr2");
			member.setAddr(addr);
		}

		// 회원 정보 수정 서비스 호출하여 회원 정보 업데이트
		MyPageModifyProService memberModifyService = new MyPageModifyProService();
		isSuccess = memberModifyService.updateMember(member);

		ActionForward forward = null;

		if (isSuccess == false) {

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정실패')");
			out.print("history.back()");
			out.print("</script>");
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정성공')");
			out.print("location.href='main.jsp'");
			out.print("</script>");

		}

		return forward;
	}
}
