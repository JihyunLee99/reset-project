package ga.beauty.reset.utils;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import com.mysql.cj.util.StringUtils;

import ga.beauty.reset.dao.Common_Dao;
import ga.beauty.reset.dao.Event_DaoImpl;
import ga.beauty.reset.dao.Magazine_DaoImpl;
import ga.beauty.reset.dao.entity.Event_Vo;
import ga.beauty.reset.dao.entity.Magazine_Vo;

@Service
public class UpdateViewUtils {
	
	@Autowired
	Common_Dao<Event_Vo> event_Dao;
	
	public UpdateViewUtils() {
	}
	
	public void UpdateView(HttpServletResponse resp,HttpServletRequest req
			,String type, int no,Model model ) throws SQLException{
		Cookie cookies[] = req.getCookies();
		Map mapCookie = new HashMap();
		if(req.getCookies()!=null) {
			for(int i=0; i<cookies.length;i++) {
				Cookie obj= cookies[i];
				mapCookie.put(obj.getName(), obj.getValue());
			}
		}
		//����� ��Ű�߿� read_count �� �ҷ�����
		String cookie_view =(String) mapCookie.get("read_count");
		//����� ���ο� ��Ű�� ����
		String new_cookie_view ="|"+type+no;
		// ����� ��Ű�� ���ο� ��Ű���� �����ϴ� �˻�
		if(StringUtils.indexOfIgnoreCase(cookie_view, new_cookie_view)==-1) {
			//���� ��� ��Ű ����
			Cookie cookie =new Cookie("read_count", cookie_view + new_cookie_view);
			//��Ű ��ȿ �ð� (�ʴ�����.)
			//cookie.setMaxAge(60*60*24);
			cookie.setMaxAge(60*60*24);
			resp.addCookie(cookie);
			/*//��ȸ�� ������Ʈ
			Event_DaoImpl EventDao = new Event_DaoImpl();
			Event_Vo bean =new Event_Vo();
			EventDao.updateView(bean);*/
			if(type.equals("event")) {
				updateEventView(no);
			}else if(type.equals("magazine")) {
				//updateMagazineView(no);
			}
		}
	}
	
	public void updateEventView(int no) throws SQLException {
		//��ȸ�� ������Ʈ
		Event_Vo bean =new Event_Vo();
		bean.setEve_no(no);
		event_Dao.updateView(bean);
	}
	
	/*public void updateMagazineView(int no) throws SQLException {
		//��ȸ�� ������Ʈ
		Magazine_DaoImpl MagazineDao = new Magazine_DaoImpl();
		Magazine_Vo bean =new Magazine_Vo();
		//bean.setEve_no(no);
		//EventDao.updateView(bean);
	}*/
	
	
}
