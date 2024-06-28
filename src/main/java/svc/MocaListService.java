package svc;

import static util.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;
import dao.MocaDAO;
import vo.Mc_rooms;

public class MocaListService {

	public int getListCount() throws Exception {

		int listCount = 0;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		listCount = mocaDAO.selectRoomListCount();
		close(con);
		return listCount;
	}

	public ArrayList<Mc_rooms> getRoomList(int page, int limit) throws Exception {

		ArrayList<Mc_rooms> roomList = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		roomList = mocaDAO.selectRoomList(page, limit);
		close(con);
		return roomList;

	}

}
