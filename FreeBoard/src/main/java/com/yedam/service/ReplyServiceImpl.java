package com.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mapper.ReplyMapper;
import com.yedam.vo.ReplyVO;

public class ReplyServiceImpl implements ReplyService{

	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
	
	@Override
	public List<ReplyVO> replyList(int boardNo) {
		return mapper.selectList(boardNo);
	}
	
	@Override
	public List<ReplyVO> selectListPaging(int boardNo, int page) {
		return mapper.selectListPaging(boardNo, page);
	}


	@Override
	public boolean registerReply(ReplyVO reply) {
		return mapper.insertReply(reply) == 1;
	}

	@Override
	public boolean removeReply(int replyNo) {
		return mapper.deleteReply(replyNo) == 1;
	}

	@Override
	public ReplyVO searchReply(int replyNo) {
		return mapper.selectReply(replyNo);
	}

	@Override
	public int replyCount(int boardNo) {
		return mapper.selectCount(boardNo);
	}

	
}
