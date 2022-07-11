package kh.spring.bab.mail.domain;

import org.springframework.stereotype.Component;

@Component
public class MailRcv {
	private String rec_no;
	private String rec_title;
	private String rec_content;
	private String rec_date;
	private String rec_receiver;
	private String rec_sender;
	
	@Override
	public String toString() {
		return "MailRcv [rec_no=" + rec_no + ", rec_title=" + rec_title + ", rec_content=" + rec_content + ", rec_date="
				+ rec_date + ", rec_receiver=" + rec_receiver + ", rec_sender=" + rec_sender + "]";
	}

	public String getRec_no() {
		return rec_no;
	}

	public void setRec_no(String rec_no) {
		this.rec_no = rec_no;
	}

	public String getRec_title() {
		return rec_title;
	}

	public void setRec_title(String rec_title) {
		this.rec_title = rec_title;
	}

	public String getRec_content() {
		return rec_content;
	}

	public void setRec_content(String rec_content) {
		this.rec_content = rec_content;
	}

	public String getRec_date() {
		return rec_date;
	}

	public void setRec_date(String rec_date) {
		this.rec_date = rec_date;
	}

	public String getRec_receiver() {
		return rec_receiver;
	}

	public void setRec_receiver(String rec_receiver) {
		this.rec_receiver = rec_receiver;
	}

	public String getRec_sender() {
		return rec_sender;
	}

	public void setRec_sender(String rec_sender) {
		this.rec_sender = rec_sender;
	}
	
	
}
