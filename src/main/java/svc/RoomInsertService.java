package svc;

import dao.MocaDAO;
import vo.Mc_rooms;
import static util.JdbcUtil.*;
import java.sql.Connection;

public class RoomInsertService {
	
	public boolean registRoom(Mc_rooms mc_rooms) throws Exception{
		boolean isInsertSuccess = false;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		int insertCount = mocaDAO.insertRoom(mc_rooms);
		
		if (insertCount > 0) {
//			commit(con);
			isInsertSuccess = true;
		} else {
//			rollback(con);
		}
		
		close(con);
		return isInsertSuccess;
		
	}
}
