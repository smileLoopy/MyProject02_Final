package member;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import utils.CookieManager;
import utils.JSFunction;

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {

	// 여기서 doGet, doPost를 만들겁니다
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String clientId = "HVVeCXQIB3ojtGVHzBGo";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "aU5nB28Zr5";// 애플리케이션 클라이언트 시크릿값";
		String code = req.getParameter("code");
		String state = req.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:8082/MyProject02_Final/Website/index.jsp", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String access_token = "";
		String refresh_token = "";
		// System.out.println("apiURL="+apiURL);
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.print("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
				System.out.println(res.toString());
				JSONParser parsing = new JSONParser();
				Object obj = parsing.parse(res.toString());
				JSONObject jsonObj = (JSONObject) obj;

				access_token = (String) jsonObj.get("access_token");
				refresh_token = (String) jsonObj.get("refresh_token");
				System.out.println(access_token);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		if (access_token != null) { // access_token을 잘 받아왔다면
			try {
				String token = access_token; // 네이버 로그인 접근 토큰;
				String header = "Bearer " + token; // Bearer 다음에 공백 추가
				String apiurl = "https://openapi.naver.com/v1/nid/me";
				URL url = new URL(apiurl);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("Authorization", header);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if (responseCode == 200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else { // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer res = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					res.append(inputLine);
					JSONParser parsing = new JSONParser();
					Object obj = parsing.parse(res.toString());
					JSONObject jsonObj = (JSONObject) obj;
					JSONObject resObj = (JSONObject) jsonObj.get("response");
					// 비밀번호는 가져올 수 없어서 만들기
					String splitToken = access_token.substring(1, 5) + access_token.substring(40, 44);
					// 왼쪽 변수 이름은 원하는 대로 정하면 된다.
					// 단, 우측의 get()안에 들어가는 값은 와인색 상자 안의 값을 그대로 적어주어야 한다.
					// 가져올 내용 추가 가능
					String lastname = (String) resObj.get("name").toString().substring(0, 1);
					String firstname = (String) resObj.get("name").toString().substring(1);
					String id = resObj.get("id").toString().substring(1, 10);
					String pw = splitToken;
					System.out.println(firstname);
					System.out.println(lastname);
					System.out.println(id);
					System.out.println(pw);
					HttpSession session = req.getSession();
					
					session.setAttribute("firstname", firstname);
					session.setAttribute("id", id);

					MembershipDAO dao = new MembershipDAO();

					MembershipDTO dto = dao.idValidate(id);
					if (dto.getId() == null) {
						dto.setId(id);
						dto.setPass(pw);
						dto.setLastname(lastname);
						dto.setFirstname(firstname);

						int success = dao.memberInsert(dto);
						System.out.println(success);
					} else {
						System.out.println("이미 있는 아이디");
					}

					dao.close();
				}
				br.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
//		req.getRequestDispatcher("../Website/index.jsp").forward(req, resp);
		resp.sendRedirect("../Website/index.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 아이디와 비번을 가져옵니다.
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");

		System.out.println(id);
		System.out.println(pass);
		/*
		 * 체크박스의 경우 둘 이상의 값이라면 getParameterValues()를 통해 받아야 하지만 항목이 한개라면 getParameter()를
		 * 사용할 수 있다.
		 */
		String save_check = req.getParameter("save_check");

		// DAO객체를 생성합니다
		MembershipDAO mDao = new MembershipDAO();

		// DAO의 memberSelect()의 결과값을 DTO에 저장합니다

		MembershipDTO dto = mDao.memberSelect(id, pass);
		// System.out.println(dto.getUser_name());

		mDao.close(); // 반납

		// 회원정보를 찾으면...
		if (dto.getId() != null) {

			// "아이디저장하기" 체크박스를 체크한 경우
			if (save_check != null && save_check.equals("Y")) {
				// 쿠키를 생성한다. 쿠키값은 로그인 아이디, 유효기간은 1일로 설정한다.
				CookieManager.makeCookie(resp, "loginId", id, 86400);
			} else {
				// 체크를 해제한 경우에는 쿠키를 삭제한다.
				CookieManager.deleteCookie(resp, "loginId");
			}

			// 세션생셩
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			session.setAttribute("firstname", dto.getFirstname());

			JSFunction.alertLocation(resp, "로그인성공", "/MyProject02_Final/Website/index.jsp");
		} else {
			JSFunction.alertBack(resp, "맞는 회원정보가 없습니다");
		}
	}
}