package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.RoomListService;
import vo.ActionForward;
import vo.Mc_rooms;

public class RoomListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		ActionForward forward = null;

		if (id == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 메뉴입니다.');");
			out.println("</script>");

			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.mc");
		} else {
			forward = new ActionForward();
			RoomListService roomListService = new RoomListService();
			ArrayList<Mc_rooms> mc_rooms = roomListService.getRoomsList();
			request.setAttribute("mc_rooms", mc_rooms);
			forward.setRedirect(false);
			forward.setPath("/users/user_OrderForm.jsp");
		}
		return forward;
	}
}