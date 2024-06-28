package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MocaDAO;
import vo.Mc_order;

public class AdminOrderListService {
	public int getorderListCount(String rcal) throws Exception {

		int dayOrderCount = 0;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		dayOrderCount = mocaDAO.orderListCount(rcal);
		close(con);
		return dayOrderCount;
	}

	public ArrayList<Mc_order> getdayOrderList(String rcal, int page, int limit) throws Exception {

		ArrayList<Mc_order> orderList = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		orderList = mocaDAO.dayOrderList(rcal, page, limit);
		close(con);
		return orderList;

	}
}
