package sams;

import java.util.List;

public interface Change_requireMapper {
	List<Change_require> selectAll();
	Change_require selectByMemberId(int member_id);
	
	void insert(Change_require change_require);
	void delete(int member_id);
	
	void update_perChecked(Change_require change_require);
}
