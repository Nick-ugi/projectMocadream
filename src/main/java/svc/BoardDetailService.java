package svc;

import java.sql.Connection;
import dao.MocaDAO;
import vo.Mc_notice;
import static util.JdbcUtil.*;

public class BoardDetailService {

	public Mc_notice getArticle(int nt_no) throws Exception {
		Mc_notice article = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		article = mocaDAO.selectNotice(nt_no);
		close(con);
		return article;

	}
	public Mc_notice getArticle1(int nt_no) throws Exception {
		Mc_notice article = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		article = mocaDAO.selectprevNotice(nt_no);
		close(con);
		return article;
		
	}
	public Mc_notice getArticle2(int nt_no) throws Exception {
		Mc_notice article = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		article = mocaDAO.selectnextNotice(nt_no);
		close(con);
		return article;
		
	}

	

}
