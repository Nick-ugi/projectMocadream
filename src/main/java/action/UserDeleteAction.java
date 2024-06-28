package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserDeleteService;
import vo.ActionForward;

public class UserDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ActionForward forward = null;
		String r_no = request.getParameter("r_no");
		String r_cal = request.getParameter("r_cal");
		String r_statime = request.getParameter("r_statime");
		String deleteId = "urim";
//		String deleteId = "urim"; 세션 로그인 ID값 가져오기
		UserDeleteService userDeleteService = new UserDeleteService();
		boolean deleteResult = userDeleteService.deleteOrderService(deleteId, r_no, r_cal, r_statime);

		if (deleteResult) {
			forward = new ActionForward();
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('취소 완료.');");
			out.println("</script>");
			forward.setRedirect(true);
			forward.setPath("myOrderList.mc");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('취소 실패.');");
			out.println("location.href='./myOrderList.mc';");
			out.println("</script>");
		}
		return forward;
	}

}
