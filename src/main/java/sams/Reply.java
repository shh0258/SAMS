package sams;

import java.sql.Date;

public class Reply {
	int r_no;
	String r_contents;
	Date r_date;
	
	int p_no;
	int member_id;
	String r_name;
	
	Reply(){
		;
	}
	
	Reply(String contents, int p_no, int m_id, String name){
		r_contents=contents;
//		r_date=;
		
		this.p_no = p_no;
		member_id = m_id;
		r_name = name;
	}
	
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getR_contents() {
		return r_contents;
	}
	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int memper_id) {
		this.member_id = memper_id;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
}
