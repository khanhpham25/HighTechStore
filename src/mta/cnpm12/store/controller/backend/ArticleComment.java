package mta.cnpm12.store.controller.backend;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.BaiViet;
import mta.cnpm12.store.beans.BinhLuanBaiViet;
import mta.cnpm12.store.dao.ArticleCommentDAO;
import mta.cnpm12.store.dao.ArticleDAO;

/**
 * Servlet implementation class ArticleComment
 */
@WebServlet("/ArticleComment")
public class ArticleComment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticleComment() {
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
				List<BinhLuanBaiViet> list;
				try {
					list = ArticleCommentDAO.listAll();
					request.setAttribute("list", list);
					request.getRequestDispatcher("/backend/article-comment-list.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}
			if (task.equals("edit")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					BinhLuanBaiViet e = ArticleCommentDAO.getById(id);
					request.setAttribute("e", e);
					List<BaiViet> ds = ArticleDAO.listAll();
					request.setAttribute("ds", ds);
					request.getRequestDispatcher("/backend/edit-article-comment.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (task.equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					boolean bl = ArticleCommentDAO.delete(id);
					if (bl) {
						response.sendRedirect(request.getContextPath() + "/admin/article-comment");
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
			String content = request.getParameter("content");
			Boolean status = Boolean.parseBoolean(request.getParameter("status"));
			int article = Integer.parseInt(request.getParameter("article"));
			BinhLuanBaiViet e = new BinhLuanBaiViet(id, name, null, content, status, article);
			boolean bl = false;
			try {
				bl = ArticleCommentDAO.edit(e);
				if (bl) {
					response.sendRedirect(request.getContextPath() + "/admin/article-comment");
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
