package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.*;
import vo.ActionForward;
import vo.Mc_rooms;

public class MocaModifyFormAction implements Action {
	
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
	 	ActionForward forward = new ActionForward();
		int r_no = Integer.parseInt(request.getParameter("r_no"));
		MocaModifyFormService mocaModifyFormService = new MocaModifyFormService();
		Mc_rooms room = mocaModifyFormService.getRoom(r_no);
		
	   	request.setAttribute("page", request.getParameter("page"));
	   	request.setAttribute("room", room);
   		forward.setPath("/admin/moca_modify.jsp");
   		
   		return forward;
	   		
	 }
	 
}