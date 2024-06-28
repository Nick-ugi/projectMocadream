package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import vo.Mc_notice;
import dao.MocaDAO;

public class BoardModifyProService {

	public boolean isArticleWriter(int nt_no) throws Exception {

		boolean isArticleWriter = false;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		isArticleWriter = mocaDAO.isNoticeBoardWriter(nt_no); // true물고옴
		close(con);
		return isArticleWriter;

	}

	public boolean modifyArticle(Mc_notice article) throws Exception {

		boolean isModifySuccess = false;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		int updateCount = mocaDAO.updateNotice(article);

		if (updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}

		close(con);
		return isModifySuccess;

	}

}
