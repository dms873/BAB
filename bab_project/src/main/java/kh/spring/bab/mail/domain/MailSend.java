package kh.spring.bab.mail.domain;

import org.springframework.stereotype.Component;

@Component
public class MailSend {
	private String send_no;
	private String send_title;
	private String send_content;
	private String send_date;
	private String send_receiver;
	private String send_sender;
	
	@Override
	public String toString() {
		return "Mail [send_no=" + send_no + ", send_title=" + send_title + ", send_content=" + send_content
				+ ", send_date=" + send_date + ", send_receiver=" + send_receiver + ", send_sender=" + send_sender
				+ "]";
	}

	public String getSend_no() {
		return send_no;
	}

	public void setSend_no(String send_no) {
		this.send_no = send_no;
	}

	public String getSend_title() {
		return send_title;
	}

	public void setSend_title(String send_title) {
		this.send_title = send_title;
	}

	public String getSend_content() {
		return send_content;
	}

	public void setSend_content(String send_content) {
		this.send_content = send_content;
	}

	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	public String getSend_receiver() {
		return send_receiver;
	}

	public void setSend_receiver(String send_receiver) {
		this.send_receiver = send_receiver;
	}

	public String getSend_sender() {
		return send_sender;
	}

	public void setSend_sender(String send_sender) {
		this.send_sender = send_sender;
	}
	
	
}
