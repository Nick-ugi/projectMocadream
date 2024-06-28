package svc;

import java.sql.Connection;
import dao.MocaDAO;
import vo.Mc_rooms;
import static util.JdbcUtil.*;

public class MocaModifyFormService {

	public Mc_rooms getRoom(int r_no) throws Exception {

		Mc_rooms room = null;
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		room = mocaDAO.selectRoom(r_no);
		close(con);

		return room;
	}
}
