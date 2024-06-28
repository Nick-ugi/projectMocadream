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

		if (command.equals("/mocaList.mc")) {
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
		} else if (command.equals("/roomListAction.mc")) {
			try {
				action = new RoomListAction();
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				e.getMessage();
			}
		} else if (command.equals("/mocaDetail.mc")) {
			action = new MocaDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
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