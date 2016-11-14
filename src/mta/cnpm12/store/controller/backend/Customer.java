package mta.cnpm12.store.controller.backend;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.KhachHang;
import mta.cnpm12.store.dao.CustomerDAO;
import mta.cnpm12.store.utility.Encryptor;

/**
 * Servlet implementation class Customer
 */
@WebServlet("/Customer")
public class Customer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
				List<KhachHang> list;
				try {
					list = CustomerDAO.listAll();
					request.setAttribute("list", list);
					request.getRequestDispatcher("/backend/customer-list.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}
			if (task.equals("edit")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					KhachHang e = CustomerDAO.getById(id);
					request.setAttribute("e", e);
					request.getRequestDispatcher("/backend/edit-customer.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (task.equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					boolean bl = CustomerDAO.delete(id);
					if (bl) {
						response.sendRedirect(request.getContextPath() + "/admin/customer");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String task = "";
		if (request.getParameter("task") != null) {
			task = request.getParameter("task");
		}
		if (task.equals("edit")) {
			// String name = request.getParameter("name");
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String phone = request.getParameter("phonenumber");
			String email = request.getParameter("email");
			Boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			try {
				KhachHang obj = CustomerDAO.getById(id);
				if(!obj.getMatKhau().equals(password)){
					password = Encryptor.encryptMD5(password);
				}
				boolean status = Boolean.parseBoolean(request.getParameter("status"));
				KhachHang e = new KhachHang(id, name, address, phone, email, gender, username, password, status);
				boolean bl = false;
				bl = CustomerDAO.edit(e);
				if (bl) {
					response.sendRedirect(request.getContextPath() + "/admin/customer");
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (NoSuchAlgorithmException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			
		}
	}

}
