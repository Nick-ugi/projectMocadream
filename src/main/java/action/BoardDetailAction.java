package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardDetailService;
import vo.ActionForward;
import vo.Mc_notice;

public class BoardDetailAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		int nt_no = Integer.parseInt(request.getParameter("nt_no"));
		String page = request.getParameter("page");
		BoardDetailService boardDetailService = new BoardDetailService();
		Mc_notice article = boardDetailService.getArticle(nt_no);
		Mc_notice article2 = boardDetailService.getArticle1(nt_no);
		Mc_notice article3 = boardDetailService.getArticle2(nt_no);

		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);
		request.setAttribute("article", article);
		request.setAttribute("article2", article2);
		request.setAttribute("article3", article3);
		
		if (!(session.getAttribute("id") == null)) {
			if (session.getAttribute("id").equals("admin")) {
				forward.setPath("/admin/qna_board_view.jsp");
			} else {
				forward.setPath("/board/qna_board_view.jsp");
			}
		} else {
			forward.setPath("/board/qna_board_view.jsp");
		}
		return forward;

	}

}