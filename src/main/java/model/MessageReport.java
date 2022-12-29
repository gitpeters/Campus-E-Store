package model;

public class MessageReport {
	
	private String messageContent, messageType, messageColor;

	
	public MessageReport(String messageContent, String messageType, String messageColor) {
		super();
		this.messageContent = messageContent;
		this.messageType = messageType;
		this.messageColor = messageColor;
	}

	public MessageReport() {
		super();
	}

	public String getMessageContent() {
		return messageContent;
	}

	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public String getMessageColor() {
		return messageColor;
	}

	public void setMessageColor(String messageColor) {
		this.messageColor = messageColor;
	}
	
	

}
