package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import dao.MocaDAO;

public class MocaDeleteProService {

	public boolean removeRoom(int r_no) throws Exception {

		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		int deleteCount = mocaDAO.deleteRoom(r_no);

		if (deleteCount > 0) {
			commit(con);
			isRemoveSuccess = true;
		} else {
			rollback(con);
		}

		close(con);
		return isRemoveSuccess;
	}

}
