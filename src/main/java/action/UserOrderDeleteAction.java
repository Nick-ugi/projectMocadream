package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserDeleteService;
import vo.ActionForward;

public class UserOrderDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ActionForward forward = null;

		String deleteId = (String) session.getAttribute("id");
		String r_no = request.getParameter("r_no");
		String r_cal = request.getParameter("r_cal");
		String r_statime = request.getParameter("r_statime");
		String r_used = request.getParameter("r_used");
		String r_uname = request.getParameter("r_uname");
		
		if (deleteId.equals("admin")) {
			if (r_used.equals("취소")) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('이미 취소된 예약입니다.');");
				out.println("history.back()");
				out.println("</script>");
			} else {
				UserDeleteService userDeleteService = new UserDeleteService();
				boolean deleteResult = userDeleteService.deleteOrderService(r_uname, r_no, r_cal, r_statime);
				if (deleteResult) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('취소가 완료되었습니다.');");
					out.println("history.back()");
					out.println("</script>");
				} else {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('취소에 실패하였습니다.');");
					out.println("history.back()");
					out.println("</script>");
				}
			}
		} else {
			if (r_used.equals("취소")) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('이미 취소된 예약입니다.');");
				out.println("history.back()");
				out.println("</script>");
			} else {
				UserDeleteService userDeleteService = new UserDeleteService();
				boolean deleteResult = userDeleteService.deleteOrderService(deleteId, r_no, r_cal, r_statime);
				if (deleteResult) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('취소가 완료되었습니다.');");
					out.println("history.back()");
					out.println("</script>");
				} else {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('취소에 실패하였습니다.');");
					out.println("history.back()");
					out.println("</script>");
				}
			}
		}

		return forward;
	}

}
