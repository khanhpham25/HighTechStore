package mta.cnpm12.store.controller.frontend;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.KhachHang;
import mta.cnpm12.store.beans.PhanHoi;
import mta.cnpm12.store.dao.FeedbackDAO;

/**
 * Servlet implementation class Contact
 */
@WebServlet("/Contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/frontend/contact.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String content = request.getParameter("message");
		Date date = new Date(System.currentTimeMillis());
		int idCustomer = ((KhachHang)request.getSession().getAttribute("clientLogin")).getMaKhachHang();
		PhanHoi e = new PhanHoi(0, date, content, idCustomer);
		boolean bl = false;
		try {
			bl = FeedbackDAO.create(e);
			if(bl){
				request.setAttribute("message", "Cám ơn quý khách đã gửi phản hồi tích cực cho hệ thống!");
				request.getRequestDispatcher("/frontend/contact.jsp").forward(request, response);
			}
			else{
				request.setAttribute("errorMessage", "Có lỗi xảy ra trong quá trình gửi phản hồi!");
				request.getRequestDispatcher("/frontend/contact.jsp").forward(request, response);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
