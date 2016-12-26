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
 * Servlet implementation class ProfileCustomer
 */
@WebServlet("/ProfileCustomer")
public class ProfileCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileCustomer() {
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
		if(request.getSession().getAttribute("clientLogin") != null){
			KhachHang client = (KhachHang) request.getSession().getAttribute("clientLogin");
			request.setAttribute("client", client);
			request.getRequestDispatcher("/frontend/profile-customer.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		KhachHang client = (KhachHang) request.getSession().getAttribute("clientLogin");
		request.setAttribute("client", client);
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phonenumber");
		String expassword = request.getParameter("expassword");
		String newpassword = request.getParameter("password");
		String confirmpassword = request.getParameter("confirmpassword");
		try {
			KhachHang e = CustomerDAO.getById(id);
			e.setHoTen(name);
			e.setDiaChi(address);
			e.setSoDienThoai(phone);
			if(expassword.length() > 0 && newpassword.length() > 0){
				if(e.getMatKhau().equals(Encryptor.encryptMD5(expassword))){
					if(newpassword.length() < 6){
						request.setAttribute("error_length", "Mật khẩu phải có tối thiểu 6 ký tự");
						request.getRequestDispatcher("/frontend/profile-customer.jsp").forward(request, response);
					}
					else{
						if(newpassword.equals(confirmpassword)){
							e.setMatKhau(Encryptor.encryptMD5(newpassword));
							boolean bl = CustomerDAO.change_profile(e);
							if(bl){
								request.setAttribute("msg", "Thay đổi thông tin cá nhân thành công");
								request.getRequestDispatcher("/frontend/profile-customer.jsp").forward(request, response);
							}
							else{
								request.setAttribute("error", "Có lỗi xảy ra trong quá trình đổi mật khẩu!");
								request.getRequestDispatcher("/frontend/profile-customer.jsp").forward(request, response);
							}
						}
						else{
							request.setAttribute("error_confirm", "Mật khẩu không trùng khớp");
							request.getRequestDispatcher("/frontend/profile-customer.jsp").forward(request, response);
						}
					}
				}
				else{
					request.setAttribute("error_ex", "Mật khẩu không đúng");
					request.getRequestDispatcher("/frontend/profile-customer.jsp").forward(request, response);
				}
			}
			else{
				boolean bl = CustomerDAO.change_profile(e);
				if(bl){
					request.setAttribute("msg", "Thay đổi thông tin cá nhân thành công");
					request.getRequestDispatcher("/frontend/profile-customer.jsp").forward(request, response);
				}
				else{
					request.setAttribute("error", "Có lỗi xảy ra trong quá trình đổi mật khẩu!");
					request.getRequestDispatcher("/frontend/profile-customer.jsp").forward(request, response);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
