package svc;

import vo.Mc_users;
import static util.JdbcUtil.*;

import java.sql.Connection;
import java.util.*;

import dao.MocaDAO;

public class MemberIdFindService {

	public List<String> findMember(Mc_users member) {
		List<String> idList = new ArrayList<>();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		Connection con = getConnection();
		mocaDAO.setConnection(con);
		// DAO에서 아이디 검색하여 리스트에 추가
        idList = mocaDAO.findIdMember(member);
		
		
		close(con);
		return idList;
	}

}
