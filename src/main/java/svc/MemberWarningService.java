package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import dao.MocaDAO;

public class MemberWarningService {

	public boolean warningMember(String Id) {
		boolean warningResult = false;
		Connection con = getConnection();
		MocaDAO memberDAO = MocaDAO.getInstance();
		memberDAO.setConnection(con);
		int warningCount = memberDAO.warning(Id);

		if (warningCount > 0) {
			commit(con);
			warningResult = true;
		} else {
			rollback(con);
		}
		close(con);
		return warningResult;
	}

}
