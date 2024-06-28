package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardDetailService;
import vo.ActionForward;
import vo.Mc_notice;

public class BoardModifyFormAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		int nt_no = Integer.parseInt(request.getParameter("nt_no"));
		BoardDetailService boardDetailService = new BoardDetailService();
		Mc_notice article = boardDetailService.getArticle(nt_no);
		request.setAttribute("page", request.getParameter("page"));
		request.setAttribute("article", article);
		forward.setPath("/admin/qna_board_modify.jsp?nt_no=" + request.getParameter("nt_no"));
		return forward;

	}

}