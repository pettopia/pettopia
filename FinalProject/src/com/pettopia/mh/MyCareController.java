package com.pettopia.mh;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyCareController
{
	@Autowired
	private SqlSession sqlSession;

	// 나의 돌봄신청 내역
	@RequestMapping(value = "/mycarelist.action", method = RequestMethod.GET)
	public String careList(Model model, HttpSession session)
	{
		String result = null;

		IMyCareDAO dao = sqlSession.getMapper(IMyCareDAO.class);

		model.addAttribute("list", dao.carelist((String) session.getAttribute("id")));

		result = "/WEB-INF/views/MyCareList.jsp";

		return result;
	}

	// 나의 환불신청 내역
	@RequestMapping(value = "/myreflist.action", method = RequestMethod.GET)
	public String refList(Model model, HttpSession session)
	{
		String result = null;

		IMyCareDAO dao = sqlSession.getMapper(IMyCareDAO.class);

		model.addAttribute("list", dao.reflist((String) session.getAttribute("id")));

		result = "/WEB-INF/views/MyRefList.jsp";

		return result;
	}

	// 마이페이지 돌봄내역 > 상태에 따른 팝업창 띄워주기
	@RequestMapping(value = "/statepopup.action", method = RequestMethod.GET)
	public String statepopup(Model model, String care_req_seq, String state)
	{
		String result = null;

		IMyCareDAO dao = sqlSession.getMapper(IMyCareDAO.class);

		if (state.equals("리뷰쓰기"))
		{
			model.addAttribute("dto", dao.psreviewlist(care_req_seq));
			result = "/WEB-INF/views/WriteReview.jsp";
		

		} else if (state.equals("예치금입금"))
		{
			model.addAttribute("dto", dao.depositlist(care_req_seq));
			model.addAttribute("bank", dao.banklist());
			result = "/WEB-INF/views/Deposit.jsp";

		} /*
			 * else if (state.equals("환불승인하기")) 
			 * { model.addAttribute("dto", dao.refundinf(care_req_seq)); 
			 * 
			 * result = "/WEB-INF/views/Deposit.jsp";
			 * 
			 * }
			 */else if (state.equals("승인/거절"))
		{
			model.addAttribute("dto", dao.carereqinf(care_req_seq));
			result = "/WEB-INF/views/CareReqAgree.jsp";

		} else if (state.equals("일지작성하기"))
		{
			model.addAttribute("dto", dao.psreviewlist(care_req_seq));
			result = "/WEB-INF/views/PsDailyLog.jsp";
			
			System.out.println();
		}
		
	
		
		
		return result;
	}

	// 리뷰INSERT 액션
	@RequestMapping(value = "/review.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String review(Model model, PsReviewDTO dto)
	{
		String result = null;

		IMyCareDAO dao = sqlSession.getMapper(IMyCareDAO.class);

		try
		{
			dao.addpsreview(dto);
			model.addAttribute("msg", "리뷰작성 성공");
			model.addAttribute("url", "/mycarelist.action");

		} catch (NullPointerException e)
		{
			model.addAttribute("msg", "리뷰작성 실패");
			model.addAttribute("url", "/main.action");
		}

		result = "/WEB-INF/views/AlertAndClose.jsp";

		return result;
	}
	
	

	// 예치금INSERT 액션
	@RequestMapping(value = "/deposit.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String deposit(Model model, DepositDTO dto)
	{
		String result = null;

		IMyCareDAO dao = sqlSession.getMapper(IMyCareDAO.class);

		try
		{
			dao.adddeposit(dto);
			model.addAttribute("msg", "예치금 입금 성공");
			model.addAttribute("url", "/mycarelist.action");

		} catch (NullPointerException e)
		{
			model.addAttribute("msg", "예치금 입금 실패");
			model.addAttribute("url", "/main.action");
		}

		result = "/WEB-INF/views/AlertAndClose.jsp";

		return result;
	}
	
	// 돌봄승인 action
	@RequestMapping(value = "/careagree.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String careagree(Model model, String care_req_seq)
	{
		String result = null;

		IMyCareDAO dao = sqlSession.getMapper(IMyCareDAO.class);

		try
		{
			dao.addagree(care_req_seq);
			model.addAttribute("msg", "돌봄승인 완료");
			model.addAttribute("url", "/mypscarelist.action");

		} catch (NullPointerException e)
		{
			model.addAttribute("msg", "돌봄승인 실패");
			model.addAttribute("url", "/main.action");
		}

		result = "/WEB-INF/views/AlertAndClose.jsp";

		return result;
	}

	
	// 돌봄거절 action
	@RequestMapping(value = "/carerefuse.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String carerefuse(Model model, String care_req_seq)
	{
		String result = null;

		IMyCareDAO dao = sqlSession.getMapper(IMyCareDAO.class);

		try
		{
			dao.addrefuse(care_req_seq);
			model.addAttribute("msg", "돌봄거절 완료");
			model.addAttribute("url", "/mypscarelist.action");

		} catch (NullPointerException e)
		{
			model.addAttribute("msg", "돌봄거절 실패");
			model.addAttribute("url", "/main.action");
		}

		result = "/WEB-INF/views/AlertAndClose.jsp";

		return result;
	}
	
	// 일지INSERT 액션
		@RequestMapping(value = "/dailylog.action", method = { RequestMethod.GET, RequestMethod.POST })
		public String dailylog(Model model, PsReviewDTO dto)
		{
			String result = null;

			IMyCareDAO dao = sqlSession.getMapper(IMyCareDAO.class);

			try
			{
				dao.addpsreview(dto);
				model.addAttribute("msg", "일지작성 성공");
				model.addAttribute("url", "/mycarelist.action");

			} catch (NullPointerException e)
			{
				model.addAttribute("msg", "일지작성 실패");
				model.addAttribute("url", "/mycarelist.action");
			}

			result = "/WEB-INF/views/AlertAndClose.jsp";

			return result;
		}

	
	// 내가 쓴 돌봄 리뷰
	@RequestMapping(value = "/mycarereview.action", method = RequestMethod.GET)
	public String mycarereview(Model model, HttpSession session)
	{
		String result = null;

		IMyCareDAO dao = sqlSession.getMapper(IMyCareDAO.class);

		model.addAttribute("list", dao.mycarereview((String)session.getAttribute("code")));
		
		result = "/WEB-INF/views/MyCareReview.jsp";
		
		return result;
	}

	
	
	// 나의 돌봄 리뷰 (펫시터) 
	@RequestMapping(value = "/mypsreview.action", method = RequestMethod.GET)
	public String mypsreview(Model model, HttpSession session)
	{
		String result = null;

		IMyCareDAO dao = sqlSession.getMapper(IMyCareDAO.class);

		model.addAttribute("avg", dao.calavg((String)session.getAttribute("code")));
		model.addAttribute("list", dao.mypsreview((String)session.getAttribute("code")));
		
		result = "/WEB-INF/views/MyPsReview.jsp";
		
		return result;
	}
	
	
	// 돌봄신청내역 (펫시터) 
	@RequestMapping(value = "/mypscarelist.action", method = RequestMethod.GET)
	public String mypscarelist(Model model, HttpSession session)
	{
		String result = null;

		IMyCareDAO dao = sqlSession.getMapper(IMyCareDAO.class);

		model.addAttribute("list", dao.pscarelist((String)session.getAttribute("code")));
		
		result = "/WEB-INF/views/MyPsCareList.jsp";
		
		return result;
	}
}