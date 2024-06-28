package util;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;



//public class JdbcUtil {
//	private static Connection conn = null;
//	
//	public static Connection getConnection() {
//		try {
//			Context itx = new InitialContext();
//			DataSource ds = (DataSource) itx.lookup("java:comp/env/jdbc/moca");
//			conn = ds.getConnection();
//			conn.setAutoCommit(false);
//		} catch (Exception e) {
//			System.out.println("데이터베이스 연결 오류");
//			System.out.println(e.getMessage());
//		}
//		return conn;
//	}
public class JdbcUtil {
    private static Connection conn = null;

    public static Connection getConnection() {
        try {
            Context ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/moca");
            conn = ds.getConnection();
            conn.setAutoCommit(false);
        } catch (Exception e) {
            System.out.println("데이터베이스 연결 오류");
            System.out.println(e.getMessage());
        }
        return conn;
    }
    
    
	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	public static void close(Statement st) {
		if (st != null) {
			try {
				st.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	public static void commit(Connection conn) {
		if (conn != null) {
			try {
				conn.commit();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	

	public static void rollback(Connection conn) {
		if (conn != null) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
}
