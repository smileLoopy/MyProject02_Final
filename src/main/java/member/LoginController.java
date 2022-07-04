package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.CookieManager;
import utils.JSFunction;

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	
	//여기서  doGet, doPost를 만들겁니다
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("../admin/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//아이디와 비번을 가져옵니다.
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		
		/*  
		체크박스의 경우 둘 이상의 값이라면 getParameterValues()를 통해 받아야 하지만
		항목이 한개라면 getParameter()를 사용할 수 있다.
		*/
		String save_check = req.getParameter("save_check");


		//DAO객체를 생성합니다
		MembershipDAO mDao = new MembershipDAO();
		
		//DAO의 memberSelect()의 결과값을 DTO에 저장합니다
		
		MembershipDTO dto = mDao.memberSelect(id, pass);
		//System.out.println(dto.getUser_name());
		
		mDao.close(); //반납
		
		//회원정보를 찾으면...
		if(dto.getId() != null) {
			
			//"아이디저장하기" 체크박스를 체크한 경우 
			if(save_check !=null && save_check.equals("Y")){
				//쿠키를 생성한다. 쿠키값은 로그인 아이디, 유효기간은 1일로 설정한다.
				CookieManager.makeCookie(resp, "loginId", id, 86400);
			}
			else{
				//체크를 해제한 경우에는 쿠키를 삭제한다.
				CookieManager.deleteCookie(resp, "loginId");
			}
			
			//세션생셩
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
		    session.setAttribute("firstname", dto.getFirstname());
		    
		    JSFunction.alertLocation(resp, "로그인성공", "/MyProject02_Final/Website/index.jsp");
		}else {
			JSFunction.alertBack(resp, "맞는 회원정보가 없습니다");
		}
	}
}