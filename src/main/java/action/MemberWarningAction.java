package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.MemberWarningService;
import vo.ActionForward;

public class MemberWarningAction implements Action {
	
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
			MemberWarningService memberWarningService = new MemberWarningService();
			boolean deleteResult = memberWarningService.warningMember(warningId);

			if (deleteResult) {
				out.println("<script>");
				out.println("alert('해당 회원을 경고처리 하였습니다.\\n(경고 3회 누적시, 자동으로 정지처리 됩니다.)');");
				out.println("location.href='./memberListAction.mc';");
				out.println("</script>");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				out.println("<script>");
				out.println("alert('경고 처리 실패.');");
				out.println("location.href='./memberLogin.mc';");
				out.println("</script>");
			}
		}
		return forward;
	}
}