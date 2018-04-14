package sams;

import java.util.List;

public interface ReplyMapper {
	List<Reply> toList(int where);
	void update(Reply reply);
	void insert(Reply reply);
	
	void delete(int what);
}
