package svc;

import vo.Mc_users;
import static util.JdbcUtil.*;

import java.io.PrintWriter;
import java.sql.Connection;
import dao.MocaDAO;

public class MemberJoinService {

	public boolean joinMember(Mc_users member) {
		boolean joinSuccess = false;
		MocaDAO mocaDAO = MocaDAO.getInstance();
		Connection con = getConnection();
		mocaDAO.setConnection(con);
		int insertCount = mocaDAO.insertMember(member);
		if (insertCount > 0) {
			joinSuccess = true;
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return joinSuccess;
	}

}
