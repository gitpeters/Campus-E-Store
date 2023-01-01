package productServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
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
import model.Product;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try(PrintWriter out = response.getWriter()) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
	        ServletFileUpload sfu  = new ServletFileUpload(factory);
	        
	        if (! ServletFileUpload.isMultipartContent(request)) {
                System.out.println("sorry. No file uploaded");
                return;
            }
	        
	        try {
	        	List items = sfu.parseRequest(request);
				
				FileItem productName = (FileItem) items.get(0);
				String prodName = productName.getString();
				FileItem productAmount = (FileItem) items.get(1);
				String prodAmt = productAmount.getString();
				FileItem VendorId = (FileItem) items.get(2);
				String vendId = VendorId.getString();
				FileItem productStatus = (FileItem) items.get(3);
				String prodStatus = productStatus.getString();
				FileItem productCondition = (FileItem) items.get(4);
				String prodCond = productCondition.getString();
				FileItem searchKeyword = (FileItem) items.get(5);
				String searchWord = searchKeyword.getString();
				FileItem productDescription = (FileItem) items.get(6);
				String prodDes = productDescription.getString();
				FileItem productImage1 = (FileItem) items.get(7);
				FileItem productImage2 = (FileItem) items.get(8);
				FileItem productImage3 = (FileItem) items.get(9);
				
				LocalDate date = LocalDate.now();
				
				String productId = productIdGenerator.productId(prodName);
				String datePosted = date.toString();
				String adsStatus = "";
				String brandName = "";
			
				
				Product product = new Product();
				product.setProductName(prodName);
				product.setProductDescription(prodDes);
				product.setVendorId(vendId);
				product.setProductStatus(prodStatus);
				product.setProductCondition(prodCond);
				product.setKeywords(searchWord);
				product.setProductId(productId);
				product.setDatePosted(datePosted);
				product.setAdsStatus(adsStatus);
				product.setBrandName(brandName);
				product.setProductAmount(Double.parseDouble(prodAmt));
				
				if (DAO.addProduct(product, productImage1, productImage2, productImage3) == 1) {
					MessageReport msg = new MessageReport("Product added successfully", "alert", "success");
					HttpSession session = request.getSession();
					session.setAttribute("report", msg);
					response.sendRedirect("add-product.jsp");
				}else if(DAO.addProduct(product, productImage1, productImage2, productImage3)==0) {
					MessageReport msg = new MessageReport("", "", "");
					HttpSession session = request.getSession();
					session.setAttribute("report", msg);
					response.sendRedirect("add-product.jsp");
				}
				
				else {
					MessageReport msg = new MessageReport("Could not add product. Try again", "alert", "danger");
					HttpSession session = request.getSession();
					session.setAttribute("report", msg);
					response.sendRedirect("add-product.jsp");
				}
				
	        	
	        }catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
		}
	}

	private double perseDouble(String prodAmt) {
		// TODO Auto-generated method stub
		return 0;
	}

}
