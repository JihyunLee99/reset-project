package ga.beauty.reset.utils.runner;

import java.util.List;

import org.springframework.stereotype.Component;

@Component(value="mag_Lsn")
public class Magzine_Listener implements Common_Listener{

	// 어떤 글이냐?
	// 좋아요 총량 / 일별 증가량
	// 조회수 총량 / 일별 증가량
	// 댓글 총량 / 일별 증가량
	
	@Override
	public void addLog() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public <T> List<T> getLogsAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public <T> List<T> getLogsWithCount(int recentIdx, int counts) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveLogOneday() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}
	
}