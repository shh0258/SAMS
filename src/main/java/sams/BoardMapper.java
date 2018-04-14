package sams;

import java.util.List;

public interface BoardMapper {
	Board selectById(int id);
	List<Board> selectAll_f(int dept_no, int board_type);
	List<Board> selectAll_i(int dept_no, int board_type);
	List<Board> toList();
	
	List<Board> selectPage(Pagination pagination);
	
	List<Board> selectPage_f(Pagination pagination);
	List<Board> selectPage_i(Pagination pagination);
    int selectCount();

	
	void update(Board board);
	void insert(Board board);
	void delete(int p_no);
}
