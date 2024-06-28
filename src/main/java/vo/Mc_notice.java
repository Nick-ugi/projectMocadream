package vo;

import java.util.Date;

public class Mc_notice {
	private int nt_no;
	private String nt_title;
	private String nt_content;
	private String nt_writer;
	private Date nt_date;

	public int getNt_no() {
		return nt_no;
	}

	public void setNt_no(int nt_no) {
		this.nt_no = nt_no;
	}

	public String getNt_title() {
		return nt_title;
	}

	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}

	public String getNt_content() {
		return nt_content;
	}

	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}

	public String getNt_writer() {
		return nt_writer;
	}

	public void setNt_writer(String nt_writer) {
		this.nt_writer = nt_writer;
	}

	public Date getNt_date() {
		return nt_date;
	}

	public void setNt_date(Date nt_date) {
		this.nt_date = nt_date;
	}
}