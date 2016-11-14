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

import mta.cnpm12.store.beans.QuanTriVien;
import mta.cnpm12.store.dao.AdminDAO;
import mta.cnpm12.store.utility.Encryptor;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/Admin")
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin() {
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
				List<QuanTriVien> list;
				try {
					list = AdminDAO.listAll();
					request.setAttribute("list", list);
					request.getRequestDispatcher("/backend/admin-list.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}
			if (task.equals("create")) {
				request.getRequestDispatcher("/backend/add-admin.jsp").forward(request, response);
			}
			if (task.equals("edit")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					QuanTriVien e = AdminDAO.getById(id);
					request.setAttribute("e", e);
					request.getRequestDispatcher("/backend/edit-admin.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (task.equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					boolean bl = AdminDAO.delete(id);
					if (bl) {
						response.sendRedirect(request.getContextPath() + "/admin/admin");
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
		if (task.equals("create")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String password = null;
			try {
				password = Encryptor.encryptMD5(request.getParameter("password"));
			} catch (NoSuchAlgorithmException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			Boolean status = Boolean.parseBoolean(request.getParameter("status"));
			QuanTriVien e = new QuanTriVien(0, name, email, username, password, status);
			boolean bl = false;
			try {
				bl = AdminDAO.create(e);
				if (bl) {
					response.sendRedirect(request.getContextPath() + "/admin/admin");
				} else {
					request.setAttribute("error", "Bản ghi vừa nhập đã bị trùng");
					request.getRequestDispatcher("/backend/add-admin.jsp").forward(request, response);
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		if (task.equals("edit")) {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			boolean status = Boolean.parseBoolean(request.getParameter("status"));
			try {
				QuanTriVien obj = AdminDAO.getById(id);
				if(!obj.getMatKhau().equals(password)){
					password = Encryptor.encryptMD5(password);
				}
				QuanTriVien e = new QuanTriVien(id, name, email, username, password, status);
				boolean bl = false;
				bl = AdminDAO.edit(e);
				if (bl) {
					response.sendRedirect(request.getContextPath() + "/admin/admin");
				}
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			} catch (NoSuchAlgorithmException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
