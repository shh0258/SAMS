package sams;

public class Board {
	int p_no;
	int dept_no;
	int board_type;
	
	String title;
	String p_contents;
	String p_date;
	String ufile;
	int hits;
	
	int member_id;
	String p_name;
	
	Board(){}
	void setToUpdate(int id, String title, String p_contents, String ufile){
		p_no = id;
		this.title = title;
		this.p_contents = p_contents;
		this.ufile = ufile;
	}
	Board(int department, int board_type, String title, String p_contents, String ufile , int membar_id, String p_name){
		dept_no=department;
		this.board_type=board_type;
		this.title = title;
		this.p_contents = p_contents;
		this.ufile = ufile;
	}
	
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getP_contents() {
		return p_contents;
	}
	public void setP_contents(String p_contents) {
		this.p_contents = p_contents;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public String getUfile() {
		return ufile;
	}
	public void setUfile(String ufile) {
		this.ufile = ufile;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int menmer_id) {
		this.member_id = menmer_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	
}
