package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.MocaDetailActionService;
import vo.ActionForward;
import vo.Mc_rooms;
import vo.PageInfo;
import java.util.ArrayList;

public class MocaDetailAction implements Action {
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception { 
        ActionForward forward = new ActionForward();

        // 모든 방 정보 가져오기
        MocaDetailActionService roomDetailActionService = new MocaDetailActionService();
        ArrayList<Mc_rooms> roomList = roomDetailActionService.getAllRooms(); // 모든 방 정보 가져오기

        // 페이지 정보 설정
        String page = request.getParameter("page");
        request.setAttribute("page", page);

        // pageInfo 속성 설정
        PageInfo pageInfo = new PageInfo();
        pageInfo.setListCount(roomList.size()); // 방 목록의 크기를 설정합니다.
        request.setAttribute("pageInfo", pageInfo);

        // 방 정보 설정
        request.setAttribute("roomList", roomList);

        forward.setPath("/moca_view.jsp");
        return forward;
    }
}