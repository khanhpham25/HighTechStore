package mta.cnpm12.store.controller.backend;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mta.cnpm12.store.beans.QuanTriVien;
import mta.cnpm12.store.dao.AdminDAO;
import mta.cnpm12.store.utility.Encryptor;

/**
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profile() {
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
		if(request.getSession().getAttribute("login") == null){
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}
		else{
			String task = "";
			if (request.getParameter("task") != null) {
				task = request.getParameter("task");
			}
			if (task.equals("")) {
				request.getRequestDispatcher("/backend/profile.jsp").forward(request, response);
			}
			if (task.equals("change_password")) {
				request.getRequestDispatcher("/backend/change-password.jsp").forward(request, response);
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String task = "";
		if (request.getParameter("task") != null) {
			task = request.getParameter("task");
		}
		if (task.equals("change_password")) {
			String expassword = request.getParameter("expassword");
			String newpassword = request.getParameter("newpassword");
			String confirmpassword = request.getParameter("confirmpassword");
			HttpSession session = request.getSession();
			QuanTriVien e = (QuanTriVien) session.getAttribute("login");
			try {
				if(e.getMatKhau().equals(Encryptor.encryptMD5(expassword))){
					if(newpassword.length() < 6){
						request.setAttribute("error_length", "Mật khẩu phải có tối thiểu 6 ký tự");
						request.getRequestDispatcher("/backend/change-password.jsp").forward(request, response);
					}
					else{
						if(newpassword.equals(confirmpassword)){
							e.setMatKhau(Encryptor.encryptMD5(newpassword));
							boolean bl = AdminDAO.change_password(e);
							if(bl){
								response.sendRedirect(request.getContextPath() + "/admin/profile");
							}
							else{
								request.setAttribute("error", "Có lỗi xảy ra trong quá trình đổi mật khẩu!");
								request.getRequestDispatcher("/backend/change-password.jsp").forward(request, response);
							}
						}
						else{
							request.setAttribute("error_confirm", "Mật khẩu không trùng khớp");
							request.getRequestDispatcher("/backend/change-password.jsp").forward(request, response);
						}
					}
				}
				else{
					request.setAttribute("error_ex", "Mật khẩu không đúng");
					request.getRequestDispatcher("/backend/change-password.jsp").forward(request, response);
				}
			} catch (NoSuchAlgorithmException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
