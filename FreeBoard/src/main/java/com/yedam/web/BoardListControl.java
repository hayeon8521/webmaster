package com.yedam.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.common.PageDTO;
import com.yedam.service.BoardService;
import com.yedam.service.BoardServiceImpl;
import com.yedam.vo.BoardVO;

public class BoardListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//글 목록 보여주기. 조회 후 jsp 전달.
		//http://localhost/FreeBoard/boardlist.do?page=1
		String page = req.getParameter("page");
		page = page == null ? "1" : page;
		
		BoardService svc = new BoardServiceImpl();
		List<BoardVO> list = svc.boardList(Integer.parseInt(page));
		
		req.setAttribute("boardList", list);
		req.setAttribute("page", new PageDTO(Integer.parseInt(page)));
		
		//jsp페이지
		req.getRequestDispatcher("WEB-INF/jsp/boardlist.jsp").forward(req, resp);
		
	}

}