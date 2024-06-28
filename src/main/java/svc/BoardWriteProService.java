package svc;

import java.sql.Connection;
import dao.MocaDAO;
import vo.Mc_notice;
import static util.JdbcUtil.*;

public class BoardWriteProService {

	public boolean registArticle(Mc_notice mc_notice) throws Exception {

		boolean isWriteSuccess = false;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		
		int insertCount = mocaDAO.insertNotice(mc_notice);
		if (insertCount > 0) {
//			commit(con);
			isWriteSuccess = true;
		} else {
//			rollback(con);
		}

		close(con);
		return isWriteSuccess;

	}

}
