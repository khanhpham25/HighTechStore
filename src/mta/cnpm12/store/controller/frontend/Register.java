package mta.cnpm12.store.controller.frontend;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.KhachHang;
import mta.cnpm12.store.dao.CustomerDAO;
import mta.cnpm12.store.utility.Encryptor;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
		if(request.getSession().getAttribute("clientLogin") == null){
			request.getRequestDispatcher("/frontend/register.jsp").forward(request, response);
		}
		else{
			response.sendRedirect(request.getContextPath() + "/index");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
		String username = request.getParameter("username");
		String password;
		try {
			password = Encryptor.encryptMD5(request.getParameter("password"));
			String checkUsername = CustomerDAO.checkUsername(username);
			String checkEmail = CustomerDAO.checkEmail(email);
			if(checkUsername == null && checkEmail == null){
				KhachHang e = new KhachHang(name, address, tel, email, gender, username, password, true);
				boolean bl = false;
				bl = CustomerDAO.create(e);
				if(bl){
					response.sendRedirect(request.getContextPath() + "/register-success");
				}
				else{
					request.setAttribute("errorMessage", "Có lỗi xảy ra trong quá trình đăng ký thành viên!");
					request.getRequestDispatcher("/frontend/register.jsp").forward(request, response);
				}
			}
			else{
				request.setAttribute("errorUsername", checkUsername);
				request.setAttribute("errorEmail", checkEmail);
				request.getRequestDispatcher("/frontend/register.jsp").forward(request, response);
			}
		} catch (NoSuchAlgorithmException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}

}
