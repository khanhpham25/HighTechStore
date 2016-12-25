package mta.cnpm12.store.controller.frontend;

import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionCounter implements HttpSessionListener {
	private static int songuoionline=0;

	//ham de lay bien so nguoi online
	public static int getSonguoionline() {
	return songuoionline;
	}

	public void sessionCreated(HttpSessionEvent se) {
	HttpSession session = se.getSession(); //lay session từ HttpSessionEvent
	Date now = new Date();
	//System.out.println("Da tao session co ID "+ session.getId()+" vao thoi diem " + now );
	//System.out.println("Dang có " + songuoionline +" online");
	songuoionline ++;
	}

	public void sessionDestroyed(HttpSessionEvent se) {
	HttpSession session = se.getSession(); //lay session từ HttpSessionEvent
	Date now = new Date();
	//System.out.println("Da huy session co ID "+ session.getId()+" vao thoi diem " + now );
	songuoionline --;
	}
}
