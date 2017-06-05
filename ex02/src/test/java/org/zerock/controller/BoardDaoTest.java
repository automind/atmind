package org.zerock.controller;



import java.util.List;

//import java.util.logging.Logger;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVo;
import org.zerock.domain.Criteria;
import org.zerock.persistence.BoardDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDaoTest {
	
	@Inject
	private BoardDao dao;
	
	private static Logger logger = LoggerFactory.getLogger(BoardDaoTest.class);
	
	@Test
	public void testCreate() throws Exception{
		BoardVo board = new BoardVo();
		board.setTitle("새로운 글을 넣습니다.");
		board.setContent("새로운 글을 넣습니다.");
		board.setWriter("user00");
		dao.create(board);
	}	
	@Test
	public void testRead() throws Exception{
		logger.info(dao.read(1).toString());
		
	}
	
	@Test
	public void testUpdate() throws Exception{
		BoardVo board = new BoardVo();
		board.setBno(1);
		board.setTitle("수정된 글입니다.");
		board.setContent("수정 테스트");
		dao.update(board);
	}
	
//	@Test
	public void testDelete() throws Exception {
		dao.delete(1);
	}
	
	@Test
	public void testListPage()throws Exception{
		int page=3;
		
		List<BoardVo> list = dao.listPage(page);
		
		for(BoardVo boardVo : list){
			logger.info(boardVo.getBno()+":"+boardVo.getTitle());
		}
		
	/*@Test
	public void testListCriteria()throws Exception{
		Criteria cri= new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);
		
		List<BoardVo> list = dao.listCriteria(cri);
		
		for(BoardVo boardVo : list){
			logger.info(boardVo.getBno()+":"+boardVo.getTitle());
		}
	}*/
	}
	
	
}
