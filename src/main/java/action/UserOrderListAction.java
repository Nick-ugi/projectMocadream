package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.UserOrderListService;
import vo.ActionForward;
import vo.Mc_order;
import vo.PageInfo;

public class UserOrderListAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String orderId = (String) session.getAttribute("id");

		if (orderId.equals("admin")) {
			orderId = (String) request.getAttribute("userId");
		}

		ArrayList<Mc_order> mc_OrderList = new ArrayList<Mc_order>();
		int page = 1;
		int limit = 10;

		if (request.getParameter("page") == null || request.getParameter("page").equals(""))
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));

		UserOrderListService userOrderListService = new UserOrderListService();
		int listCount = userOrderListService.userOdertListCount(orderId);
		mc_OrderList = userOrderListService.getUserOrderList(orderId, page, limit);

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
		request.setAttribute("mc_OrderList", mc_OrderList);

		ActionForward forward = new ActionForward();
		forward.setPath("/users/user_OrderList_All.jsp");
		return forward;

	}
}