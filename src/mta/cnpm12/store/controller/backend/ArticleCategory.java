package mta.cnpm12.store.controller.backend;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.DanhMucBaiViet;
import mta.cnpm12.store.dao.ArticleCategoryDAO;

/**
 * Servlet implementation class ArticleCategory
 */
@WebServlet("/ArticleCategory")
public class ArticleCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ArticleCategory() {
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
				List<DanhMucBaiViet> list;
				try {
					list = ArticleCategoryDAO.listAll();
					request.setAttribute("list", list);
					request.getRequestDispatcher("/backend/article-category-list.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}
			if (task.equals("create")) {
				request.getRequestDispatcher("/backend/add-article-category.jsp").forward(request, response);
			}
			if (task.equals("edit")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					DanhMucBaiViet e = ArticleCategoryDAO.getById(id);
					request.setAttribute("e", e);
					request.getRequestDispatcher("/backend/edit-article-category.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (task.equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					boolean bl = ArticleCategoryDAO.delete(id);
					if (bl) {
						response.sendRedirect(request.getContextPath() + "/admin/article-category");
					}
					else{
						List<DanhMucBaiViet> list = ArticleCategoryDAO.listAll();
						request.setAttribute("list", list);
						request.setAttribute("error", "Danh mục này có chứa bài viết. Không thể xóa!");
						request.getRequestDispatcher("/backend/article-category-list.jsp").forward(request, response);
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
			DanhMucBaiViet e = new DanhMucBaiViet(name);
			boolean bl = false;
			try {
				bl = ArticleCategoryDAO.create(e);
				if (bl) {
					response.sendRedirect(request.getContextPath() + "/admin/article-category");
				} else {
					request.setAttribute("error", "Bản ghi vừa nhập đã bị trùng");
					request.getRequestDispatcher("/backend/add-article-category.jsp").forward(request, response);
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		if (task.equals("edit")) {
			String name = request.getParameter("name");
			int id = Integer.parseInt(request.getParameter("id"));
			DanhMucBaiViet e = new DanhMucBaiViet(name);
			e.setMaDanhMuc(id);
			boolean bl = false;
			try {
				bl = ArticleCategoryDAO.edit(e);
				if (bl) {
					response.sendRedirect(request.getContextPath() + "/admin/article-category");
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
