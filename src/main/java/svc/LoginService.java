package svc;

import static util.JdbcUtil.*;

import java.sql.Connection;

import dao.MocaDAO;
import vo.Mc_users;

public class LoginService {

	public Mc_users getLoginMember(String id, String pw) {
		MocaDAO loginDAO = MocaDAO.getInstance();
		Connection con = getConnection();
		loginDAO.setConnection(con);
		Mc_users loginMember = loginDAO.loginMember(id, pw);
		close(con);
		return loginMember;
	}
}
