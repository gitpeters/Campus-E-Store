package vendorServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import model.MessageReport;
import model.Vendor;

/**
 * Servlet implementation class ChangePasswordServlet
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			HttpSession session = request.getSession();
			Vendor ven = (Vendor) session.getAttribute("vendor");
			String email = ven.getVendorEmail();
			String oldPassword = request.getParameter("old_password");
			String newPassword = request.getParameter("new_password");
		
			
			Vendor vn = new Vendor();
			vn.setVendorEmail(email);
			vn.setVendorPassword(newPassword);
			Vendor vendor = DAO.getVendorPassword(email);
			
			if(oldPassword.equals(vendor.getVendorPassword())) {
				DAO.changeVendorPassword(vn);
				MessageReport msg = new MessageReport("Password changed successfully", "alert", "success");
				session.setAttribute("report", msg);
				response.sendRedirect("settings.jsp");
			}else {
				MessageReport msg = new MessageReport("Old password does not match. Try again", "alert", "danger");
				session.setAttribute("report", msg);
				response.sendRedirect("settings.jsp");	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
