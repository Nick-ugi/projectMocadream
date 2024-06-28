package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import java.sql.SQLException;

import dao.MocaDAO;
import vo.Mc_users;

public class MyPageModifyProService {

	public boolean updateMember(Mc_users member) throws Exception {
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		boolean modifySuccess = false;
		int isSuccess = mocaDAO.updateMember(member);
		if (isSuccess > 0) {
			modifySuccess = true;
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return modifySuccess;
	}
}
