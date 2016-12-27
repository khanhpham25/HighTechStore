package mta.cnpm12.store.controller.frontend;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.ChiTietDonHang;
import mta.cnpm12.store.beans.DonHang;
import mta.cnpm12.store.beans.GioHang;
import mta.cnpm12.store.beans.KhachHang;
import mta.cnpm12.store.beans.MauSac;
import mta.cnpm12.store.beans.SanPham;
import mta.cnpm12.store.dao.ColorDAO;
import mta.cnpm12.store.dao.CustomerDAO;
import mta.cnpm12.store.dao.OrderFormDAO;
import mta.cnpm12.store.dao.ProductDAO;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Cart() {
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
		String prodid = "";
		String colorid = "";
		if (request.getParameter("prodid") != null) {
			prodid = request.getParameter("prodid");
		}
		if (request.getParameter("colorid") != null) {
			colorid = request.getParameter("colorid");
		}
		if (prodid != null && colorid != null && request.getParameter("quantity") != null) {
			try {
				SanPham prod = ProductDAO.getById(Integer.parseInt(prodid));
				MauSac color = ColorDAO.getById(Integer.parseInt(colorid));
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				int cartid = Integer.parseInt(prodid) * Integer.parseInt(colorid)
						* (Integer.parseInt(prodid) + Integer.parseInt(colorid));
				GioHang cart = new GioHang(cartid, prod, color, quantity);
				Object session = request.getSession().getAttribute("cart");
				if (session == null) {
					ArrayList<GioHang> list = new ArrayList<>();
					list.add(cart);
					request.getSession().setAttribute("cart", list);
				} else {
					ArrayList<GioHang> list = (ArrayList<GioHang>) session;
					boolean checkExists = false;
					for (GioHang item : list) {
						if (item.getSanPham().getMaSP() == Integer.parseInt(prodid) && item.getMauSac().getMaMau() == Integer.parseInt(colorid)) {
							item.setSoLuong(item.getSoLuong() + quantity);
							checkExists = true;
						}
					}
					if (checkExists == false) {
						list.add(cart);
					}
					request.getSession().removeAttribute("cart");
					request.getSession().setAttribute("cart", list);
				}
			} catch (NumberFormatException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(request.getParameter("cartid") != null){
			int cartid = Integer.parseInt(request.getParameter("cartid"));
			String quantity = request.getParameter("quantity");
			if(quantity == null){
				GioHang entity = null;
				ArrayList<GioHang> list = (ArrayList<GioHang>) request.getSession().getAttribute("cart");
				for(GioHang item : list){
					if(item.getMaGioHang() == cartid){
						entity = item;
					}
				}
				list.remove(entity);
				request.getSession().removeAttribute("cart");
				request.getSession().setAttribute("cart", list);
			}
			else{
				ArrayList<GioHang> list = (ArrayList<GioHang>) request.getSession().getAttribute("cart");
				for(GioHang item : list){
					if(item.getMaGioHang() == cartid){
						item.setSoLuong((Integer.parseInt(quantity))/10);
					}
				}
				request.getSession().removeAttribute("cart");
				request.getSession().setAttribute("cart", list);
			}
		}
		if(request.getParameter("delete") != null){
			if(Boolean.parseBoolean(request.getParameter("delete")) == true){
				request.getSession().removeAttribute("cart");
			}
		}

		request.getRequestDispatcher("/frontend/shopping-cart.jsp").forward(request, response);
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
		ArrayList<GioHang> list = (ArrayList<GioHang>) request.getSession().getAttribute("cart");
		if(list != null){
			KhachHang clientLogin = (KhachHang) request.getSession().getAttribute("clientLogin");
			if(clientLogin != null){
				String note = request.getParameter("txtnote");
				Date date = new Date(System.currentTimeMillis());
				DonHang orderForm = new DonHang(date, false, note, clientLogin.getMaKhachHang());
				try {
					OrderFormDAO.create(orderForm);
					int orderFormId = OrderFormDAO.maxId();
					for (GioHang item : list) {
						double price = item.getSanPham().getGiaSP();
						if(item.getSanPham().getGiaKhuyenMai() != 0){
							price = item.getSanPham().getGiaKhuyenMai();
						}
						ChiTietDonHang orderFormDetail = new ChiTietDonHang(orderFormId, item.getSanPham().getMaSP(), item.getMauSac().getMaMau(), price, item.getSoLuong());
						boolean bl = false;
						OrderFormDAO.createOrderFormDetail(orderFormDetail);						
					}
					response.sendRedirect(request.getContextPath() + "/order-success");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				String name = request.getParameter("txtName");
				String address = request.getParameter("txtAddress");
				String phone = request.getParameter("txtPhone");
				String email = request.getParameter("txtEmail");
				String note = request.getParameter("txtNote");
				KhachHang customer = new KhachHang(name, address, phone, email, true, null, null, false);
				try {
					CustomerDAO.create(customer);
					int customerId = CustomerDAO.maxId();
					Date date = new Date(System.currentTimeMillis());
					DonHang orderForm = new DonHang(date, false, note, customerId);
					OrderFormDAO.create(orderForm);
					int orderFormId = OrderFormDAO.maxId();
					for (GioHang item : list) {
						double price = item.getSanPham().getGiaSP();
						if(item.getSanPham().getGiaKhuyenMai() != 0){
							price = item.getSanPham().getGiaKhuyenMai();
						}
						ChiTietDonHang orderFormDetail = new ChiTietDonHang(orderFormId, item.getSanPham().getMaSP(), item.getMauSac().getMaMau(), price, item.getSoLuong());
						OrderFormDAO.createOrderFormDetail(orderFormDetail);
					}
					response.sendRedirect(request.getContextPath() + "/order-success");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		else{
			response.sendRedirect(request.getContextPath() + "/cart");
		}
		
	}

}
