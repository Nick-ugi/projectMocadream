package action;

import java.io.File;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MocaDeleteProService;
import vo.ActionForward;

public class MocaDeleteProAction implements Action {

    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ActionForward forward = null;
        int r_no = Integer.parseInt(request.getParameter("r_no"));
        String r_file = request.getParameter("r_file");
        String nowPage = request.getParameter("page");

        if (r_file == null || r_file.isEmpty()) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('파일 이름이 제공되지 않았습니다.');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
            return null;
        }

        MocaDeleteProService mocaDeleteProService = new MocaDeleteProService();
        String realFolder = "";
        String saveFolder = "/roomUpload";
//      realFolder = "C:/apache-tomcat-9.0.86/webapps/mocadream" + saveFolder;
        realFolder = "C:/Dwork/mocadream/src/main/webapp" + saveFolder;
        String deleteFile = realFolder + "/" + r_file;

        File file = new File(deleteFile);

        boolean isDeleteSuccess = mocaDeleteProService.removeRoom(r_no);

        if (!isDeleteSuccess) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('삭제 실패');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
        } else {
            if (file.exists()) {
                if (file.delete()) {
                    System.out.println("파일 삭제 성공");
                } else {
                    System.out.println("파일 삭제 실패");
                }
            } else {
                System.out.println("삭제할 파일이 존재하지 않습니다.");
            }

            forward = new ActionForward();
            forward.setRedirect(true);
            forward.setPath("mocaList.mc");
        }

        return forward;
    }

}