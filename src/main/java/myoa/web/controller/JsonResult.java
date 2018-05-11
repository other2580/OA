package myoa.web.controller;

public class JsonResult {
	public JsonResult() {
		
	}
	public JsonResult(boolean success, String message) {
		super();
		this.success = success;
		this.message = message;
	}
	private boolean success;
	private String message;
	public boolean getSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
