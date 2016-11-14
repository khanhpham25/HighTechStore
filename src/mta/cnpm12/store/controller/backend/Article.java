package mta.cnpm12.store.controller.backend;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import mta.cnpm12.store.beans.BaiViet;
import mta.cnpm12.store.beans.DanhMucBaiViet;
import mta.cnpm12.store.dao.ArticleCategoryDAO;
import mta.cnpm12.store.dao.ArticleDAO;

/**
 * Servlet implementation class Article
 */
@WebServlet("/Article")
public class Article extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Article() {
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
				List<BaiViet> list;
				try {
					list = ArticleDAO.listAll();
					request.setAttribute("list", list);
					request.getRequestDispatcher("/backend/article-list.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}
			if (task.equals("create")) {
				try {
					List<DanhMucBaiViet> ds = ArticleCategoryDAO.listAll();
					request.setAttribute("ds", ds);
					request.getRequestDispatcher("/backend/add-article.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (task.equals("edit")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					BaiViet e = ArticleDAO.getById(id);
					request.setAttribute("e", e);
					List<DanhMucBaiViet> ds = ArticleCategoryDAO.listAll();
					request.setAttribute("ds", ds);
					request.getRequestDispatcher("/backend/edit-article.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (task.equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					boolean bl = ArticleDAO.delete(id);
					if (bl) {
						response.sendRedirect(request.getContextPath() + "/admin/article");
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
		MultipartRequest multi=new MultipartRequest(request,".",10*1024*1024,"UTF-8");
		String task = "";
		if (multi.getParameter("task") != null) {
			task = multi.getParameter("task");
		}
		if (task.equals("create")) {
			String title = multi.getParameter("title");
			String desc = multi.getParameter("desc");
			File file=multi.getFile("img");
			String savefolder = getServletContext().getInitParameter("file-upload");
			file.renameTo(new File(savefolder,file.getName()));
			String img = file.getName();
			Date date = new Date(System.currentTimeMillis());
			String content = multi.getParameter("content");
			Boolean status = Boolean.parseBoolean(multi.getParameter("status"));
			int cate = Integer.parseInt(multi.getParameter("cate"));
			BaiViet e = new BaiViet(0, title, desc, img, date, content, status, cate);
			boolean bl = false;
			try {
				bl = ArticleDAO.create(e);
				if (bl) {
					response.sendRedirect(request.getContextPath() + "/admin/article");
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		if (task.equals("edit")) {
			String title = multi.getParameter("title");
			String desc = multi.getParameter("desc");
			Date date = new Date(System.currentTimeMillis());
			String content = multi.getParameter("content");
			Boolean status = Boolean.parseBoolean(multi.getParameter("status"));
			int cate = Integer.parseInt(multi.getParameter("cate"));
			int id = Integer.parseInt(multi.getParameter("id"));
			BaiViet e = new BaiViet(id, title, desc, "", date, content, status, cate);
			boolean bl = false;
			try {
				bl = ArticleDAO.edit(e);
				if (bl) {
					response.sendRedirect(request.getContextPath() + "/admin/article");
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

}
