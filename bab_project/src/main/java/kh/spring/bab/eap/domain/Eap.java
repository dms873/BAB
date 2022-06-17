package kh.spring.bab.eap.domain;

import org.springframework.stereotype.Component;

@Component
public class Eap {

	private String df_no;
	private String df_code;

	

	@Override
	public String toString() {
		return "Eap [df_no=" + df_no + ", df_code=" + df_code + "]";
	}

	public String getDf_no() {
		return df_no;
	}

	public void setDf_no(String df_no) {
		this.df_no = df_no;
	}

	public String getDf_code() {
		return df_code;
	}

	public void setDf_code(String df_code) {
		this.df_code = df_code;
	}
	
	
}
