package vo;

import java.util.Date;

public class Mc_order {
	private int r_no;
	private String r_name;
	private String r_uname;
	private Date r_cal;
	private int r_time;
	private int r_statime;
	private int r_endtime;
	private String r_used;

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getR_uname() {
		return r_uname;
	}

	public void setR_uname(String r_uname) {
		this.r_uname = r_uname;
	}

	public Date getR_cal() {
		return r_cal;
	}

	public void setR_cal(Date r_cal) {
		this.r_cal = r_cal;
	}

	public int getR_time() {
		return r_time;
	}

	public void setR_time(int r_time) {
		this.r_time = r_time;
	}

	public int getR_statime() {
		return r_statime;
	}

	public void setR_statime(int r_statime) {
		this.r_statime = r_statime;
	}

	public int getR_endtime() {
		return r_endtime;
	}

	public void setR_endtime(int r_endtime) {
		this.r_endtime = r_endtime;
	}

	public String getR_used() {
		return r_used;
	}

	public void setR_used(String r_used) {
		this.r_used = r_used;
	}

}