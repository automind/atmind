package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyDto;
import org.zerock.persistence.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDao dao;
	
	@Override
	public void addReply(ReplyDto rDto) throws Exception {
		dao.create(rDto);
	}

	@Override
	public List<ReplyDto> listReply(Integer bno) throws Exception {
		return dao.list(bno);
	}

	@Override
	public void modifyReply(ReplyDto rDto) throws Exception {
		dao.update(rDto);
	}

	@Override
	public void removeReply(Integer rno) throws Exception {
		dao.delete(rno);
	}

	@Override
	public List<ReplyDto> listReplyPage(Integer bno, Criteria cri) throws Exception {
		return dao.listPage(bno, cri);
	}

	@Override
	public int count(Integer bno) throws Exception {
		return dao.count(bno);
	}

}
