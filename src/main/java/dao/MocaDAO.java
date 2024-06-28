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

	// 회원가입 메소드
	public int insertMember(Mc_users member) {
		String sql = "INSERT INTO MC_USERS (ID, PW, NAME, TEL, EMAIL, ADDR) VALUES (?, ?, ?, ?, ?, ?)";
		int insertCount = 0;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPw());
			ps.setString(3, member.getName());
			ps.setString(4, member.getTel());
			ps.setString(5, member.getEmail());
			ps.setString(6, member.getAddr());
			insertCount = ps.executeUpdate();
			if (insertCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} catch (SQLException ex) {
			System.out.println("joinMember 에러: " + ex);
		} finally {
			close(ps);
		}

		return insertCount;
	}

	// 회원가입 아이디 중복체크
	public boolean idCheck(Mc_users mv) {
		if (mv.getId() == null || mv.getId().length() == 0) {
			System.out.println("아이디가 없습니다.");
		}
		boolean idchk = false;
		String sql = "SELECT COUNT(*) AS RESULT FROM MC_USERS WHERE ID = ?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mv.getId());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int result = rs.getInt(1);
				if (result > 0)
					idchk = true;
			}
			return idchk;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return idchk;
	}

	// 회원 아이디 찾기
	public List<String> findIdMember(Mc_users member) {
		List<String> idList = new ArrayList<>();
		String sql = "SELECT ID FROM MC_USERS WHERE NAME = ? AND EMAIL = ?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getEmail());
			rs = ps.executeQuery();
			while (rs.next()) {
				idList.add(rs.getString("ID"));
			}
		} catch (SQLException ex) {
			System.out.println("findMember 에러: " + ex);
		} finally {
			close(ps);
		}

		return idList;
	}

	// 회원 비밀번호 찾기
	public Mc_users findPwMember(Mc_users member) {
		String sql = "SELECT PW FROM MC_USERS WHERE ID = ? AND NAME = ? AND EMAIL = ?";
		Mc_users user_pw = null; // 객체 생성
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getName());
			ps.setString(3, member.getEmail());
			rs = ps.executeQuery();
			if (rs.next()) {
				user_pw = new Mc_users();
				user_pw.setPw(rs.getString("pw")); // 비밀번호 설정
			}
		} catch (SQLException ex) {
			System.out.println("findMember 에러: " + ex);
		} finally {
			close(ps);
		}

		return user_pw; // 비밀번호를 포함한 객체 반환
	}

	// 회원 비밀번호 변경
	public int changePw(Mc_users member) {
		int changeCount = 0;
		PreparedStatement ps = null;
		String sql = "UPDATE MC_USERS SET PW = ? WHERE ID = ? AND NAME = ? AND EMAIL = ?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getPw());
			ps.setString(2, member.getId());
			ps.setString(3, member.getName());
			ps.setString(4, member.getEmail());
			changeCount = ps.executeUpdate();
			if (changeCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return changeCount;
	}

	// 로그인 메소드
	public Mc_users loginMember(String id, String pw) {
		Mc_users loginMember = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT * FROM MC_USERS WHERE ID = ? AND PW = ? AND STATE = 1");
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();

			if (rs.next()) {
				loginMember = new Mc_users();

				loginMember.setId(rs.getString("ID"));
				loginMember.setPw(rs.getString("PW"));
				loginMember.setName(rs.getString("NAME"));
				loginMember.setTel(rs.getString("TEL"));
				loginMember.setEmail(rs.getString("EMAIL"));
				loginMember.setAddr(rs.getString("ADDR"));
				loginMember.setWar(rs.getInt("WAR"));
				loginMember.setState(rs.getInt("STATE"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(rs);
				close(ps);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return loginMember;
	}

	// 회원 내정보 메소드
	public Mc_users selectMypage(String id) {
		Mc_users myPage = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT * FROM MC_USERS WHERE ID = ?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				myPage = new Mc_users();

				myPage.setId(rs.getString("ID"));
				myPage.setPw(rs.getString("PW"));
				myPage.setName(rs.getString("NAME"));
				myPage.setTel(rs.getString("TEL"));
				myPage.setEmail(rs.getString("EMAIL"));
				myPage.setAddr(rs.getString("ADDR"));
				myPage.setWar(rs.getInt("WAR"));
				myPage.setState(rs.getInt("STATE"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(rs);
				close(ps);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return myPage;
	}

	// 회원 내정보 수정 메소드
	public int updateMember(Mc_users member) {
		PreparedStatement ps = null;
		int count = 0;
		String sql = "UPDATE MC_USERS SET PW=?, NAME = ?, TEL = ?, EMAIL = ?, ADDR = ? WHERE ID = ?";

		try {
			ps = con.prepareStatement(sql);

			ps.setString(1, member.getPw());
			ps.setString(2, member.getName());
			ps.setString(3, member.getTel());
			ps.setString(4, member.getEmail());
			ps.setString(5, member.getAddr());
			ps.setString(6, member.getId());
			count = ps.executeUpdate();

			if (count > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(ps);
		}

		return count;
	}

	// 회원 탈퇴 메소드
	public Mc_users deleteMember(String id) {
		String sql = "UPDATE MC_USERS SET STATE = 0 WHERE ID = ?";
		Mc_users mb = null;
		try {
			mb = new Mc_users();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
				System.out.println("회원 삭제 완료");
				commit(con);
			} else {
				System.out.println("회원 삭제 실패");
				rollback(con);
			}

		} catch (SQLException ex) {
			System.out.println("deleteMember 에러: ");
			ex.printStackTrace();
		} finally {
			close(ps);
		}

		return mb;
	}

	// 회원 예약하기1(방리스트 불러오는) 메소드
	public ArrayList<Mc_rooms> selectRoomsList() {
		String sql = "SELECT * FROM MC_ROOMS ORDER BY R_NO";
		ArrayList<Mc_rooms> mc_rooms = new ArrayList<Mc_rooms>();
		Mc_rooms mr = null;

		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				mr = new Mc_rooms();
				mr.setR_no(rs.getInt("R_NO"));
				mr.setR_name(rs.getString("R_NAME"));
				mr.setR_max(rs.getInt("R_MAX"));
				mr.setR_desc(rs.getString("R_DESC"));
				mr.setR_file(rs.getString("R_FILE"));
				mc_rooms.add(mr);
			}

		} catch (Exception ex) {
			System.out.println("selectRoomsList 에러: " + ex);
		} finally {
			close(rs);
			close(ps);
		}
		return mc_rooms;
	}

	// 회원 예약하기2 (예약가능시간 검색) 메소드
	public ArrayList<Integer> selectYesTime(String rname, Date rcal) {
		String sql = "SELECT R_TIME, R_STATIME, R_ENDTIME - 1 FROM MC_ORDER WHERE R_NAME = ? AND R_CAL = ? AND R_USED != '취소'";
		ArrayList<Integer> noTimeList = new ArrayList<Integer>();
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, rname);

			java.util.Date utilDate = rcal;
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

			ps.setDate(2, sqlDate);
			rs = ps.executeQuery();

			while (rs.next()) {
				if (rs.getInt(1) == 1) {
					noTimeList.add(rs.getInt(2));
				} else if (rs.getInt(1) == 2) {
					noTimeList.add(rs.getInt(2));
					noTimeList.add(rs.getInt(3));
				} else {
					noTimeList.add(rs.getInt(2));
					noTimeList.add(rs.getInt(3) - 1);
					noTimeList.add(rs.getInt(3));
				}
			}

		} catch (Exception e) {
			System.out.println("selectYesTime 에러: " + e);
		} finally {
			close(rs);
			close(ps);
		}
		return noTimeList;
	}

	// 회원 예약하기3 메소드
	public int insertOrder(Mc_order order) {
		String sql = "INSERT INTO MC_ORDER VALUES ( ?, ?, ?, ?, ?, ?, ?, '입실전')";
		int insertCount = 0;

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, order.getR_no());
			ps.setString(2, order.getR_name());
			ps.setString(3, order.getR_uname());

			java.util.Date utilDate = order.getR_cal();
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			ps.setDate(4, sqlDate);

			ps.setInt(5, order.getR_time());
			ps.setInt(6, order.getR_statime());
			ps.setInt(7, order.getR_endtime());

			insertCount = ps.executeUpdate();

			if (insertCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (Exception ex) {
			System.out.println("insertOrder 에러: " + ex);
		} finally {
			close(ps);
		}

		return insertCount;
	}

	// 회원 예약내역 조회1(있는지 확인) 메소드
	public int userOdertListCount(String orderId) {

		int listCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT COUNT(*) FROM MC_ORDER WHERE R_UNAME = ? ORDER BY R_CAL DESC");
			ps.setString(1, orderId);
			rs = ps.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("userOdertListCount 에러: " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return listCount;
	}

	// 회원 예약내역 조회2 메소드
	public ArrayList<Mc_order> selectUserOrderList(String orderId, int page, int limit) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		Mc_order mcorder = null;
//		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_ORDER WHERE R_UNAME = ? ORDER BY R_CAL DESC ) A ) WHERE RNUM BETWEEN ? AND ?";
		String sql = "SELECT * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY R_CAL DESC) AS RNUM " + "FROM MC_ORDER WHERE R_UNAME = ?) AS A " + "WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Mc_order> userOrderList = new ArrayList<Mc_order>();
		int startrow = (page - 1) * 10 + 1;
		int endrow = (page - 1) * 10 + 10;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, orderId);
			ps.setInt(2, startrow);
			ps.setInt(3, endrow);
			rs = ps.executeQuery();

			while (rs.next()) {
				mcorder = new Mc_order();
				mcorder.setR_no(rs.getInt("R_NO"));
				mcorder.setR_name(rs.getString("R_NAME"));
				mcorder.setR_uname(rs.getString("R_UNAME"));
				mcorder.setR_cal(rs.getDate("R_CAL"));
				mcorder.setR_time(rs.getInt("R_TIME"));
				mcorder.setR_statime(rs.getInt("R_STATIME"));
				mcorder.setR_endtime(rs.getInt("R_ENDTIME"));
				mcorder.setR_used(rs.getString("R_USED"));
				userOrderList.add(mcorder);
			}

		} catch (Exception ex) {
			System.out.println("selectUserOrderList 에러 : " + ex);
		} finally {
			close(rs);
			close(ps);
		}
		return userOrderList;
	}

	// 회원 예약취소 메소드
	public int deleteOrder(String deleteId, String r_no, String r_cal, String r_statime) {
		PreparedStatement ps = null;
		String sql = "UPDATE MC_ORDER SET R_USED = '취소' WHERE R_UNAME = ? AND R_NO = ? AND TO_CHAR(R_CAL , 'YYYY-MM-DD') = ? AND R_STATIME = ?";
		int deleteCount = 0;

		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, deleteId);
			ps.setString(2, r_no);
			ps.setString(3, r_cal);
			ps.setString(4, r_statime);

			deleteCount = ps.executeUpdate();

			if (deleteCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (Exception ex) {
			System.out.println("deleteUserOrderList 에러 : " + ex);
		} finally {
			close(ps);
		}

		return deleteCount;

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

	// 관리자 회원정보리스트 (페이징) 메소드
	public int selectMemberListCount() {

		int listCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT COUNT(*) FROM MC_USERS");
			rs = ps.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount 에러: " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return listCount;
	}

	// 관리자 회원정보리스트 검색기능 (페이징) 메소드
	public int selectMemberListCount(String search) {

		int listCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		// if문으로 search가 검색과 탈퇴일 때 결과 가져오기
		if (search.equals("정지")) {

			String sql = "SELECT COUNT(*) FROM MC_USERS WHERE STATE = 2";

			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();

				if (rs.next()) {
					listCount = rs.getInt(1);
				}
			} catch (Exception ex) {
				System.out.println("getListCount 에러: " + ex);
			} finally {
				close(rs);
				close(ps);
			}

		} else if (search.equals("탈퇴")) {

			String sql = "SELECT COUNT(*) FROM MC_USERS WHERE STATE = 0";

			try {
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();

				if (rs.next()) {
					listCount = rs.getInt(1);
				}
			} catch (Exception ex) {
				System.out.println("getListCount 에러: " + ex);
			} finally {
				close(rs);
				close(ps);
			}

		} else {

			try {
				String sql = "SELECT COUNT(*) FROM MC_USERS WHERE UPPER(ID) LIKE UPPER(?) OR UPPER(NAME) LIKE UPPER(?) OR UPPER(TEL) LIKE UPPER(?) OR UPPER(ADDR) LIKE UPPER(?)";
				ps = con.prepareStatement(sql);
				ps.setString(1, "%" + search + "%");
				ps.setString(2, "%" + search + "%");
				ps.setString(3, "%" + search + "%");
				ps.setString(4, "%" + search + "%");
				rs = ps.executeQuery();

				if (rs.next()) {
					listCount = rs.getInt(1);
				}
			} catch (Exception ex) {
				System.out.println("getListCount 에러: " + ex);
			} finally {
				close(rs);
				close(ps);
			}

		}

		return listCount;
	}

	// 관리자 회원정보리스트 메소드
	public ArrayList<Mc_users> selectMemberList(int page, int limit) {

		PreparedStatement ps = null;
		ResultSet rs = null;
//		String sql = "SELECT * FROM " + "(SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_USERS ORDER BY ID DESC ) A ) " + "WHERE RNUM BETWEEN ? AND ?";
		String sql = "SELECT * FROM ( " +
		        "    SELECT *, ROW_NUMBER() OVER (ORDER BY ID DESC) AS RNUM " +
		        "    FROM MC_USERS " +
		        ") AS A " +
		        "WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Mc_users> memberList = new ArrayList<Mc_users>();
		int startrow = (page - 1) * 10 + 1;
		int endrow = (page - 1) * 10 + 10;

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, startrow);
			ps.setInt(2, endrow);
			rs = ps.executeQuery();

			while (rs.next()) {
				Mc_users mc_users = new Mc_users();
				mc_users.setId(rs.getString("ID"));
				mc_users.setPw(rs.getString("PW"));
				mc_users.setName(rs.getString("NAME"));
				mc_users.setTel(rs.getString("TEL"));
				mc_users.setEmail(rs.getString("EMAIL"));
				mc_users.setAddr(rs.getString("ADDR"));
				mc_users.setWar(rs.getInt("WAR"));
				mc_users.setState(rs.getInt("STATE"));
				memberList.add(mc_users);
			}

		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
		} finally {
			close(rs);
			close(ps);
		}
		return memberList;
	}

	// 관리자 회원정보리스트 검색기능 메소드
	public ArrayList<Mc_users> selectMemberList(int page, int limit, String search) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<Mc_users> memberList = new ArrayList<Mc_users>();
		int startrow = (page - 1) * 10 + 1; // 읽기 시작할 row 번호..
		int endrow = (page - 1) * 10 + 10;
		String sql = null;

		if (search.equals("정지")) {
//			sql = "SELECT * FROM " + "(SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_USERS WHERE STATE = 2 ORDER BY ID DESC ) A ) " + "WHERE RNUM BETWEEN ? AND ?";
			sql = "SELECT * FROM ( " +
		             "    SELECT *, ROW_NUMBER() OVER (ORDER BY ID DESC) AS RNUM " +
		             "    FROM MC_USERS " +
		             ") AS A " +
		             "WHERE RNUM BETWEEN ? AND ?";
			try {
				ps = con.prepareStatement(sql);
				ps.setInt(1, startrow);
				ps.setInt(2, endrow);
				rs = ps.executeQuery();

				while (rs.next()) {
					Mc_users mc_users = new Mc_users();
					mc_users.setId(rs.getString("ID"));
					mc_users.setPw(rs.getString("PW"));
					mc_users.setName(rs.getString("NAME"));
					mc_users.setTel(rs.getString("TEL"));
					mc_users.setEmail(rs.getString("EMAIL"));
					mc_users.setAddr(rs.getString("ADDR"));
					mc_users.setWar(rs.getInt("WAR"));
					mc_users.setState(rs.getInt("STATE"));
					memberList.add(mc_users);
				}

			} catch (Exception ex) {
				System.out.println("getBoardList 에러 : " + ex);
			} finally {
				close(rs);
				close(ps);
			}

		} else if (search.equals("탈퇴")) {
//			sql = "SELECT * FROM " + "(SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_USERS WHERE STATE = 0 ORDER BY ID DESC ) A ) " + "WHERE RNUM BETWEEN ? AND ?";
			sql = "SELECT * FROM ( " +
		             "    SELECT *, ROW_NUMBER() OVER (ORDER BY ID DESC) AS RNUM " +
		             "    FROM MC_USERS " +
		             "    WHERE STATE = 0 " +
		             ") AS A " +
		             "WHERE RNUM BETWEEN ? AND ?";
			try {
				ps = con.prepareStatement(sql);
				ps.setInt(1, startrow);
				ps.setInt(2, endrow);
				rs = ps.executeQuery();

				while (rs.next()) {
					Mc_users mc_users = new Mc_users();
					mc_users.setId(rs.getString("ID"));
					mc_users.setPw(rs.getString("PW"));
					mc_users.setName(rs.getString("NAME"));
					mc_users.setTel(rs.getString("TEL"));
					mc_users.setEmail(rs.getString("EMAIL"));
					mc_users.setAddr(rs.getString("ADDR"));
					mc_users.setWar(rs.getInt("WAR"));
					mc_users.setState(rs.getInt("STATE"));
					memberList.add(mc_users);
				}

			} catch (Exception ex) {
				System.out.println("getBoardList 에러 : " + ex);
			} finally {
				close(rs);
				close(ps);
			}

		} else {

//			sql = "SELECT * FROM " + "(SELECT ROWNUM RNUM, A.* FROM " + "( SELECT * FROM MC_USERS WHERE UPPER(ID) LIKE UPPER(?) OR UPPER(NAME) LIKE UPPER(?) OR UPPER(TEL) LIKE UPPER(?) OR UPPER(ADDR) LIKE UPPER(?) ORDER BY ID DESC ) A ) " + "WHERE RNUM BETWEEN ? AND ?";
			sql = "SELECT * FROM ( " +
		             "    SELECT *, ROW_NUMBER() OVER (ORDER BY ID DESC) AS RNUM " +
		             "    FROM MC_USERS " +
		             "    WHERE UPPER(ID) LIKE UPPER(?) " +
		             "       OR UPPER(NAME) LIKE UPPER(?) " +
		             "       OR UPPER(TEL) LIKE UPPER(?) " +
		             "       OR UPPER(ADDR) LIKE UPPER(?) " +
		             ") AS A " +
		             "WHERE RNUM BETWEEN ? AND ?";
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, "%" + search + "%");
				ps.setString(2, "%" + search + "%");
				ps.setString(3, "%" + search + "%");
				ps.setString(4, "%" + search + "%");
				ps.setInt(5, startrow);
				ps.setInt(6, endrow);
				rs = ps.executeQuery();

				while (rs.next()) {
					Mc_users mc_users = new Mc_users();
					mc_users.setId(rs.getString("ID"));
					mc_users.setPw(rs.getString("PW"));
					mc_users.setName(rs.getString("NAME"));
					mc_users.setTel(rs.getString("TEL"));
					mc_users.setEmail(rs.getString("EMAIL"));
					mc_users.setAddr(rs.getString("ADDR"));
					mc_users.setWar(rs.getInt("WAR"));
					mc_users.setState(rs.getInt("STATE"));
					memberList.add(mc_users);
				}

			} catch (Exception ex) {
				System.out.println("getBoardList 에러 : " + ex);
			} finally {
				close(rs);
				close(ps);
			}
		}
		return memberList;
	}

	// 관리자 회원제재 메소드
	public int warning(String id) {
		String sql = "UPDATE MC_USERS SET WAR = WAR + 1 WHERE ID=?";
		int cnt = 0;
		try {

			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			cnt = ps.executeUpdate();

			if (cnt > 0) {
				System.out.println(cnt + "행이 처리되었습니다.");
				commit(con);
			} else {
				System.out.println("처리되지 않았습니다.");
				rollback(con);
			}

			sql = "SELECT WAR FROM MC_USERS WHERE ID = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			Mc_users mb = null;
			while (rs.next()) {
				mb = new Mc_users();
				mb.setWar(rs.getInt("WAR"));
			}

			if (mb.getWar() == 3) {
				sql = "UPDATE MC_USERS SET WAR = 0, STATE = 2 WHERE ID = ?";
				ps = con.prepareStatement(sql);
				ps.setString(1, id);
				cnt = ps.executeUpdate();

				if (cnt > 0) {
					System.out.println(cnt + "행이 처리되었습니다.");
					commit(con);
				} else {
					System.out.println("처리되지 않았습니다.");
					rollback(con);
				}
			}

		} catch (SQLException e) {
			System.out.println("sql문 실행 도중 에러가 발생했습니다.");
			e.getMessage();
		} finally {
			try {
				if (ps != null)
					close(ps);
				if (st != null)
					close(st);
			} catch (Exception e) {
				System.out.println("객체를 닫는 도중 에러가 발생했습니다.");
				e.getMessage();
			}
		}
		return cnt;
	}

	// 관리자 회원석방 메소드
	public int release(String id) {
		String sql = "UPDATE MC_USERS SET WAR=0, STATE=1 WHERE ID=?";
		int cnt = 0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			cnt = ps.executeUpdate();

			if (cnt > 0) {
				System.out.println(cnt + "행이 처리되었습니다.");
				commit(con);
			} else {
				System.out.println("처리되지 않았습니다.");
				rollback(con);
			}

		} catch (SQLException e) {
			System.out.println("sql문 실행 도중 에러가 발생했습니다.");
			e.getMessage();
		} finally {
			try {
				if (ps != null)
					close(ps);
				if (st != null)
					close(st);
			} catch (Exception e) {
				System.out.println("객체를 닫는 도중 에러가 발생했습니다.");
				e.getMessage();
			}
		}
		return cnt;
	}

	// 관리자 실시간예약조회1 메소드
	public int selectNowOrderCount() {
	    int nowListCount = 0;
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    try {
	        ps = con.prepareStatement("SELECT COUNT(*) FROM MC_ORDER WHERE R_CAL > NOW()");
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            nowListCount = rs.getInt(1);
	        }

	    } catch (Exception e) {
	        System.out.println("getNowOrderCount 에러: " + e);
	    } finally {
	        close(rs);
	        close(ps);
	    }

	    return nowListCount;
	}

	// 관리자 실시간예약조회2 메소드
	public ArrayList<Mc_order> selectNowOrderList(int page, int limit) {

		PreparedStatement ps = null;
		ResultSet rs = null;
//		String sql = "SELECT * FROM " + "(SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_ORDER WHERE R_CAL > SYSDATE ORDER BY R_CAL) A) " + "WHERE RNUM BETWEEN ? AND ?";
		String sql = "SELECT * FROM ( " +
	             "    SELECT *, ROW_NUMBER() OVER (ORDER BY R_CAL) AS RNUM " +
	             "    FROM MC_ORDER " +
	             "    WHERE R_CAL > NOW() " +
	             "    ORDER BY R_CAL " +
	             ") AS A " +
	             "WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Mc_order> nowOrderList = new ArrayList<Mc_order>();
		int startrow = (page - 1) * 10 + 1;
		int endrow = (page - 1) * 10 + 10;

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, startrow);
			ps.setInt(2, endrow);
			rs = ps.executeQuery();

			while (rs.next()) {
				Mc_order nowOrder = new Mc_order();
				nowOrder.setR_no(rs.getInt("R_NO"));
				nowOrder.setR_name(rs.getString("R_NAME"));
				nowOrder.setR_uname(rs.getString("R_UNAME"));
				nowOrder.setR_cal(rs.getDate("R_CAL"));
				nowOrder.setR_time(rs.getInt("R_TIME"));
				nowOrder.setR_statime(rs.getInt("R_STATIME"));
				nowOrder.setR_endtime(rs.getInt("R_ENDTIME"));
				nowOrder.setR_used(rs.getString("R_USED"));
				nowOrderList.add(nowOrder);
			}

		} catch (Exception e) {
			System.out.println("getorderList 에러 : " + e);
		} finally {
			close(rs);
			close(ps);
		}

		return nowOrderList;
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

	// 관리자 예약내역 조회2 메소드
	public ArrayList<Mc_order> dayOrderList(String rcal, int page, int limit) {

		PreparedStatement ps = null;
		ResultSet rs = null;
//		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_ORDER WHERE R_CAL = ? ORDER BY R_STATIME) A) WHERE RNUM BETWEEN ? AND ?";
		String sql = "SELECT * FROM ( " +
	             "    SELECT *, ROW_NUMBER() OVER (ORDER BY R_STATIME) AS RNUM " +
	             "    FROM MC_ORDER " +
	             "    WHERE R_CAL = ? " +
	             ") AS A " +
	             "WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Mc_order> dayOrderList = new ArrayList<Mc_order>();
		int startrow = (page - 1) * 10 + 1;
		int endrow = (page - 1) * 10 + 10;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, rcal);
			ps.setInt(2, startrow);
			ps.setInt(3, endrow);
			rs = ps.executeQuery();

			while (rs.next()) {
				Mc_order dayOrder = new Mc_order();
				dayOrder.setR_no(rs.getInt("R_NO"));
				dayOrder.setR_name(rs.getString("R_NAME"));
				dayOrder.setR_uname(rs.getString("R_UNAME"));
				dayOrder.setR_cal(rs.getDate("R_CAL"));
				dayOrder.setR_time(rs.getInt("R_TIME"));
				dayOrder.setR_statime(rs.getInt("R_STATIME"));
				dayOrder.setR_endtime(rs.getInt("R_ENDTIME"));
				dayOrder.setR_used(rs.getString("R_USED"));
				dayOrderList.add(dayOrder);
			}

		} catch (Exception e) {
			System.out.println("getdayOrderList 에러 : " + e);
		} finally {
			close(rs);
			close(ps);
		}

		return dayOrderList;
	}

	// 관리자 예약내역 조회 입실 처리 메소드
	public int orderUsedT(String r_no, String r_cal, String r_statime) {
		int usedCount = 0;
		String sql = "SELECT * FROM MC_ORDER WHERE R_CAL = ? AND R_NO = ? AND R_STATIME = ? AND R_USED != '취소'";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, r_cal);
			ps.setString(2, r_no);
			ps.setString(3, r_statime);
			rs = ps.executeQuery();

			if (rs.next()) {
				close(ps);
				sql = "UPDATE MC_ORDER SET R_USED = '입실' WHERE R_CAL = ? AND R_NO = ? AND R_STATIME = ? AND R_USED != '취소'";
				ps = con.prepareStatement(sql);
				ps.setString(1, r_cal);
				ps.setString(2, r_no);
				ps.setString(3, r_statime);
				usedCount = ps.executeUpdate();

				if (usedCount > 0) {
					commit(con);
				} else {
					rollback(con);
				}
			}

		} catch (Exception e) {
			System.out.println("getorderUsedT 에러 : " + e);
		} finally {
			close(rs);
			close(ps);
		}

		return usedCount;
	}

	// 관리자 예약내역 조회 미사용 처리 메소드
	public int orderUsedF(String r_uname, String r_no, String r_cal, String r_statime) {
		int usedCount = 0;
		String sql = "SELECT * FROM MC_ORDER WHERE R_CAL = ? AND R_NO = ? AND R_STATIME = ? AND R_USED = '취소'";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, r_cal);
			ps.setString(2, r_no);
			ps.setString(3, r_statime);
			rs = ps.executeQuery();

			if (rs.next()) {
				close(ps);
				sql = "UPDATE MC_ORDER SET R_USED = '미사용' WHERE R_CAL = ? AND R_NO = ? AND R_STATIME = ? AND R_USED != '취소'";
				ps = con.prepareStatement(sql);
				ps.setString(1, r_cal);
				ps.setString(2, r_no);
				ps.setString(3, r_statime);
				usedCount = ps.executeUpdate();

				if (usedCount > 0) {
					warning(r_uname);
					commit(con);
				} else {
					rollback(con);
				}
			}

		} catch (Exception e) {
			System.out.println("getorderUsedT 에러 : " + e);
		} finally {
			close(rs);
			close(ps);
		}

		return usedCount;
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

	// 관리자 공지목록1(페이징) 메소드
	public int selectNoticeListCount() {

		int listCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT COUNT(*) FROM MC_NOTICE");
			rs = ps.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount 에러: " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return listCount;
	}

	// 관리자 공지목록2 메소드
	public ArrayList<Mc_notice> selectNoticeList(int page, int limit) {

		PreparedStatement ps = null;
		ResultSet rs = null;
//		String sql = "SELECT * FROM " + "(SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_NOTICE ORDER BY NT_NO DESC ) A ) " + "WHERE RNUM BETWEEN ? AND ?";
		String sql = "SELECT * FROM ( " +
	             "    SELECT *, ROW_NUMBER() OVER (ORDER BY NT_NO DESC) AS RNUM " +
	             "    FROM MC_NOTICE " +
	             ") AS A " +
	             "WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Mc_notice> articleList = new ArrayList<Mc_notice>();
		int startrow = (page - 1) * 10 + 1; // 읽기 시작할 row 번호..
		int endrow = (page - 1) * 10 + 10;

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, startrow);
			ps.setInt(2, endrow);
			rs = ps.executeQuery();

			while (rs.next()) {
				Mc_notice mc_notice = new Mc_notice();
				mc_notice.setNt_no(rs.getInt("NT_NO"));
				mc_notice.setNt_title(rs.getString("NT_TITLE"));
				mc_notice.setNt_content(rs.getString("NT_CONTENT"));
				mc_notice.setNt_writer(rs.getString("NT_WRITER"));
				mc_notice.setNt_date(rs.getDate("NT_DATE"));
				articleList.add(mc_notice);
			}

		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return articleList;
	}

	// 관리자 검색 공지 목록1 (페이징) 메소드
	public int selectNoticeListCount(String search) {

		int listCount = 0;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("SELECT COUNT(*) FROM MC_NOTICE WHERE NT_TITLE LIKE ?");
			ps.setString(1, "%" + search + "%");
			rs = ps.executeQuery();

			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount 에러: " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return listCount;
	}

	// 관리자 검색 공지 목록2 메소드
	public ArrayList<Mc_notice> selectNoticeList(int page, int limit, String search) {

		PreparedStatement ps = null;
		ResultSet rs = null;
//		String sql = "SELECT * FROM (SELECT ROWNUM RNUM, A.* FROM (SELECT * FROM MC_NOTICE WHERE NT_TITLE LIKE ? ORDER BY NT_NO DESC) A ) WHERE RNUM BETWEEN ? AND ?";
		String sql = "SELECT * FROM ( " +
	             "    SELECT *, ROW_NUMBER() OVER (ORDER BY NT_NO DESC) AS RNUM " +
	             "    FROM MC_NOTICE " +
	             "    WHERE NT_TITLE LIKE ? " +
	             ") AS A " +
	             "WHERE RNUM BETWEEN ? AND ?";
		ArrayList<Mc_notice> articleList = new ArrayList<Mc_notice>();
		int startrow = (page - 1) * 10 + 1;
		int endrow = (page - 1) * 10 + 10;

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + search + "%");
			ps.setInt(2, startrow);
			ps.setInt(3, endrow);
			rs = ps.executeQuery();

			while (rs.next()) {
				Mc_notice mc_notice = new Mc_notice();
				mc_notice.setNt_no(rs.getInt("NT_NO"));
				mc_notice.setNt_title(rs.getString("NT_TITLE"));
				mc_notice.setNt_content(rs.getString("NT_CONTENT"));
				mc_notice.setNt_writer(rs.getString("NT_WRITER"));
				mc_notice.setNt_date(rs.getDate("NT_DATE"));
				articleList.add(mc_notice);
			}

		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return articleList;

	}

	// 관리자 공지 추가 메소드
	public int insertNotice(Mc_notice mc_notice) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		int num = 0;
		String sql = "";
		int insertCount = 0;

		try {
			ps = con.prepareStatement("SELECT MAX(NT_NO) FROM MC_NOTICE");
			rs = ps.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;
			close(ps);

	        sql = "INSERT INTO MC_NOTICE (NT_NO, NT_TITLE, NT_CONTENT, NT_WRITER, NT_DATE) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP)";


			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, mc_notice.getNt_title());
			ps.setString(3, mc_notice.getNt_content());
			ps.setString(4, mc_notice.getNt_writer());
			insertCount = ps.executeUpdate();

			if (insertCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (Exception ex) {
			System.out.println("boardInsert 에러 : " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return insertCount;
	}
	// 관리자 공지 수정 메소드
	public int updateNotice(Mc_notice mc_notice) {

		int updateCount = 0;
		PreparedStatement ps = null;
		String sql = "UPDATE MC_NOTICE SET NT_TITLE = ?, NT_CONTENT = ? WHERE NT_NO = ?";

		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mc_notice.getNt_title());
			ps.setString(2, mc_notice.getNt_content());
			ps.setInt(3, mc_notice.getNt_no());
			updateCount = ps.executeUpdate();

			if (updateCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (Exception ex) {
			System.out.println("boardModify 에러 : " + ex);
		} finally {
			close(ps);
		}

		return updateCount;

	}


	// 관리자 공지 내용보기 메소드
	public Mc_notice selectNotice(int nt_no) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		Mc_notice mc_notice = null;

		try {
			ps = con.prepareStatement("SELECT * FROM MC_NOTICE WHERE NT_NO = ?");
			ps.setInt(1, nt_no);
			rs = ps.executeQuery();

			if (rs.next()) {
				mc_notice = new Mc_notice();
				mc_notice.setNt_no(rs.getInt("NT_NO"));
				mc_notice.setNt_title(rs.getString("NT_TITLE"));
				mc_notice.setNt_content(rs.getString("NT_CONTENT"));
				mc_notice.setNt_writer(rs.getString("NT_WRITER"));
				mc_notice.setNt_date(rs.getDate("NT_DATE"));
			}
		} catch (Exception ex) {
			System.out.println("getDetail 에러 : " + ex);
		} finally {
			close(rs);
			close(ps);
		}

		return mc_notice;

	}

	// 관리자 공지 내용보기 이전글 버튼 메소드
	public Mc_notice selectprevNotice(int nt_no) {
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    Mc_notice mc_notice = null;

	    try {
	        String sql = "SELECT NT_NO, NT_TITLE, NT_CONTENT, NT_WRITER, NT_DATE " +
	                     "FROM MC_NOTICE " +
	                     "WHERE NT_NO < ? " +
	                     "ORDER BY NT_NO DESC " +
	                     "LIMIT 1";
	        ps = con.prepareStatement(sql);
	        ps.setInt(1, nt_no);
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            mc_notice = new Mc_notice();
	            mc_notice.setNt_no(rs.getInt("NT_NO"));
	            mc_notice.setNt_title(rs.getString("NT_TITLE"));
	            mc_notice.setNt_content(rs.getString("NT_CONTENT"));
	            mc_notice.setNt_writer(rs.getString("NT_WRITER"));
	            mc_notice.setNt_date(rs.getDate("NT_DATE"));
	        }
	    } catch (Exception ex) {
	        System.out.println("selectprevNotice 에러 : " + ex);
	    } finally {
	        close(rs);
	        close(ps);
	    }

	    return mc_notice;
	}

	// 관리자 공지 내용보기 다음글 버튼 메소드
	public Mc_notice selectnextNotice(int nt_no) {
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    Mc_notice mc_notice = null;

	    try {
	        String sql = "SELECT NT_NO, NT_TITLE, NT_CONTENT, NT_WRITER, NT_DATE " +
	                     "FROM MC_NOTICE " +
	                     "WHERE NT_NO > ? " +
	                     "ORDER BY NT_NO ASC " +
	                     "LIMIT 1";
	        ps = con.prepareStatement(sql);
	        ps.setInt(1, nt_no);
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            mc_notice = new Mc_notice();
	            mc_notice.setNt_no(rs.getInt("NT_NO"));
	            mc_notice.setNt_title(rs.getString("NT_TITLE"));
	            mc_notice.setNt_content(rs.getString("NT_CONTENT"));
	            mc_notice.setNt_writer(rs.getString("NT_WRITER"));
	            mc_notice.setNt_date(rs.getDate("NT_DATE"));
	        }
	    } catch (Exception ex) {
	        System.out.println("selectnextNotice 에러 : " + ex);
	    } finally {
	        close(rs);
	        close(ps);
	    }

	    return mc_notice;
	}

	// 관리자 공지 수정,삭제 전 관리자인지 메소드
	public boolean isNoticeBoardWriter(int nt_no) {

		PreparedStatement ps = null;
		ResultSet rs = null;
		String board_sql = "SELECT * FROM MC_NOTICE WHERE NT_NO = ?";
		boolean isWriter = false;

		try {
			ps = con.prepareStatement(board_sql);
			ps.setInt(1, nt_no);
			rs = ps.executeQuery();
			rs.next();

			if (nt_no == (rs.getInt("NT_NO"))) {
				isWriter = true;
			}

		} catch (SQLException ex) {
			System.out.println("isBoardWriter 에러 : " + ex);
		} finally {
			close(ps);
		}

		return isWriter;
	}

	// 관리자 공지 삭제 메소드
	public int deleteNotice(int nt_no) {
		String select_sql = "SELECT MAX(NT_NO) FROM MC_NOTICE";

		String m_delete_sql = "DELETE FROM MC_NOTICE WHERE NT_NO = ?";

		String board_delete_sql = "DELETE FROM MC_NOTICE WHERE NT_NO = ?";

		String update_sql = "UPDATE MC_NOTICE SET NT_NO = NT_NO - 1 WHERE NT_NO > ? AND NT_NO <= (SELECT MAX(NT_NO) FROM MC_NOTICE)";

		int deleteCount = 0;

		try {
			ps = con.prepareStatement(select_sql);
			rs = ps.executeQuery();
			if (rs.next())
				if (nt_no == rs.getInt(1)) {
					try {
						ps = con.prepareStatement(m_delete_sql);
						ps.setInt(1, nt_no);
						deleteCount = ps.executeUpdate();

						if (deleteCount > 0) {
							commit(con);
						} else {
							rollback(con);
						}

					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						close(rs);
						close(ps);
					}

				} else {

					try {
						ps = con.prepareStatement(board_delete_sql);
						ps.setInt(1, nt_no);
						deleteCount = ps.executeUpdate();

						if (deleteCount > 0) {
							commit(con);
						} else {
							rollback(con);
						}

						ps = con.prepareStatement(update_sql);
						ps.setInt(1, nt_no);
						deleteCount = ps.executeUpdate();

						if (deleteCount > 0) {
							commit(con);
						} else {
							rollback(con);
						}

					} catch (Exception ex) {
						System.out.println("boardDelete 에러 : " + ex);
					} finally {
						close(ps);
					}

				}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(ps);
		}
		return deleteCount;
	}

}
