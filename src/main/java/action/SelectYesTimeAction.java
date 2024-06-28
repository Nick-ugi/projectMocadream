package action;

import static util.JdbcUtil.*;

import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MocaDAO;
import svc.RoomListService;
import vo.ActionForward;
import vo.Mc_rooms;
import vo.Mc_users;

public class SelectYesTimeAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		ActionForward forward = null;
		String rname = request.getParameter("r_name");
		String rcal = request.getParameter("r_cal");
		String runame = request.getParameter("r_uname");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null ; //영미수정 

		ArrayList<Integer> noTimeList = null; //영미수정
		HttpSession session = request.getSession();
		
		if (session.getAttribute("id") == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 메뉴입니다.');");
			out.println("location.href='./memberLogin.mc';");
			out.println("</script>");
			
//			forward = new ActionForward();
//			forward.setRedirect(true);
//			forward.setPath("./memberLogin.mc");
		} 
		else {
			date = formatter.parse(rcal); //영미수정
			noTimeList = mocaDAO.selectYesTime(rname, date); //영미수정
			RoomListService roomListService = new RoomListService();
			ArrayList<Mc_rooms> mc_rooms = roomListService.getRoomsList();
			request.setAttribute("mc_rooms", mc_rooms);
			
			request.setAttribute("noTimeList", noTimeList);
			request.setAttribute("r_name", rname);
			request.setAttribute("r_cal", rcal);
			request.setAttribute("r_uname", runame);
			request.setAttribute("msg", "ok"); //영미수정
			forward = new ActionForward();
			forward.setPath("/users/user_OrderForm.jsp");
		}

		return forward;

	}

}