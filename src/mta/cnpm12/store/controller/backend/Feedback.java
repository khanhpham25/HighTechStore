package mta.cnpm12.store.controller.backend;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.KhachHang;
import mta.cnpm12.store.beans.PhanHoi;
import mta.cnpm12.store.dao.CustomerDAO;
import mta.cnpm12.store.dao.FeedbackDAO;

/**
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Feedback() {
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
				List<PhanHoi> list;
				try {
					list = FeedbackDAO.listAll();
					request.setAttribute("list", list);
					request.getRequestDispatcher("/backend/feedback-list.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}
			if (task.equals("detail")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					PhanHoi e = FeedbackDAO.getById(id);
					KhachHang ctm = CustomerDAO.getById(e.getMaKhachHang());
					request.setAttribute("e", e);
					request.setAttribute("ctm", ctm.getHoTen());
					request.getRequestDispatcher("/backend/feedback-detail.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (task.equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					boolean bl = FeedbackDAO.delete(id);
					if (bl) {
						response.sendRedirect(request.getContextPath() + "/admin/feedback");
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
	}

}
