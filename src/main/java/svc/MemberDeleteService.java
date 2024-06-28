package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.MocaDAO;
import vo.Mc_users;

public class MemberDeleteService {

	public Mc_users deleteMember(String id) {
		Mc_users myPage = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);

		myPage = mocaDAO.deleteMember(id);
		close(con);
		return myPage;
	}

}
