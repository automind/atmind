package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVo;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;
import org.zerock.persistence.BoardDao;

@Service
public class boardServiceImpl implements BoardService{
	
	@Inject
	private BoardDao dao;
	
	@Override
	public void regist(BoardVo board)throws Exception{
		dao.create(board);
	}
	
	@Override
	public BoardVo read(Integer bno)throws Exception{
		return dao.read(bno);
	}
	
	@Override
	public void modify(BoardVo board)throws Exception{
		dao.update(board);
	}
	
	@Override
	public void remove(Integer bno)throws Exception{
		dao.delete(bno);
	}
	
	@Override
	public List<BoardVo> listAll() throws Exception{
		return dao.listAll();
	}
	
	@Override
	public List<BoardVo> listCriteria(Criteria cri)throws Exception{
		return dao.listCriteria(cri);
	}
	
	@Override
	public int listCountCriteria(Criteria cri)throws Exception{
		return dao.countPaging(cri);
	}
	
	
	
	
	@Override
	public List<BoardVo> listSearchCriteria(SearchCriteria cri)throws Exception{
		return dao.listSearch(cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri)throws Exception{
		return dao.listSearchCount(cri);
	}
	
}