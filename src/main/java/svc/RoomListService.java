package svc;

import vo.Mc_rooms;

import static util.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import dao.MocaDAO;

public class RoomListService {

	public ArrayList<Mc_rooms> getRoomsList() {
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		ArrayList<Mc_rooms> mc_rooms = mocaDAO.selectRoomsList();
		close(con);
		return mc_rooms;
	}

}
