package com.tramapbasket.board.kcm;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/board.kcm/addok.do")
public class AddOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Add.java
		
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		String id = session.getAttribute("id").toString();
		//String seq;
		String subject = "";
		String content = "";
		//String regdate;
		int readcount = 0;
		String tag ="";
		String name = ""; //글쓴이 이름
		int gap = 0; //글쓴뒤 지난 시간(분)
		int commentcount = 0; //댓글수
		String notice = ""; //공지사항
		String filename = ""; //첨부 파일
		String orgfilename = "";
		String downloadcount = "";
		
		String hash = ""; //해시태그
		
		try {
			System.out.println(req.getRealPath("/files"));
			
			MultipartRequest multi = new MultipartRequest(
																req,
																req.getRealPath("/files"),
																1024 * 1024 * 100,
																"UTF-8",
																new DefaultFileRenamePolicy()
															); //이 순간 > 첨부 파일 저장 완료
			

			subject = multi.getParameter("subject");
			content = multi.getParameter("content");
			tag = multi.getParameter("tag");
			notice = multi.getParameter("notice");
//			if (notice == null) notice = "0";
//			
//			reply = multi.getParameter("reply");//****
//			
//			//if (reply == null || reply == "") {
//			if (reply != null && reply != "") {
//				//부모글의 thread & depth
//				parentThread = Integer.parseInt(multi.getParameter("thread"));
//				parentDepth = Integer.parseInt(multi.getParameter("depth"));
//			}
			
			filename = multi.getFilesystemName("attach");
			orgfilename = multi.getOriginalFileName("attach");
			
			hash = multi.getParameter("hash");
			
			
		} catch (Exception e) {
			
			System.out.println("Add.doPost : " + e.toString());
		}
		
		

		BoardDAO dao = new BoardDAO();
		
		
//		//새글 or 답변글
//		if (reply == null || reply == "") {
//			//새글 쓰기
//			//thread, depth?
//			//a. 현존 모든 게시물 중에 가장 큰 thread값을 찾는다. > 그 값에 + 1000을 한 값을 자신의 thread값으로 사용한다.(nvl(max(thread), 0) + 1000)
//			thread = dao.getMaxThread();			
//			
//			//b. depth는 무조건 0을 넣는다. 
//			depth = 0;
//			
//		} else {
//			//답변글 쓰기
//			//thread, depth?
//			
//			//a. 현존 모든 게시물의 thread값을 대상으로 현재 작성 중인 답변글의 부모글의 thread값보다 작고, 이전 새글의 thread값보다 큰 thread을 찾아서 모두 -1한다.
//			//parentThread < ? < 이전 thread
//			
//			//이전 새글의 thread
//			int previousThread = (int)Math.floor((parentThread - 1) / 1000) * 1000;
//			
//			dao.updateThread(parentThread, previousThread);
//			
//			
//			//b. 현재 작성 중인 답변글의 thread값은 부모글의 thread - 1을 넣는다.
//			thread = parentThread - 1;
//			
//			//c. 현재 작성 중인 답변글의 depth값은 부모글의 depth + 1을 넣는다.
//			depth = parentDepth + 1;
//		}
		
		//2.
		BoardDTO dto = new BoardDTO();
		
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setTag(tag);
		dto.setId(id);
		dto.setNotice(notice);
		
		dto.setFilename(filename); //첨부 파일명
		dto.setOrgfilename(orgfilename);
		
		int result = dao.add(dto);
		
		//방금 쓴 게시물 번호
		String seq = dao.getSeq();
		
		
		
		
		//해시 태그 처리
		// - 예제
		// - JSP, Servlet, 수업 예제
		if (hash != null && !hash.equals("")) {
			
			//공백 제거
			hash = hash.replace(" ", "");
			
			//쪼개기
			String[] htemp = hash.split(",");
			
			for (String hitem : htemp) {
				
				dao.addHash(hitem);
				
				String hseq = dao.getHseq(hitem);
				
				//JSP > 25, 1
				//Servlet > 25, 5
				//수업 예제 > 25, 7
				dao.addHashBoard(seq, hseq);
				
			}
			
		}
		
	
		req.setAttribute("result", result);		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board.kcm/addok.jsp");
		dispatcher.forward(req, resp);

	}

}
