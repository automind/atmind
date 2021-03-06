package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVo;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

public interface BoardService {
	public void regist(BoardVo board) throws Exception;
	
	public BoardVo read(Integer bno)throws Exception;
	
	public void modify(BoardVo board)throws Exception;
	
	public void remove(Integer bno)throws Exception;
	
	public List<BoardVo> listAll()throws Exception;
	
	public List<BoardVo> listCriteria(Criteria cri)throws Exception;
	
	public int listCountCriteria(Criteria cri)throws Exception;
	
	
	
	public List<BoardVo> listSearchCriteria(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
}
