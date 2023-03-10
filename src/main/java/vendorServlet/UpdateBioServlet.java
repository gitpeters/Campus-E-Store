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
 * Servlet implementation class UpdateBioServlet
 */
@WebServlet("/UpdateBioServlet")
public class UpdateBioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			
			HttpSession session = request.getSession();
			Vendor vn = (Vendor) session.getAttribute("vendor");
			String email = vn.getVendorEmail();
		String vendorPhone= request.getParameter("vendor_phone");
		String vendorBrandName = request.getParameter("vendor_brand_name");
		
		Vendor vendor = new Vendor();
		
		vendor.setVendorBrandName(vendorBrandName);
		vendor.setVendorEmail(email);
		vendor.setVendorPhone(vendorPhone);
		
		try {
			
			if(DAO.updateVendorInfo(vendor)==1) {
				MessageReport msg = new MessageReport("Updated successfully", "alert", "success");
				session.setAttribute("report", msg);
				response.sendRedirect("settings.jsp");
				out.println("Updated record successfully..");
			}else {
				MessageReport msg = new MessageReport("Something went wrong", "alert", "danger");
				session.setAttribute("report", msg);
				response.sendRedirect("settings.jsp");
				out.println("Something went wrong");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
	}

}
