package kh.spring.bab.eap.domain;

import org.springframework.stereotype.Component;

@Component
public class Spending {

	private String sp_no; // 지출번호
	private String sp_date; // 지출날짜
	private String sp_detail; // 지출내역
	private String sp_count; // 수량
	private String sp_amount; // 금액
	private String sp_pay_code; // 결제수단코드
	private String df_no; // 문서양식번호
	
	@Override
	public String toString() {
		return "Spending [sp_no=" + sp_no + ", sp_date=" + sp_date + ", sp_detail=" + sp_detail + ", sp_count="
				+ sp_count + ", sp_amount=" + sp_amount + ", sp_pay_code=" + sp_pay_code + ", df_no=" + df_no + "]";
	}
	public String getSp_no() {
		return sp_no;
	}
	public void setSp_no(String sp_no) {
		this.sp_no = sp_no;
	}
	public String getSp_date() {
		return sp_date;
	}
	public void setSp_date(String sp_date) {
		this.sp_date = sp_date;
	}
	public String getSp_detail() {
		return sp_detail;
	}
	public void setSp_detail(String sp_detail) {
		this.sp_detail = sp_detail;
	}
	public String getSp_count() {
		return sp_count;
	}
	public void setSp_count(String sp_count) {
		this.sp_count = sp_count;
	}
	public String getSp_amount() {
		return sp_amount;
	}
	public void setSp_amount(String sp_amount) {
		this.sp_amount = sp_amount;
	}
	public String getSp_pay_code() {
		return sp_pay_code;
	}
	public void setSp_pay_code(String sp_pay_code) {
		this.sp_pay_code = sp_pay_code;
	}
	public String getDf_no() {
		return df_no;
	}
	public void setDf_no(String df_no) {
		this.df_no = df_no;
	}
	
}
