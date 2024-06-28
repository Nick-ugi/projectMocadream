package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.SelectMypageService;
import vo.ActionForward;
import vo.Mc_users;

public class SelectMypageAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		SelectMypageService selectMypageService = new SelectMypageService();
		Mc_users myPage = selectMypageService.getMypage(id);

		ActionForward forward = new ActionForward();
		request.setAttribute("myPage", myPage);
		forward.setPath("/users/user_Modify.jsp");

		return forward;

	}

}