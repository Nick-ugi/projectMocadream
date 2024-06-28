package controller;

import static util.JdbcUtil.close;
import static util.JdbcUtil.getConnection;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import dao.MocaDAO;
import vo.Mc_users;

@WebServlet("/IdCheck")
public class IdCheck extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("HelloServlet doProcess()");

		// 전송한 데이터가 form데이터인 경우
		String id = request.getParameter("id");
		System.out.println("id  : " + id);

		if (id == null) {
			// 전송한 데이터가 json데이터 인 경우
			ServletInputStream req = request.getInputStream();
			StringBuilder stringBuilder = new StringBuilder();
			BufferedReader bufferedReader = null;
			try {
				InputStream inputStream = request.getInputStream();
				if (inputStream != null) {
					bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
					char[] charBuffer = new char[128];
					int bytesRead = -1;
					while ((bytesRead = bufferedReader.read(charBuffer)) > -1) {
						stringBuilder.append(charBuffer, 0, bytesRead);
					}
				} else {
					stringBuilder.append("");
					System.out.println(stringBuilder);
				}
				JSONParser json = new JSONParser();
				// JSON형태로 변경해주는 JSONParser
				JSONObject jobj;
				// JSONObject는 Object 형식을 JSON형식으로 변경
				try {
					jobj = (JSONObject) json.parse(stringBuilder.toString());
					id = (String) jobj.get("id");
					System.out.println("json id  : " + id);

				} catch (ParseException e) {
					e.printStackTrace();
				}

			} catch (IOException ex) {
				throw ex;
			} finally {
				if (bufferedReader != null) {
					try {
						bufferedReader.close();
					} catch (IOException ex) {
						throw ex;
					}
				}
			}
		}

		Mc_users mc_users = new Mc_users();
		mc_users.setId(id);
		Connection con = getConnection();
		MocaDAO mocaDAO = MocaDAO.getInstance();
		mocaDAO.setConnection(con);
		boolean result = mocaDAO.idCheck(mc_users);
		close(con);
		String str;

		if (result)
			str = "사용하실 수 없는 아이디입니다.";
		else
			str = "사용 가능한 아이디입니다.";

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("str", str);
		map.put("id", id);

		JSONObject jObject = new JSONObject();
		// json-simple에서 제공해주는 객체
		jObject.put("map", map);

		response.setContentType("application/x-json; charset=utf-8");
		response.getWriter().print(jObject);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
