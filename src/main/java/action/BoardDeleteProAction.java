package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardDeleteProService;
import vo.ActionForward;

public class BoardDeleteProAction implements Action {

	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{	 

		ActionForward forward = null;
		int nt_no=Integer.parseInt(request.getParameter("nt_no"));
		String nowPage = request.getParameter("page");
		BoardDeleteProService boardDeleteProService = new BoardDeleteProService();
		boolean isArticleWriter =boardDeleteProService.isArticleWriter(nt_no);

		if(!isArticleWriter){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}

		else{
			
			boolean isDeleteSuccess = boardDeleteProService.removeArticle(nt_no);//t

			if(!isDeleteSuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('삭제실패');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			else{
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardList.mc?page=" + nowPage);
			}
			
		}


		return forward;
	}

}