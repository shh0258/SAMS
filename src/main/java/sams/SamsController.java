package sams;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SamsController {
	@Autowired
	BoardMapper boardMapper;

	@Autowired
	MemberMapper memberMapper;

	@Autowired
	ReplyMapper replyMapper;
	
	@Autowired
	DepartmentMapper departmentMapper;

	@Autowired
	Change_requireMapper change_requireMapper;
	
	@Autowired
	MemberService memberService;

	@RequestMapping("/login.do")
	public String login(Model model) {
		return "login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String afterLogin( Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/site/main.do", method = RequestMethod.POST)
	public String main(@RequestParam("id") int member_id, @RequestParam("department") int dept_no, Model model){

		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);

		member.setPhone_number_id(change_requireMapper.selectByMemberId(member_id).getPhone_number());
		memberMapper.updatePhoneNum(member);
		change_requireMapper.delete(member_id);
		
		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		model.addAttribute("department", dept_no);
		model.addAttribute("fin","fin");
		
		return "site/main";
	}

	@RequestMapping(value = "/site/main.do", method = RequestMethod.GET)
	public String main(@RequestParam("department") int dept_no, Model model) {
		
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);
		
		if (member.getDept_no() != dept_no){
			if (member.getDept_no() == 1) {
				model.addAttribute("admin","page");
			}
			else{
				dept_no=member.getDept_no();
				model.addAttribute("err","cannot");
			}
		}
		
		if(member.isPhone_change()){
			if(change_requireMapper.selectByMemberId(member.getMember_id()).getPermission()==1){
				model.addAttribute("phoneChangeCheck","pass");
			}
		}

		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		model.addAttribute("department", dept_no);

		return "site/main";
	}

	@RequestMapping(value="/site/boardList.do", method = RequestMethod.GET)
	public String boardList(@RequestParam("department") int dept_no, @RequestParam("where") int board_type,
			Pagination pagination, Model model) {
		model.addAttribute("title", (board_type == 1) ? "공지사항" : "자유게시판");

		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);

		pagination.setRecordCount(boardMapper.selectCount());
		pagination.setDepartment(dept_no);
		pagination.setBoard_type(board_type);

		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		
		model.addAttribute("department", dept_no);
		model.addAttribute("where", board_type);
		model.addAttribute("list", boardMapper.selectPage(pagination));

		return "site/list";
	}
//	@RequestMapping(value = "/site/boardList.do", method = RequestMethod.POST)
//	public String boardList(@RequestParam("department") int dept_no, @RequestParam("where") int board_type, int id,
//			Pagination pagination, Model model) {
//		
//		boardMapper.delete(id);
//		
//		model.addAttribute("title", (board_type == 1) ? "공지사항" : "자유게시판");
//
//		Member member = memberService.getCurrentMember();
//		model.addAttribute("member",member);
//
//		pagination.setRecordCount(boardMapper.selectCount());
//		pagination.setDepartment(dept_no);
//		pagination.setBoard_type(board_type);
//
//		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
//		
//		model.addAttribute("department", dept_no);
//		model.addAttribute("where", board_type);
//		model.addAttribute("list", boardMapper.selectPage(pagination));
//
//		model.addAttribute("fin","ok");
//		
//		return "site/list";
//	}

	@RequestMapping(value = "/site/board.do", method = RequestMethod.GET)
	public String board(@RequestParam("department") int dept_no, int id, Model model) {
		Board board = boardMapper.selectById(id);

		model.addAttribute("title", (board.board_type == 1) ? "공지사항" : "자유게시판");

		board.setHits(board.getHits() + 1);
		boardMapper.update(board);

		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);

		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		
		model.addAttribute("board", board);
		model.addAttribute("list", replyMapper.toList(id));
		model.addAttribute("department", dept_no);

		return "site/board";
	}

	@RequestMapping(value = "/site/board.do", method = RequestMethod.POST)
	public String reply(@RequestParam("department") int dept_no, String what, int id, String temp, Model model) {
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);

		Board board = boardMapper.selectById(id);
		model.addAttribute("board", board);
		model.addAttribute("department", board.getDept_no());

		model.addAttribute("title", (board.board_type == 1) ? "공지사항" : "자유게시판");

		if (what.compareTo("delete") == 0)
			replyMapper.delete(Integer.parseInt(temp));
		else if(what.compareTo("board")==0){
			boardMapper.delete(id);
			return "site/list";
		}
		else {
			Reply reply = new Reply(temp, id, member.getMember_id(), member.getName());
			replyMapper.insert(reply);
		}

		model.addAttribute("dName",departmentMapper.selectById(board.getDept_no()).getDept_name());
		model.addAttribute("board", board);
		model.addAttribute("list", replyMapper.toList(id));
		model.addAttribute("department",dept_no);

		return "site/board";
	}

	@RequestMapping(value = "/site/boardEdit.do", method = RequestMethod.GET)
	public String boardEdit(int where, @RequestParam("department") int dept_no, int id, Model model) {

		Board board=new Board();
		
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);
		
		board = boardMapper.selectById(id);
		model.addAttribute("board", board);

		model.addAttribute("id", id);
		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		model.addAttribute("department",board.getDept_no());
		return "site/boardEdit";
	}

	@RequestMapping(value = "/site/boardEdit.do", method = RequestMethod.POST)
	public String boardEdit(int where, @RequestParam("department") int dept_no, int id, String p_contents, Board board, Model model) {

		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);

		Board before = boardMapper.selectById(id);
		
		before.setDept_no(dept_no);
		before.setBoard_type(where);
		before.setP_contents(board.getP_contents());
		before.setTitle(board.getTitle());
		before.setUfile(board.getUfile());
		
		
		boardMapper.update(before);
		
		model.addAttribute("success", "저장했습니다.");
		
		model.addAttribute("board",board);
		model.addAttribute("title", (board.board_type == 1) ? "공지사항" : "자유게시판");
		model.addAttribute("where", where);
		model.addAttribute("department",dept_no);
		return "site/boardEdit";
	}
	
	@RequestMapping(value = "/site/boardNew.do", method = RequestMethod.GET)
	public String boardNew(int where, @RequestParam("department") int dept_no, Model model) {

		Board board=new Board();
		
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);
		
		model.addAttribute("department", dept_no);
		model.addAttribute("where", where);
		model.addAttribute("title", (where == 1) ? "공지사항" : "자유게시판");
		
		model.addAttribute("board",board);

		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		model.addAttribute("department",board.getDept_no());
		return "site/boardEdit";
	}
	
	@RequestMapping(value = "/site/boardNew.do", method = RequestMethod.POST)
	public String boardNew(int where, @RequestParam("department") int dept_no, Board board, Model model) {

		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);

		board.setP_name(member.getName());
		board.setMember_id(member.getMember_id());
		board.setDept_no(dept_no);
		board.setBoard_type(where);
		boardMapper.insert(board);
		model.addAttribute("success", "저장했습니다.");
		
		model.addAttribute("dName",departmentMapper.selectById(board.getDept_no()).getDept_name());
		
		model.addAttribute("board",board);
		model.addAttribute("title", (board.board_type == 1) ? "공지사항" : "자유게시판");
		model.addAttribute("where", board.board_type);
		model.addAttribute("department",dept_no);
		return "site/boardEdit";
	}

	@RequestMapping("/site/autoList.do") // Controller받으면 바로 넣어서 작동
	public String autoList(@RequestParam("batch") int batch, @RequestParam("department") int dept_no, String search, Model model) {
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);

		Pagination pagination = new Pagination();
		pagination.setBatch(batch);
		if(search!=null && !search.isEmpty())
			pagination.setSearch(search);
		model.addAttribute("list", memberMapper.selectPage(pagination));
		model.addAttribute("batchList", memberMapper.selectBatch());

		
		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		
		model.addAttribute("department", dept_no);
		model.addAttribute("batch", batch);

		return "site/autoList";
	}

	@RequestMapping("/site/autoListExe.do")
	public String autoListExe(@RequestParam("department") int dept_no, Model model) {
		// model.addAttribute("department", dept_no);
		
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);
		
		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		
		model.addAttribute("list", memberMapper.selectByDept_no(dept_no));
		model.addAttribute("department", dept_no);
		return "site/autoListExe";
	}
	
	@RequestMapping(value = "/site/info.do", method = RequestMethod.GET)
	public String info(@RequestParam("department") int dept_no, @RequestParam("id") int member_id, Model model) {
		Member member = memberMapper.selectById(member_id);
		model.addAttribute("member", member);

		model.addAttribute("dName",(departmentMapper.selectById(member.getDept_no())).getDept_name());
		
		model.addAttribute("department", dept_no);
		model.addAttribute("id", member_id);

		return "site/info";
	}

	@RequestMapping(value = "/site/memberEdit.do", method = RequestMethod.GET)
	public String memberEdit(@RequestParam("department") int dept_no, Model model) {
		Member member = memberService.getCurrentMember();
		model.addAttribute("member", member);
		model.addAttribute("dName",departmentMapper.selectById(member.getDept_no()).getDept_name());
		
		if(member.isPhone_change()){
			model.addAttribute("wait","needAdminCheck");
		}
		
		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		model.addAttribute("department", dept_no);
		model.addAttribute("id", member.getMember_id());
		
		return "site/memberEdit";
	}

	@RequestMapping(value = "/site/memberEdit.do", method = RequestMethod.POST)
	public String memberEdit(@RequestParam("department") int dept_no, String name,
			String phone_number_id, String email, String w_tel, String work, String w_position, Model model) {
		Member member = memberService.getCurrentMember();

		if (!name.isEmpty())
			member.setName(name);
		if (!email.isEmpty())
			member.setEmail(email);
		if (!w_tel.isEmpty())
			member.setW_tel(w_tel);
		if (!work.isEmpty())
			member.setWork(work);
		if (!name.isEmpty())
			member.setW_position(w_position);

		if(member.getPhone_number_id().compareTo(phone_number_id)!=0){
			model.addAttribute("wait","needAdminCheck");

			Change_require change_require = new Change_require();
			change_require.setMember_id(member.getMember_id());
			change_require.setPhone_number(phone_number_id);
			
			change_requireMapper.insert(change_require);
			memberMapper.updatePhoneChange(member.getMember_id());
		}

		memberMapper.update(member);
		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		model.addAttribute("department", dept_no);
		model.addAttribute("member",member);
		

		return "site/memberEdit";
	}

	 @RequestMapping(value="/admin/main.do", method=RequestMethod.GET)
	 public String adminMain(Model model){
	
	 Member member = memberService.getCurrentMember();
	 model.addAttribute("member",member);
		
	 model.addAttribute("department",member.getDept_no());
	
	 return "admin/main";
	 }

	// 비밀번호 승인
	@RequestMapping(value = "/admin/grantId.do", method = RequestMethod.GET)
	public String grantId(Model model) {
		model.addAttribute("list", change_requireMapper.selectAll());
		
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);
		
		return "admin/grantId";
	}
	@RequestMapping(value = "/admin/grantId.do", method = RequestMethod.POST)
	public String grantIdAdminCheck(@RequestParam("id") int member_id, Model model) {

		Change_require require = change_requireMapper.selectByMemberId(member_id);
		change_requireMapper.update_perChecked(require);
		
		model.addAttribute("list", change_requireMapper.selectAll());
		
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);
		
		return "admin/grantId";
	}
	 
	//excel 파일 입력
	@RequestMapping("/admin/excel.do")
	public String exel(Model model){
		
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);
		
		return "admin/excel_form";
	}

	//excel 파일 결과
	@RequestMapping("/admin/result.do")
	public String result(Model model){
		
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);
		
		return "admin/excel_insert";
	}
	
	@RequestMapping("/site/hello.do")
	public String hello(@RequestParam("department") int dept_no, Model model){
		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		model.addAttribute("department", dept_no);
		
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);
		
		return "site/hello";
	}
	@RequestMapping("/site/jojik.do")
	public String jojik(@RequestParam("department") int dept_no, Model model){
		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		model.addAttribute("department", dept_no);
		
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);
		
		return "site/jojik";
	}
	
	@RequestMapping("/site/saup.do")
	public String saup(@RequestParam("department") int dept_no, Model model){
		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		model.addAttribute("department", dept_no);
		
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);
		
		return "site/saup";
	}
	@RequestMapping("/site/path.do")
	public String path(@RequestParam("department") int dept_no, Model model){
		model.addAttribute("dName",departmentMapper.selectById(dept_no).getDept_name());
		model.addAttribute("department", dept_no);
		
		Member member = memberService.getCurrentMember();
		model.addAttribute("member",member);
		
		return "site/path";
	}
}
