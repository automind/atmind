package org.zerock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao{

	@Inject
	private SqlSession session;
	
	private String ns = "org.zerock.mapper.ReplyMapper";
	
	@Override
	public List<ReplyDto> list(int bno) throws Exception {
		return session.selectList(ns + ".list", bno);
	}

	@Override
	public void create(ReplyDto rDto) throws Exception {
		session.insert(ns + ".create",  rDto);
	}

	@Override
	public void update(ReplyDto rDto) throws Exception {
		session.update(ns + ".update", rDto);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		session.delete(ns + ".delete", rno);
	}

	@Override
	public List<ReplyDto> listPage(Integer bno, Criteria cri) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		
		paramMap.put("bno", bno);
		paramMap.put("cri", cri);
		
		return session.selectList(ns + ".listPage", paramMap);
	}

	@Override
	public int count(Integer bno) throws Exception {
		return session.selectOne(ns + ".count", bno);
	}

}
