package dao;

import static util.JdbcUtil.*;
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import vo.*;

public class MocaDAO {
	public static MocaDAO instance;
	Connection con;
	Statement st;
	PreparedStatement ps;
	ResultSet rs;
	DataSource ds;

	private MocaDAO() {

	}

	public static MocaDAO getInstance() {
		if (instance == null) {
			instance = new MocaDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	// 기본메뉴 방정보 메소드
	public ArrayList<Mc_rooms> selectAllRooms() {
		ArrayList<Mc_rooms> roomList = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT * FROM MC_ROOMS ORDER BY R_NO");
			rs = ps.executeQuery();

			while (rs.next()) {
				Mc_rooms room = new Mc_rooms();
				room.setR_no(rs.getInt("R_NO"));
				room.setR_name(rs.getString("R_NAME"));
				room.setR_max(rs.getInt("R_MAX"));
				room.setR_desc(rs.getString("R_DESC"));
				room.setR_file(rs.getString("R_FILE"));

				roomList.add(room);
			}
		} catch (Exception ex) {
			System.out.println("selectAllRooms 에러: " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return roomList;
	}


	// 관리자 예약내역 조회1 (페이징) 메소드
	public int orderListCount(String rcal) {
		int dayOrderCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT COUNT(*) FROM MC_ORDER WHERE R_CAL = ? ORDER BY R_STATIME");
			ps.setString(1, rcal);
			rs = ps.executeQuery();

			if (rs.next()) {
				dayOrderCount = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("getorderListCount 에러: " + e);
		} finally {
			close(rs);
			close(ps);
		}

		return dayOrderCount;

	}

	// 관리자 방관리1(페이징) 메소드
	public int selectRoomListCount() {
		int listCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT COUNT(*) FROM MC_ROOMS");
			rs = ps.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getListCount 에러: " + e);
		} finally {
			close(rs);
			close(ps);
		}

		return listCount;
	}

	
	// 관리자 방관리2 메소드
	public ArrayList<Mc_rooms> selectRoomList(int page, int limit) {
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    String sql = "SELECT R_NO, R_NAME, R_MAX, R_DESC, R_FILE " +
	                 "FROM MC_ROOMS " +
	                 "ORDER BY R_NO DESC " +
	                 "LIMIT ?, ?";
	    
	    ArrayList<Mc_rooms> roomList = new ArrayList<>();
	    int offset = (page - 1) * limit; // 시작 오프셋 계산

	    try {
	        ps = con.prepareStatement(sql);
	        ps.setInt(1, offset);
	        ps.setInt(2, limit);
	        rs = ps.executeQuery();

	        while (rs.next()) {
	            Mc_rooms mc_rooms = new Mc_rooms();
	            mc_rooms.setR_no(rs.getInt("R_NO"));
	            mc_rooms.setR_name(rs.getString("R_NAME"));
	            mc_rooms.setR_max(rs.getInt("R_MAX"));
	            mc_rooms.setR_desc(rs.getString("R_DESC"));
	            mc_rooms.setR_file(rs.getString("R_FILE"));
	            roomList.add(mc_rooms);
	        }

	    } catch (Exception e) {
	        System.out.println("selectRoomList 에러 : " + e);
	    } finally {
	        close(rs);
	        close(ps);
	    }

	    return roomList;
	}

	// 관리자 방수정1(수정할 방검색) 메소드
	public Mc_rooms selectRoom(int r_no) {
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    Mc_rooms mc_rooms = null;

	    try {
	        String sql = "SELECT R_NO, R_NAME, R_MAX, R_DESC, R_FILE " +
	                     "FROM MC_ROOMS " +
	                     "WHERE R_NO = ?";
	        ps = con.prepareStatement(sql);
	        ps.setInt(1, r_no);
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            mc_rooms = new Mc_rooms();
	            mc_rooms.setR_no(rs.getInt("R_NO"));
	            mc_rooms.setR_name(rs.getString("R_NAME"));
	            mc_rooms.setR_max(rs.getInt("R_MAX"));
	            mc_rooms.setR_desc(rs.getString("R_DESC"));
	            mc_rooms.setR_file(rs.getString("R_FILE"));
	        }
	    } catch (Exception e) {
	        System.out.println("selectRoom 에러 : " + e);
	    } finally {
	        close(rs);
	        close(ps);
	    }

	    return mc_rooms;
	}

	// 관리자 방수정2(수정할 방검색 후) 메소드
	public int updateRoom(Mc_rooms room) {
		int updateCount = 0;
		PreparedStatement ps = null;
		String sql;

		try {
			if (!(room.getR_file() == null || room.getR_file().equals(""))) {
				sql = "UPDATE MC_ROOMS SET R_NAME=?,R_DESC=?, R_MAX=?, R_FILE=? WHERE R_NO=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, room.getR_name());
				ps.setString(2, room.getR_desc());
				ps.setInt(3, room.getR_max());
				ps.setString(4, room.getR_file());
				ps.setInt(5, room.getR_no());
			} else {
				sql = "UPDATE MC_ROOMS SET R_NAME=?,R_DESC=?, R_MAX=? WHERE R_NO=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, room.getR_name());
				ps.setString(2, room.getR_desc());
				ps.setInt(3, room.getR_max());
				ps.setInt(4, room.getR_no());
			}

			updateCount = ps.executeUpdate();

			if (updateCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (Exception ex) {
			System.out.println("MocaModify 에러 : " + ex);
		} finally {
			close(ps);
		}

		return updateCount;
	}

	// 관리자 방수정3(기존 사진 파일 제거) 메소드
	public String deleteFile(int r_no) {

		String fm = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT R_FILE FROM MC_ROOMS WHERE R_NO = ?");
			ps.setInt(1, r_no);
			rs = ps.executeQuery();

			if (rs.next())
				fm = rs.getString("R_FILE");

		} catch (Exception e) {
			System.out.println("파일 삭제 에러 : " + e);
		} finally {
			close(rs);
			close(ps);
		}

		return fm;
	}

	// 관리자 방추가 메소드
	public int insertRoom(Mc_rooms room) {
	    int num = 0;
	    String sql = "";
	    int insertCount = 0;

	    try {
	        // 방 번호 생성
	        ps = con.prepareStatement("SELECT MAX(R_NO) FROM MC_ROOMS");
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            num = rs.getInt(1) + 1;
	        } else {
	            num = 1;
	        }

	        // 방 정보 INSERT 쿼리
	        sql = "INSERT INTO MC_ROOMS (R_NO, R_NAME, R_MAX, R_DESC, R_FILE) VALUES (?, ?, ?, ?, ?)";
	        ps = con.prepareStatement(sql);
	        ps.setInt(1, num);
	        ps.setString(2, room.getR_name());
	        ps.setInt(3, room.getR_max());
	        ps.setString(4, room.getR_desc());
	        ps.setString(5, room.getR_file());

	        // INSERT 실행
	        insertCount = ps.executeUpdate();

	        // 트랜잭션 처리
	        if (insertCount > 0) {
	            commit(con);
	        } else {
	            rollback(con);
	        }

	    } catch (SQLException e) {
	        System.out.println("insertRoom 에러 : " + e);
	    } finally {
	        close(rs);
	        close(ps);
	    }

	    return insertCount;
	}

	// 관리자 방삭제 메소드
	public int deleteRoom(int r_no) {

		PreparedStatement ps = null;
		String sql = "DELETE FROM MC_ROOMS WHERE R_NO = ?";
		int deleteCount = 0;

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, r_no);
			deleteCount = ps.executeUpdate();

			if (deleteCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (Exception e) {
			System.out.println("MocaDelete 에러 : " + e);
		} finally {
			close(ps);
		}

		return deleteCount;

	}

}
