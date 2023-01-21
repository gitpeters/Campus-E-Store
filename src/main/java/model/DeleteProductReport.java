package model;

public class DeleteProductReport {
	
	private String messageTitle, messageBody, messageStatus;
	
	

	public DeleteProductReport(String messageTitle, String messageBody, String messageStatus) {
		super();
		this.messageTitle = messageTitle;
		this.messageBody = messageBody;
		this.messageStatus = messageStatus;
	}

	public String getMessageTitle() {
		return messageTitle;
	}

	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}

	public String getMessageBody() {
		return messageBody;
	}

	public void setMessageBody(String messageBody) {
		this.messageBody = messageBody;
	}

	public String getMessageStatus() {
		return messageStatus;
	}

	public void setMessageStatus(String messageStatus) {
		this.messageStatus = messageStatus;
	}
	
	

}
