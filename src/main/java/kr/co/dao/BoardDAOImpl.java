package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
		
	}
	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
	
		return sqlSession.selectList("boardMapper.listPage", scri);

	}
	//게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return sqlSession.selectOne("boardMapper.listCount", scri);
	}
	
	// 게시물 조회
	@Override
	public BoardVO read(int board_id) throws Exception {
			
		return sqlSession.selectOne("boardMapper.read", board_id);
	}
	// 게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		
		sqlSession.update("boardMapper.update", boardVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int board_id) throws Exception {
		
		sqlSession.delete("boardMapper.delete", board_id);
	}
	
	@Override
	public void boardHit(int board_id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.boardHit", board_id);
	}
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sqlSession.insert("boardMapper.insertFile", map);
		
	}
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int board_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectFileList", board_id);
	}
	//첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectFileInfo", map);
	}
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.update("boardMapper.updateFile", map);
	}
}