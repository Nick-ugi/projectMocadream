package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberReleaseService;
import vo.ActionForward;

public class MemberReleaseAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		ActionForward forward = null;
		if (id == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("/memberLogin.mc");
		} else if (!id.equals("admin")) {
			response.setContentType("text/html;charset=UTF-8");
			out.println("<script>");
			out.println("alert('관리자가 아닙니다.');");
			out.println("location.href='./memberLogin.mc';");
			out.println("</script>");
		} else {
			String warningId = request.getParameter("id");
			MemberReleaseService memberReleaseService = new MemberReleaseService();
			boolean deleteResult = memberReleaseService.releaseMember(warningId);

			if (deleteResult) {
				out.println("<script>");
				out.println("alert('정지를 해제했습니다.');");
				out.println("location.href='./memberListAction.mc';");
				out.println("</script>");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				out.println("<script>");
				out.println("alert('정지 해제 실패.');");
				out.println("location.href='./memberLogin.mc';");
				out.println("</script>");
			}
		}
		return forward;
	}
}