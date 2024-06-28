package action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.RoomListService;
import svc.UserOrderService;
import vo.ActionForward;
import vo.Mc_order;
import vo.Mc_rooms;

public class UserOrderAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Mc_order mc_order = new Mc_order();
		boolean joinResult = false;
		int time = 0;
		int usetime = 0;

		RoomListService roomListService = new RoomListService();
		ArrayList<Mc_rooms> mc_rooms = roomListService.getRoomsList();
		request.setAttribute("mc_rooms", mc_rooms); 
		// selectRoomsList메소드 실행
		// mc_rooms는 "SELECT * FROM MC_ROOMS ORDER BY R_NO" 로 모든 방정보 가져옴
		String[] roomname = new String[mc_rooms.size()];

		for (int i = 0; i < mc_rooms.size(); i++) {
			roomname[i] = mc_rooms.get(i).getR_name();
		}

		for (int i = 0; i < roomname.length; i++) {
			if (request.getParameter("r_name").equals(roomname[i])) {
				mc_order.setR_no(i + 1);
			}
		}

		String r_cal = request.getParameter("r_cal");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(r_cal);

		mc_order.setR_name(request.getParameter("r_name"));
		mc_order.setR_uname(request.getParameter("r_uname"));
		mc_order.setR_cal(date);
		if (request.getParameter("r_time").equals("1시간 이용")) {
			mc_order.setR_time(1);
			time = 1;
		} else if (request.getParameter("r_time").equals("2시간 이용")) {
			mc_order.setR_time(2);
			time = 2;
		} else if (request.getParameter("r_time").equals("3시간 이용")) {
			mc_order.setR_time(3);
			time = 3;
		}
		switch (request.getParameter("r_statime")) {
		case "09:00":
			mc_order.setR_statime(9);
			usetime = 9;
			break;
		case "10:00":
			mc_order.setR_statime(10);
			usetime = 10;
			break;
		case "11:00":
			mc_order.setR_statime(11);
			usetime = 11;
			break;
		case "12:00":
			mc_order.setR_statime(12);
			usetime = 12;
			break;
		case "13:00":
			mc_order.setR_statime(13);
			usetime = 13;
			break;
		case "14:00":
			mc_order.setR_statime(14);
			usetime = 14;
			break;
		case "15:00":
			mc_order.setR_statime(15);
			usetime = 15;
			break;
		case "16:00":
			mc_order.setR_statime(16);
			usetime = 16;
			break;
		case "17:00":
			mc_order.setR_statime(17);
			usetime = 17;
			break;
		case "18:00":
			mc_order.setR_statime(18);
			usetime = 18;
			break;
		case "19:00":
			mc_order.setR_statime(19);
			usetime = 19;
			break;
		case "20:00":
			mc_order.setR_statime(20);
			usetime = 20;
			break;
		default :
			
		}
		mc_order.setR_endtime(usetime + time);
		
		UserOrderService userOrderService = new UserOrderService();
		joinResult = userOrderService.userOrder(mc_order);

		ActionForward forward = null;
		if (joinResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('예약실패')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			request.setAttribute("mc_order", mc_order);
			forward = new ActionForward();
//			forward.setRedirect(false);
			forward.setPath("userOrder_list.mc");
		}
		return forward;
	}

}