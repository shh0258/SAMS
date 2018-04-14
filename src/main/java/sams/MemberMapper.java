package sams;

import java.util.List;

public interface MemberMapper {
		 List<Member> selectAll();
		 Member selectById(int id);
		 Member selectByPhoneId(String phone_number_id);
		 Member selectByPword(String pword);
		 List<Member> selectByDept_no(int no);
		 
		 List<Member> selectByBatch(int dept_no, int batch);
		 List<Member> selectBatch();
		 
		 List<Member> selectPage(Pagination pagination);
		 
		void update(Member member);
		void delete(int member_id);
		
		void updatePhoneChange(int member_id);
		void updatePhoneNum(Member member);
}