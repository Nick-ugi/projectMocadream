package svc;

import static util.JdbcUtil.*;

import java.sql.Connection;

import dao.MocaDAO;
import vo.Mc_users;

public class SelectMypageService {

	public Mc_users getMypage(String id) throws Exception{
		
		Mc_users myPage = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		
		myPage = mocaDAO.selectMypage(id);
		close(con);
		return myPage;
		
	}

}
