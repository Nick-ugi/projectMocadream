package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.MemberJoinService;
import vo.ActionForward;
import vo.Mc_users;

public class MemberJoinAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Mc_users member = new Mc_users();
		boolean joinResult = false;

		member.setId(request.getParameter("id"));
		member.setPw(request.getParameter("pw"));
		member.setName(request.getParameter("name"));
		member.setTel(request.getParameter("tel"));
		member.setEmail(request.getParameter("email"));
		member.setAddr(request.getParameter("addNum") + " " + request.getParameter("addr1") + " " + request.getParameter("addr2"));

		MemberJoinService memberJoinService = new MemberJoinService();
		joinResult = memberJoinService.joinMember(member);

		ActionForward forward = null;
		if (joinResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원등록실패 아이디 중복체크를 해주세요.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원등록성공');");
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