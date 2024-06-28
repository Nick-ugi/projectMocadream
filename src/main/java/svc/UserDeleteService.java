package svc;

import static util.JdbcUtil.*;

import java.sql.Connection;
import dao.MocaDAO;

public class UserDeleteService {

	public boolean deleteOrderService(String deleteId, String r_no, String r_cal, String r_statime) {
		boolean deleteResult = false;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		int deleteCount = 0;
		deleteCount = mocaDAO.deleteOrder(deleteId, r_no, r_cal, r_statime);

		if (deleteCount > 0) {
			commit(con);
			deleteResult = true;
		} else {
			rollback(con);
		}
		close(con);

		return deleteResult;
	}

}
