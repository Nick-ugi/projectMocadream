package action;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberIdFindService;
import vo.ActionForward;
import vo.Mc_users;

public class MemberIdFindAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Mc_users member = new Mc_users();

		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));

		MemberIdFindService memberFindIdService = new MemberIdFindService();
		List<String> idList = memberFindIdService.findMember(member);

		ActionForward forward = null;

		if (idList == null || idList.isEmpty()) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 조회실패\\n 입력하신 이름과 이메일을 확인해주세요.')");
			out.println("history.back()");
			out.println("</script>");

		} else {
			// 검색 결과가 있을 경우
			System.out.println(idList);
			request.setAttribute("idList", idList);
			forward = new ActionForward();
			forward.setRedirect(false); // 리다이렉트 방식을 사용하지 않음
			forward.setPath("/idFindResult.mc"); // 결과 페이지로 이동

		}
		return forward;
	}
}