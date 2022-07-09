<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="utils.CookieManager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//loginId 라는 이름의 쿠키를 읽어온다.
String loginId = CookieManager.readCookie(request, "loginId");

//앞에서 읽어온 쿠키값이 있다면 checked 속성값을 변수에 설정한다.
String cookieCheck = "";
if(!loginId.equals("")){
	cookieCheck = "checked";
}
%>
<!DOCTYPE html> 
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    		
    		<script type="text/javascript">
    		function loginValidate(form) {
					if(!form.id.value){
						alert("Enter your ID");
						form.id.focus();
						return false;
					}
					if(form.pass.value==""){
						alert("Enter your Password");
						form.pass.focus();
						return false;
					}
				}
    		</script>
    </head>
    <!-- 배경색 변경 -->
    <body class="bg-light">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                                    
                                    
                                    
                                    		<!-- Form 태그 -->
                                        <form name="loginFrm" method="post" action="../member/login.do" onsubmit="return loginValidate(this);">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="id"  name="id" type="text" placeholder="name@example.com" value="<%=loginId %>" />
                                                <label for="inputEmail">Id</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="pass" name="pass" type="password" placeholder="Password" />
                                                <label for="inputPassword">Password</label>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" id="save_check" name="save_check"type="checkbox" value="Y" <%= cookieCheck %> />
                                                <label class="form-check-label" for="save_check">Remember ID</label>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                                <label class="form-check-label" for="inputRememberPassword">Remember Password</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="password.html">Forgot Password?</a>
                                                <button type="button" class="btn btn-primary" id="naverIdLogin_loginButton" href="javascript:void(0)">Login</button>
                                            </div>
                                        </form>
                                        <!-- form태그 끝 -->
                                        
                                        
                                        <!-- 네이버 로그인 (from태그 밖으로 넣어야함)  -->
                                        <br />
                                        <ul>
																				<li>
																			      <!-- 아래와같이 아이디를 꼭 써준다. -->
																			      <a id="naverIdLogin_loginButton" href="javascript:void(0)">
																			          <span>네이버 로그인</span>
																			      </a>
																				</li>
																				<li onclick="naverLogout(); return false;">
																			      <a href="javascript:void(0)">
																			          <span>네이버 로그아웃</span>
																			      </a>
																				</li>
																				<input type="hidd-en"  id="naver_name"/>
																			</ul>
                                      <!-- 네이버 스크립트 -->
																			<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>  
                                      <script>
																			var naverLogin = new naver.LoginWithNaverId(
																					{
																						clientId: "HVVeCXQIB3ojtGVHzBGo", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
																						callbackUrl: "http://localhost:8082/MyProject02_Final/admin/login.jsp", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
																						isPopup: false,
																						callbackHandle: true
																					}
																				);	
																			
																			naverLogin.init();
																			
																			window.addEventListener('load', function () {
																				naverLogin.getLoginStatus(function (status) {
																					if (status) {
																						var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
																			    		
																						console.log(naverLogin.user);
																						document.getElementById('naver_name').value = naverLogin.user.name;
																			    		
																			      if( email == undefined || email == null) {
																							alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
																							naverLogin.reprompt();
																							return;
																						}
																					} else {
																						console.log("callback 처리에 실패하였습니다.");
																					}
																				});
																			});
																			
																			
																			var testPopUp;
																			function openPopUp() {
																			    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
																			}
																			function closePopUp(){
																			    testPopUp.close();
																			}
																			
																			function naverLogout() {
																				openPopUp();
																				setTimeout(function() {
																					closePopUp();
																					}, 1000);
																				
																				
																			}
																			</script> 
                                        
                                    </div>
                                    <div class="card-footer text-center py-3">
                                    			
                                        <div class="small"><a href="<%=request.getContextPath()%>/admin/register.jsp">Need an account? Sign up!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
