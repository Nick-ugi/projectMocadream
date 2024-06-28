package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberJoinService;
import svc.MemberPwChangeService;
import svc.MemberPwFindService;
import vo.ActionForward;
import vo.Mc_users;

public class MemberPwChangeAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Mc_users member = new Mc_users();
		boolean pwChangeResult = false;

		member.setPw(request.getParameter("newpass"));
		member.setId(request.getParameter("id"));
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));

		MemberPwChangeService memberPwChangeService = new MemberPwChangeService();
		pwChangeResult = memberPwChangeService.changePw(member);

		ActionForward forward = null;
		if (pwChangeResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 변경 실패 .')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 변경 성공');");
			out.println("location.href='main.jsp';");
			out.println("</script>");

			/*
			 * forward = new ActionForward(); forward.setRedirect(true);
			 * forward.setRedirect(true); forward.setPath("./memberLogin.me");
			 */

		}

		return forward;
	}
}