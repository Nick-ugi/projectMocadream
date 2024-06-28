package action;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.BoardListService;
import vo.ActionForward;
import vo.Mc_notice;
import vo.PageInfo;

public class BoardListAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ArrayList<Mc_notice> articleList = new ArrayList<Mc_notice>();
		int page = 1;
		int limit = 10;
		int listCount = 0;
		String search = request.getParameter("search");
		if (request.getParameter("page") == null || request.getParameter("page").equals(""))
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));

		BoardListService boardListService = new BoardListService();

		if (search == null) {
			listCount = boardListService.getListCount(); // 총 리스트 수를 받아옴.
		} else {
			listCount = boardListService.getListCount(search);
		}

		if (search == null)
			articleList = boardListService.getArticleList(page, limit);
		else
			articleList = boardListService.getArticleList(page, limit, search);
		
		// 총 페이지 수.
		int maxPage = (int) ((double) listCount / limit + 0.95);// 1.35 //0.95를 더해서 올림 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage)
			endPage = maxPage; // 1.35

		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage); // 1.35
		pageInfo.setListCount(listCount); // 4
		pageInfo.setMaxPage(maxPage); // 1.35
		pageInfo.setPage(page); // 1
		pageInfo.setStartPage(startPage); // 1

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList); // 4줄데이타
		request.setAttribute("search", search);

		ActionForward forward = new ActionForward();
		
		if (!(session.getAttribute("id") == null)) {
			if (session.getAttribute("id").equals("admin")) {
				forward.setPath("/admin/qna_board_list.jsp");
			} else {
				forward.setPath("/board/qna_board_list.jsp");
			}
		} else {
			forward.setPath("/board/qna_board_list.jsp");
		}
		return forward;

	}

}