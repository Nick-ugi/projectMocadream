package action;

import java.io.*;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import svc.RoomInsertService;
import vo.ActionForward;
import vo.Mc_rooms;

public class RoomInsertAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		Mc_rooms mc_rooms = null;
		String realFolder = "";
		String saveFolder = "/roomUpload";
//		realFolder = "C:/Dwork/mocadream/src/main/webapp" + saveFolder;
		realFolder = "C:/apache-tomcat-9.0.86/webapps/mocadream" + saveFolder;
		
		int fileSize = 5 * 1024 * 1024;
		File f = new File(realFolder);
		
	        if (!f.exists()) {
            f.mkdirs();
        }
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy()); 
		mc_rooms = new Mc_rooms();
		
		mc_rooms.setR_name(multi.getParameter("R_NAME"));
		mc_rooms.setR_max(Integer.parseInt(multi.getParameter("R_MAX")));
		mc_rooms.setR_desc(multi.getParameter("R_DESC"));
		mc_rooms.setR_file(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));
		
		RoomInsertService roomInsertService = new RoomInsertService();
		boolean isInsertSuccess = roomInsertService.registRoom(mc_rooms);

		if (!isInsertSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("mocaList.mc");
		}

		return forward;

	}

}