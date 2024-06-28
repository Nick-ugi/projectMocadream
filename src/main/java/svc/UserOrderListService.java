package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MocaDAO;
import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import vo.Mc_order;

public class UserOrderListService {

	public int userOdertListCount(String orderId) throws Exception {

		int listCount = 0;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		listCount = mocaDAO.userOdertListCount(orderId);
		close(con);
		return listCount;
	}

	public ArrayList<Mc_order> getUserOrderList(String orderId, int page, int limit) throws Exception {

		ArrayList<Mc_order> mc_OrderList = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		mc_OrderList = mocaDAO.selectUserOrderList(orderId, page, limit);
		close(con);
		return mc_OrderList;

	}
}
