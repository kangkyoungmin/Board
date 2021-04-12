package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.ReplyDAO;
import kr.co.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> readReply(int board_id) throws Exception {
		
		return dao.readReply(board_id);
	}
	//댓글 작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		dao.writeReply(vo);
		
	}
	//댓글 수정
	@Override
	public void updateReply(ReplyVO vo)throws Exception{
		dao.updateReply(vo);
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO vo) throws Exception{
		dao.deleteReply(vo);
		
	}
	
	//선택한 댓글 조회
	@Override
	public ReplyVO selectReply(int comment_id) throws Exception{
		return dao.selectReply(comment_id);
	}
	
		
}
