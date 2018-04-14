package sams;

import java.util.List;

public interface DepartmentMapper {
	List<Department> selectAll();
	Department selectById(int dept_no);
}
