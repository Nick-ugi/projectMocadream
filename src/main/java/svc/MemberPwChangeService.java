package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.commit;
import static util.JdbcUtil.getConnection;
import static util.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MocaDAO;
import vo.Mc_users;

public class MemberPwChangeService {
	public boolean changePw(Mc_users member) {
		boolean changeSuccess = false;
		MocaDAO mocaDAO = MocaDAO.getInstance();
		Connection con = getConnection();
		mocaDAO.setConnection(con);
		int changeCount = mocaDAO.changePw(member);
		if (changeCount > 0) {
			changeSuccess = true;
			commit(con);
			System.out.println("정상적으로 changeCount 반환");
		} else {
			rollback(con);
			System.out.println("비정상적으로 changeCount 반환");
		}
		close(con);
		return changeSuccess;
	}
}
