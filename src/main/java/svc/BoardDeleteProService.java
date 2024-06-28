package svc;

import static util.JdbcUtil.close;
import static util.JdbcUtil.commit;
import static util.JdbcUtil.getConnection;
import static util.JdbcUtil.rollback;
import java.sql.Connection;
import dao.MocaDAO;

public class BoardDeleteProService {

	public boolean isArticleWriter(int nt_no) throws Exception {

		boolean isArticleWriter = false;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		isArticleWriter = mocaDAO.isNoticeBoardWriter(nt_no);
		close(con);
		return isArticleWriter;

	}

	public boolean removeArticle(int nt_no) throws Exception {

		boolean isRemoveSuccess = false;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		int deleteCount = mocaDAO.deleteNotice(nt_no);

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
