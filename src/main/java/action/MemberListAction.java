package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.MemberListService;
import vo.ActionForward;
import vo.Mc_users;
import vo.PageInfo;

public class MemberListAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String search = request.getParameter("search");
		ActionForward forward = null;

		if (id == null) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./memberLogin.mc");
		} else if (!id.equals("admin")) {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아닙니다.');");
			out.println("location.href='./memberLogin.mc");
			out.println("</script>");
		} else {

			ArrayList<Mc_users> memberList = new ArrayList<Mc_users>();
			int page = 1;
			int limit = 10;

			if (request.getParameter("page") == null || request.getParameter("page").equals(""))
				page = 1;
			else
				page = Integer.parseInt(request.getParameter("page"));

			MemberListService memberListService = new MemberListService();

			int listCount;

			if (search == null)
				search = "";

			if (search.equals("")) {
				listCount = memberListService.getListCount();
				memberList = memberListService.getMemberList(page, limit);
			} else {
				listCount = memberListService.getListCount(search);
				memberList = memberListService.getMemberList(page, limit, search);

			}

			int maxPage = (int) ((double) listCount / limit + 0.95);

			int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

			int endPage = startPage + 10 - 1;

			if (endPage > maxPage)
				endPage = maxPage;

			PageInfo pageInfo = new PageInfo();
			pageInfo.setEndPage(endPage);
			pageInfo.setListCount(listCount);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setStartPage(startPage);

			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("memberList", memberList);
			request.setAttribute("search", search);

			forward = new ActionForward();
			forward.setPath("/admin/member_list.jsp");

		}

		return forward;
	}
}