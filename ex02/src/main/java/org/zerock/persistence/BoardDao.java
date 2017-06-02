package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.BoardVo;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;



public interface BoardDao {
	/***********************************************************
	 * <pre>
	 * 1. 개요       : 게시글 등록
	 * 2. 처리내용 : 게시글 데이터 베이스에 Insert
	 * </pre>
	 * @Method Name : create 
	 * @param BoardVo vo
	 * @throws Exception
	 **********************************************************/	
	public void create(BoardVo vo)throws Exception;
	
	/***********************************************************
	 * <pre>
	 * 1. 개요       : 게시글 조회(상세보기)
	 * 2. 처리내용 : 게시글 데이터 베이스에서 select
	 * </pre>
	 * @Method Name : read 
	 * @param       : bno
	 * @return		: BoardVo
	 * @throws Exception
	 **********************************************************/
	public BoardVo read(Integer bno)throws Exception;
	
	/***********************************************************
	 * <pre>
	 * 1. 개요       : 게시글 수정 
	 * 2. 처리내용 : 게시글 데이터 베이스 수정
	 * </pre>
	 * @Method Name : update 
	 * @param 		: BoardVo vo
	 * @throws Exception
	 **********************************************************/
	public void update(BoardVo vo)throws Exception;
	
	/***********************************************************
	 * <pre>
	 * 1. 개요       : 게시글 삭제
	 * 2. 처리내용 : 게시글 데이터 베이스 삭제
	 * </pre>
	 * @Method Name : delete 
	 * @param 		: Integer bno(글번호)
	 * @throws Exception
	 **********************************************************/
	public void delete(Integer bno)throws Exception;
	
	/***********************************************************
	 * <pre>
	 * 1. 개요       : 게시글 목록
	 * 2. 처리내용 : 데이터 베이스에서 게기슬 목록 처리
	 * </pre>
	 * @Method Name : listAll 
	 * @return		: List<BoardVo>
	 * @throws Exception
	 **********************************************************/
	public List<BoardVo> listAll()throws Exception;	
	
	public List<BoardVo> listPage(int page)throws Exception;
	
	public List<BoardVo> listCriteria(Criteria cri)throws Exception;

	int countPaging(Criteria cri) throws Exception;
	
	
	
	public List<BoardVo> listSearch(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;
	
}
