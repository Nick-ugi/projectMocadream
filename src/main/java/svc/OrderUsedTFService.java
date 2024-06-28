package svc;

import static util.JdbcUtil.*;

import java.sql.Connection;
import dao.MocaDAO;

public class OrderUsedTFService {

	public boolean orderUsedTservice(String r_no, String r_cal, String r_statime) {
		boolean orderUsedResult = false;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		int usedCount = 0;
		usedCount = mocaDAO.orderUsedT(r_no, r_cal, r_statime);

		if (usedCount > 0) {
			commit(con);
			orderUsedResult = true;
		} else {
			rollback(con);
		}
		close(con);

		return orderUsedResult;
	}
	
	public boolean orderUsedFservice(String r_uname, String r_no, String r_cal, String r_statime) {
		boolean orderUsedResult = false;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		int usedCount = 0;
		usedCount = mocaDAO.orderUsedF(r_uname, r_no, r_cal, r_statime);
		
		if (usedCount > 0) {
			commit(con);
			orderUsedResult = true;
		} else {
			rollback(con);
		}
		close(con);
		
		return orderUsedResult;
	}

}
