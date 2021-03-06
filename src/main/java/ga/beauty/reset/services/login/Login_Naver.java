package ga.beauty.reset.services.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import ga.beauty.reset.controller.Login_Controller;
import ga.beauty.reset.dao.User_Dao;
import ga.beauty.reset.dao.entity.Login_Vo;
import ga.beauty.reset.dao.entity.User_Vo;
import ga.beauty.reset.services.Login_Service;
import ga.beauty.reset.utils.ErrorEnum;
import ga.beauty.reset.utils.LogEnum;

@Service("login_Naver")
public class Login_Naver implements Login_Service{

	private Logger logger = Logger.getLogger(Login_Controller.class);


	private final String clientId = "tfJeSZAfwMMgSJ0l4M9h";//애플리케이션 클라이언트 아이디값";
	private final String clientSecret = "13p5vTz404";//애플리케이션 클라이언트 시크릿값";
	private String redirectURI;
	
	ObjectMapper mapper = new ObjectMapper();

	
	@Autowired
	User_Dao user_Dao;
	
	//
	public Login_Naver() throws UnsupportedEncodingException {
		redirectURI =  URLEncoder.encode("http://reset-beauty.ga/login/naver", "UTF-8"); // TODO 나중에 바꿀거
	}

	@Override
	public String logout(Model model, HttpServletRequest req, HttpServletResponse resp) {
		req.getSession().invalidate();
		return "index";
	}
	
	
	@Override
	public Model login(Model model, HttpServletRequest req) throws ClientProtocolException, IOException, URISyntaxException, SQLException {
		String state = req.getParameter("state");
		
		HttpServletRequest request = req;
		HttpSession userSession = req.getSession();
		String code = req.getParameter("code");

		Login_Vo bean = new Login_Vo();
		bean.setRequest(request);
		bean.setUserSession(userSession);

		int resultCode =0;
		if( (resultCode = getToken(code,state, bean))!=200  ) {
			request.setAttribute("login_err",ErrorEnum.TOKENERR);
			return model;
		} 

		String result= this.checkEmail(bean); // 정상적이면 이메일
		if(result.equals(ErrorEnum.EMAILERR)) {
			request.setAttribute("login_err",ErrorEnum.EMAILERR);
			return model;
		}

		User_Vo checkEmailVo = new User_Vo();
		checkEmailVo.setEmail(result);
		userSession.setAttribute("login_email", checkEmailVo.getEmail());
		userSession.setAttribute("login_route", "naver");
		User_Vo resultUser = user_Dao.selectOne(checkEmailVo);
		if( resultUser != null) {
			if(resultUser.getJoin_route().contains("naver")) {
				// 로그인 완료
			userSession.setAttribute("access_token", bean.getAccess_token());
			userSession.setAttribute("refresh_token", bean.getRefresh_token());
			userSession.setAttribute("login_user_type", resultUser.getUser_type());
			userSession.setAttribute("login_on", true);
			req.setAttribute("login_result", "redirect:"+userSession.getAttribute("old_url"));
			}else {
				// 연동할건지 물어보기
				userSession.setAttribute("login_user_type", resultUser.getUser_type());
				userSession.setAttribute("join_route", resultUser.getJoin_route());
				req.setAttribute("login_result", "redirect:/login/adds/");
			}
		}else {
			// 회원가입
			req.setAttribute("login_result", "redirect:/sign/");
		}
		return model;
	}

	private int getToken(String code, String state, Login_Vo bean) throws ClientProtocolException, IOException, URISyntaxException  {
		
		String apiURL = "https://nid.naver.com/oauth2.0/token";
		URIBuilder urlbuilder = new URIBuilder(apiURL);
		urlbuilder.setCharset(Charset.forName("UTF-8"))
			.setParameter("grant_type", "authorization_code")
			.setParameter("client_id", clientId)
			.setParameter("client_secret", clientSecret)
			.setParameter("redirect_uri", redirectURI)
			.setParameter("code", code)
			.setParameter("state",state);
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpGet getR = new HttpGet(urlbuilder.build());
		final HttpResponse response = client.execute(getR); // 연결시작
		
		int responseCode=0;
		responseCode = response.getStatusLine().getStatusCode();
		String responseString ="";
		responseString = EntityUtils.toString(response.getEntity());

		logger.debug(LogEnum.DEBUG+"Response Code - getToken(naver) : " + responseCode);
		JsonNode tokenJson = null;
		if(responseCode==200) {
			tokenJson = mapper.readTree(responseString);
			bean.setAccess_token(tokenJson.get("access_token").asText());
			bean.setRefresh_token(tokenJson.get("refresh_token").asText());
			//access_token= tokenJson.get("access_token").asText();
			//refresh_token= tokenJson.get("refresh_token").asText();
		}else {
			logger.debug(LogEnum.DEBUG+"Response Err - getToken(naver) : ("+bean.getRequest().getRemoteHost()+")/"+ responseString);
		}
		return responseCode;
		
	}
	
	
	private String checkEmail(Login_Vo bean) throws IOException, URISyntaxException {
		String header = "Bearer " + bean.getAccess_token(); // Bearer 다음에 공백 추가
		String apiURL = "https://openapi.naver.com/v1/nid/me";

		URIBuilder urlbuilder = new URIBuilder(apiURL).setCharset(Charset.forName("UTF-8"));

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpGet getR = new HttpGet(urlbuilder.build());
		getR.setHeader("Authorization", "Bearer " + bean.getAccess_token());
		final HttpResponse response = client.execute(getR); // 연결시작
		
		int responseCode=0;
		responseCode = response.getStatusLine().getStatusCode();
		String responseString ="";
		responseString = EntityUtils.toString(response.getEntity());

		JsonNode tokenJson = null;
		logger.debug(LogEnum.DEBUG+"Response Code - checkEmail(naver) : ("+bean.getRequest().getRemoteHost()+")/"+responseCode); // TODO 지울거
		if(responseCode==200) {
			tokenJson = mapper.readTree(responseString.toString());
			JsonNode resultJson = tokenJson.get("response");
			return resultJson.get("email").asText();
		}else {
			logger.debug(LogEnum.DEBUG+"Response Code - checkEmail(naver) : ("+bean.getRequest().getRemoteHost()+")/"+responseCode);
			logger.debug(LogEnum.DEBUG+"Response Err - checkEmail(naver) : ("+bean.getRequest().getRemoteHost()+")/"+responseString);
			return ErrorEnum.EMAILERR;
		}
	}// checkEmail();



}
