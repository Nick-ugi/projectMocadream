package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberDeleteService;
import vo.ActionForward;
import vo.Mc_users;

public class MemberDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		System.out.println("세션아이디 : " + id);
		MemberDeleteService selectMypageService = new MemberDeleteService();
		selectMypageService.deleteMember(id);

		ActionForward forward = null;
		session = request.getSession(false);
		session.invalidate();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println("<script>");
		out.println("alert('회원탈퇴가 되었습니다.');");
		out.println("location.href='main.jsp';");
		out.println("</script>");
		
		out.close();
		// HTTP 1.0.
		response.setHeader("Pragma", "no-cache");
		// Proxy : Client와 Server 사이에 위치하여 요청을 중계하는 역할을 하는 서버
		response.setHeader("Expires", "0");
		// HTTP 1.1.
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		return forward;

	}
}