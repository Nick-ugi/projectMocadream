package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MocaDAO;
import vo.Mc_rooms;
import static util.JdbcUtil.*;

public class MocaDetailActionService {

    public ArrayList<Mc_rooms> getAllRooms() throws Exception {
        ArrayList<Mc_rooms> roomList = null;
        Connection con = getConnection();
        MocaDAO mocaDAO = MocaDAO.getInstance();
        mocaDAO.setConnection(con);
        roomList = mocaDAO.selectAllRooms(); // 모든 방 정보를 가져오는 메서드 호출
        close(con);
        return roomList;
    }
}