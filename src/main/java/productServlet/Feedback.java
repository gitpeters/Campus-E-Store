package productServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import model.FeedbackModel;

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
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		GenerateFeedbackID feedbackID = new GenerateFeedbackID();
		
		PrintWriter out = response.getWriter();
		String feedback = request.getParameter("feedback");
		String feedbackStatus = request.getParameter("feedbackStatus");
		String vendorID = request.getParameter("vendorID");
		String productID = request.getParameter("productID");
		String feedbackId = feedbackID.feedbackID();
		FeedbackModel fdb = new FeedbackModel();
		
		fdb.setFeedback(feedback);
		fdb.setFeedbackStatus(feedbackStatus);
		fdb.setProductId(productID);
		fdb.setVendorId(vendorID);
		fdb.setFeedbackId(feedbackId);
		
		if(DAO.feedbackModel(fdb) == 1) {
			out.println("Your Feedback has been Submitted!");
			System.out.println("Your Feedback has been Submitted!");
		}else {
			out.println("Somthing went wrong, Kindly try again.");
			System.out.println("Somthing went wrong, Kindly try again.");
		}
		
	}

}
