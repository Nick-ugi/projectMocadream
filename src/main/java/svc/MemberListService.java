package svc;

import java.sql.Connection;
import java.util.ArrayList;
import dao.MocaDAO;
import static util.JdbcUtil.*;
import vo.Mc_users;

public class MemberListService {

	public int getListCount() throws Exception {

		int listCount = 0;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		listCount = mocaDAO.selectMemberListCount();
		close(con);
		return listCount;
	}
	
	public int getListCount(String search) throws Exception {

		int listCount = 0;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		listCount = mocaDAO.selectMemberListCount(search);
		close(con);
		return listCount;
	}

	public ArrayList<Mc_users> getMemberList(int page, int limit) throws Exception {

		ArrayList<Mc_users> memberList = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		memberList = mocaDAO.selectMemberList(page, limit);
		close(con);
		return memberList;
	}

	public ArrayList<Mc_users> getMemberList(int page, int limit, String search) throws Exception {

		ArrayList<Mc_users> memberList = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		memberList = mocaDAO.selectMemberList(page, limit, search);
		close(con);
		return memberList;
	}
}