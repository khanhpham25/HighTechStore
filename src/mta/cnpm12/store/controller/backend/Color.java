package mta.cnpm12.store.controller.backend;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.MauSac;
import mta.cnpm12.store.dao.ColorDAO;

/**
 * Servlet implementation class Color
 */
@WebServlet("/Color")
public class Color extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Color() {
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
				List<MauSac> list;
				try {
					list = ColorDAO.listAll();
					request.setAttribute("list", list);
					request.getRequestDispatcher("/backend/color-list.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}
			if (task.equals("create")) {
				request.getRequestDispatcher("/backend/add-color.jsp").forward(request, response);
			}
			if (task.equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					boolean bl = ColorDAO.delete(id);
					if (bl) {
						response.sendRedirect(request.getContextPath() + "/admin/color");
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
			MauSac e = new MauSac(name);
			boolean bl = false;
			try {
				bl = ColorDAO.create(e);
				if (bl) {
					response.sendRedirect(request.getContextPath() + "/admin/color");
				} else {
					request.setAttribute("error", "Bản ghi vừa nhập đã bị trùng");
					request.getRequestDispatcher("/backend/add-color.jsp").forward(request, response);
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
