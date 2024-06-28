package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.MocaDAO;
import vo.Mc_notice;

public class BoardListService {

	public int getListCount() throws Exception {

		int listCount = 0;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		listCount = mocaDAO.selectNoticeListCount();
		close(con);
		return listCount;

	}

	public int getListCount(String search) throws Exception {

		int listCount = 0;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		listCount = mocaDAO.selectNoticeListCount(search);
		close(con);
		return listCount;

	}

	public ArrayList<Mc_notice> getArticleList(int page, int limit) throws Exception {

		ArrayList<Mc_notice> articleList = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		articleList = mocaDAO.selectNoticeList(page, limit);
		close(con);
		return articleList;

	}

	public ArrayList<Mc_notice> getArticleList(int page, int limit, String search) throws Exception {

		ArrayList<Mc_notice> articleList = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		articleList = mocaDAO.selectNoticeList(page, limit, search);
		close(con);
		return articleList;

	}

}
