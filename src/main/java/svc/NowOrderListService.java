package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.MocaDAO;
import vo.*;

public class NowOrderListService {

	public int getNowListCount() throws Exception{
		
		int listCount = 0;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		listCount = mocaDAO.selectNowOrderCount();
		close(con);
		
		return listCount;
	}

	public ArrayList<Mc_order> getNowOrderList(int page, int limit) throws Exception{ //page-1, limit-10
		
		ArrayList<Mc_order> nowOrderList = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		nowOrderList = mocaDAO.selectNowOrderList(page, limit);
		close(con);
		
		return nowOrderList;
	}
}
