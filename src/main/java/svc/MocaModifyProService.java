package svc;

import static util.JdbcUtil.*;

import java.io.File;
import java.sql.Connection;
import vo.Mc_rooms;
import dao.MocaDAO;

public class MocaModifyProService {

	public boolean modifyRoom(Mc_rooms room) throws Exception {
		boolean isModifySuccess = false;
		Connection con = null;
		try {
			con = getConnection();
			MocaDAO mocaDAO = MocaDAO.getInstance();
			mocaDAO.setConnection(con);
			int r_no = room.getR_no();
			String fm = mocaDAO.deleteFile(r_no);
			int updateCount = mocaDAO.updateRoom(room);

			if (updateCount > 0) {
				isModifySuccess = true;
//				File file = new File("C:/Dwork/mocadream/src/main/webapp/roomUpload/" + fm);
				File file = new File("realFolder = \"C:/apache-tomcat-9.0.86/webapps/mocadream/roomUpload/" + fm);				

				if (!(room.getR_file() == null || room.getR_file().equals(""))) {

					if (file.exists()) {
						if (file.delete()) {
							System.out.println("파일삭제 성공");
						} else {
							System.out.println("파일삭제 실패");
						}
					} else {
						System.out.println("파일이 존재하지 않습니다.");
					}
				}
			} else {
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				close(con);
			}
		}

		return isModifySuccess;
	}
}
