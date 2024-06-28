package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import dao.MocaDAO;

public class MemberReleaseService {

	public boolean releaseMember(String Id) {
		boolean releaseResult = false;
		Connection con = getConnection();
		MocaDAO memberDAO = MocaDAO.getInstance();
		memberDAO.setConnection(con);
		int releaseCount = memberDAO.release(Id);
		if (releaseCount > 0) {
			commit(con);
			releaseResult = true;
		} else {
			rollback(con);
		}
		close(con);
		return releaseResult;
	}

}
