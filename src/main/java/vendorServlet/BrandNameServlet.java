package vendorServlet;

import java.io.IOException;
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
 * Servlet implementation class BrandNameServlet
 */
@WebServlet("/BrandNameServlet")
public class BrandNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BrandNameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vendorBrandName = request.getParameter("vendor_brand_name");
		HttpSession session = request.getSession();
		Vendor vn = (Vendor) session.getAttribute("vendor");
		String email = vn.getVendorEmail();
		Vendor vendor = new Vendor();
		System.out.println("Vendor Email::"+vn.getVendorEmail());
		vendor.setVendorBrandName(vendorBrandName);
		vendor.setVendorEmail(email);
		
		try {
			
			if(DAO.changeBrandName(vendor)==1) {
				MessageReport msg = new MessageReport("Changed Brand Name successfully", "alert", "success");
				
				session.setAttribute("report", msg);
				response.sendRedirect("settings.jsp");
			}else {
				MessageReport msg = new MessageReport("Something went wrong", "alert", "danger");
				session = request.getSession();
				session.setAttribute("report", msg);
				response.sendRedirect("settings.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
