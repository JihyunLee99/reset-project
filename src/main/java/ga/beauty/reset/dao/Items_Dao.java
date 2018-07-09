package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

import ga.beauty.reset.dao.entity.Items_Vo;
import ga.beauty.reset.dao.entity.Ranks_Vo;
import ga.beauty.reset.dao.entity.Reviews_Vo;

public interface Items_Dao<C> {
	
	//ranking 페이지에서만 사용
	List<C> rankAll(int type) throws SQLException;
	//ranking 상세페이지
	C selectOne(int c) throws SQLException;
	
}
