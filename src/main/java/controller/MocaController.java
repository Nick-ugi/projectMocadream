package controller;

import java.io.*;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.*;
import vo.ActionForward;

@WebServlet("*.mc")
public class MocaController extends javax.servlet.http.HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
//		String command = RequestURI.substring(contextPath.length());
		String command = RequestURI.substring(RequestURI.lastIndexOf("/"));
		
		
		ActionForward forward = null;
		Action action = null;

		if (command.equals("/memberLogin.mc")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./loginForm.jsp");

		} else if (command.equals("/memberJoin.mc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./joinForm.jsp");

		} else if (command.equals("/idFindForm.mc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./idFindForm.jsp");

		} else if (command.equals("/idFindResult.mc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./idFindResult.jsp");

		} else if (command.equals("/pwFindForm.mc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./pwFindForm.jsp");

		} else if (command.equals("/pwFindResult.mc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./pwFindResult.jsp");

		} else if (command.equals("/pwFindResult.mc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./pwFindResult.jsp");

		} else if (command.equals("/memberPwChangeAction.mc")) {
			action = new MemberPwChangeAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberJoinAction.mc")) {
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberFindIdAction.mc")) {
			action = new MemberIdFindAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/memberPwFindAction.mc")) {
			action = new MemberPwFindAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/myPageModifyProAction.mc")) {
			action = new MyPageModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberDeleteAction.mc")) {
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/loginMypage.mc")) {
			action = new SelectMypageAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/mocaList.mc")) {
			action = new MocaListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/addroom.mc")) {
			forward = new ActionForward();
			forward.setPath("/admin/moca_insert.jsp");

		} else if (command.equals("/insertRoom.mc")) {
			action = new RoomInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/nowcheck.mc")) {
			action = new NowCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberListAction.mc")) {
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberWarningAction.mc")) {
			action = new MemberWarningAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberReleaseAction.mc")) {
			action = new MemberReleaseAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/mocaModifyForm.mc")) {
			action = new MocaModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/mocaModifyPro.mc")) {
			action = new MocaModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/mocaDeleteForm.mc")) {
			String nowPage = request.getParameter("page");
			request.setAttribute("page", nowPage);
			int r_no = Integer.parseInt(request.getParameter("r_no"));
			request.setAttribute("r_no", r_no);
			forward = new ActionForward();
			forward.setPath("/admin/moca_delete.jsp");

		} else if (command.equals("/mocaDeletePro.mc")) {
			action = new MocaDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardList.mc")) {
			action = new BoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardWriteForm.mc")) {
			forward = new ActionForward();
			forward.setPath("/admin/qna_board_write.jsp");

		} else if (command.equals("/boardWritePro.mc")) {
			action = new BoardWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardDetail.mc")) {
			action = new BoardDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardModifyForm.mc")) {
			action = new BoardModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardModifyPro.mc")) {
			action = new BoardModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/boardDeleteForm.mc")) {
			String nowPage = request.getParameter("page");
			request.setAttribute("page", nowPage);
			int nt_no = Integer.parseInt(request.getParameter("nt_no"));
			request.setAttribute("nt_no", nt_no);
			forward = new ActionForward();
			forward.setPath("/admin/qna_board_delete.jsp");
		} else if (command.equals("/boardDeletePro.mc")) {
			action = new BoardDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/roomListAction.mc")) {
			try {
				action = new RoomListAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				e.getMessage();
			}
		} else if (command.equals("/userOrderAction.mc")) {
			action = new UserOrderAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/userOrder_list.mc")) {
			forward = new ActionForward();
			forward.setPath("/users/user_Order_list.jsp");

		} else if (command.equals("/myOrderList.mc")) {
			String userId = request.getParameter("id");
			request.setAttribute("userId", userId);

			action = new UserOrderListAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/orderDelete.mc")) {
			action = new UserOrderDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/selectYesTime.mc")) {
			action = new SelectYesTimeAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/dayOrderList.mc")) {
			action = new AdminOrderListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/deleteForm.mc")) {
			try {
				forward = new ActionForward();
				forward.setPath("/users/deleteForm.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/mocaDetail.mc")) {
			action = new MocaDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/OrderUsedT.mc")) {
			action = new OrderUsedTFAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/OrderUsedF.mc")) {
			action = new OrderUsedTFAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/admin_Main.mc")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./admin/admin_Main.jsp");
		}

		if (forward != null) {

			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}

		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}