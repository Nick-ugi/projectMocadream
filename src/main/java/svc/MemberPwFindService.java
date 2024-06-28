package svc;

import vo.Mc_users;
import static util.JdbcUtil.*;

import java.sql.Connection;
import java.util.*;

import dao.MocaDAO;

public class MemberPwFindService {

	public Mc_users findMember(Mc_users member) {
		Mc_users pw = null;
		MocaDAO mocaDAO = MocaDAO.getInstance();
		Connection con = getConnection();
		mocaDAO.setConnection(con);
		pw = mocaDAO.findPwMember(member);
		
		close(con);
		return pw;
	}

}
