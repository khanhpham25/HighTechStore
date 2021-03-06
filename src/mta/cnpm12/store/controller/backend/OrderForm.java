package mta.cnpm12.store.controller.backend;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.ChiTietDonHang;
import mta.cnpm12.store.beans.DonHang;
import mta.cnpm12.store.dao.OrderFormDAO;

/**
 * Servlet implementation class OrderForm
 */
@WebServlet("/OrderForm")
public class OrderForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderForm() {
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
				List<DonHang> list;
				try {
					list = OrderFormDAO.listAll();
					request.setAttribute("list", list);
					request.getRequestDispatcher("/backend/orderform-list.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}
			if (task.equals("detail")) {
				int id = Integer.parseInt(request.getParameter("id"));
				List<ChiTietDonHang> list;
				try {
					list = OrderFormDAO.listAllDetail(id);
					request.setAttribute("list", list);
					request.setAttribute("id", id);
					request.getRequestDispatcher("/backend/orderform-detail.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (task.equals("edit")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					DonHang e = OrderFormDAO.getById(id);
					request.setAttribute("e", e);
					request.getRequestDispatcher("/backend/edit-orderform.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (task.equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					boolean bl = OrderFormDAO.delete(id);
					if (bl) {
						response.sendRedirect(request.getContextPath() + "/admin/orderform");
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
			int id = Integer.parseInt(request.getParameter("id"));
			boolean status = Boolean.parseBoolean(request.getParameter("status"));
			DonHang e = new DonHang();
			e.setMaDonHang(id);
			e.setTinhTrangGiaoHang(status);
			boolean bl = false;
			try {
				bl = OrderFormDAO.edit(e);
				if (bl) {
					response.sendRedirect(request.getContextPath() + "/admin/orderform");
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
