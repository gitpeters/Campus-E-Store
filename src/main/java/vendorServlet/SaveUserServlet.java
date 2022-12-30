package vendorServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.DAO;
import model.MessageReport;
import model.Vendor;

/**
 * Servlet implementation class SaveUserServlet
 */
@WebServlet("/SaveUserServlet")
public class SaveUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try(PrintWriter out = response.getWriter()) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
	        ServletFileUpload sfu  = new ServletFileUpload(factory);
	        
	        if (! ServletFileUpload.isMultipartContent(request)) {
                System.out.println("sorry. No file uploaded");
                return;
            }
	        
	        try {
				List items = sfu.parseRequest(request);
				
				FileItem name = (FileItem) items.get(0);
				String vendorName = name.getString();
				FileItem email = (FileItem) items.get(1);
				String vendorEmail = email.getString();
				FileItem id = (FileItem) items.get(2);
				String studentId = id.getString();
				FileItem pass = (FileItem) items.get(3);
				String password = pass.getString();
				FileItem tel = (FileItem) items.get(4);
				String phone = tel.getString();
				FileItem idCard = (FileItem) items.get(5);
				
				String verifiedEmail = "";
								
				String vendorID =  GenerateVendorID.vendorID();
				
				Vendor vendor = new Vendor();
				
				vendor.setVendorId(vendorID);
				vendor.setVendorName(vendorName);
				vendor.setVendorBrandName("");
				vendor.setVendorEmail(vendorEmail);
				vendor.setVendorMatricNo(studentId);
				vendor.setPosition("Vendor");
				vendor.setVendorPassword(password);
				vendor.setVendorPhone(phone);
				
				List<Vendor> vendors = DAO.getVendorByEmail(vendorEmail);
				for(Vendor vn: vendors) {
					verifiedEmail = (String)vn.getVendorEmail();
				}
				
				if(!vendorEmail.equals(verifiedEmail)) {
					if(DAO.saveVendor(vendor, idCard)==2) {
						MessageReport msg = new MessageReport("Your registration is successful", "alert", "success");
						HttpSession session = request.getSession();
						session.setAttribute("msg", msg);
						session.setAttribute("vendor", vendorID);
						response.sendRedirect("merchant-dashboard.jsp");
						
						//out.println("Record saved successfully!");
					}else {
						out.println("Something went wrong!");
					}
				}else {
					MessageReport msg = new MessageReport("Record already exist!!", "alert", "danger");
					HttpSession session = request.getSession();
					session.setAttribute("msg", msg);
					response.sendRedirect("index.jsp");
//					out.println("Record already exist!");
				}
				
				
				
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
