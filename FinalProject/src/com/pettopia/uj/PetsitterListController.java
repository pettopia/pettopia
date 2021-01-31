package com.pettopia.uj;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pettopia.jw.IPetProfileDAO;
import com.pettopia.mh.IMyPageDAO;

@Controller
public class PetsitterListController
{
// sqlSession �쓣 �솢�슜�븯�뿬 留덉씠諛뷀떚�뒪 媛앹껜 �쓽議댁꽦 (�옄�룞) 二쇱엯
// �썝移숈쟻�쑝濡쒕뒗 setter 援ъ꽦�빐�꽌 二쇱엯�빐�빞�븯吏�留� @Autowired 瑜� �넻�빐 �옄�룞二쇱엯�븷 �닔 �엳寃� �맖
	@Autowired
	private SqlSession sqlSession;

// ��@RequestMapping(value = "�슂泥�二쇱냼", method = �쟾�넚諛⑹떇)��
// �씠 �븣, �쟾�넚 諛⑹떇�� submit �븸�뀡�씤 寃쎌슦�뿉留� POST
// �굹癒몄� 紐⑤뱺 �쟾�넚 諛⑹떇�� GET �쑝濡� 泥섎━�븳�떎.
	
	
	
	// �렖�떆�꽣 由ъ뒪�듃 action 泥섎━
	@RequestMapping(value = "/petsitter.action", method = RequestMethod.GET)
	public String PetsitterList(Model model, HttpSession session)
	{
		String result = null;
		String code = (String)session.getAttribute("code");

		IPetsitterListDAO dao = sqlSession.getMapper(IPetsitterListDAO.class);
		IPetsitterDAO dao1 = sqlSession.getMapper(IPetsitterDAO.class);
		
		try
		{
			HashMap<Object, String> paramMap = new HashMap<Object, String>();

			model.addAttribute("profile", dao.profile());
			
			if(code != null)	// 濡쒓렇�씤�맂 �쉶�썝�씠�씪硫�
			{
				// �렖�떆�꽣肄붾뱶�룄 �떞�븘�꽌 �쟾�떖
				model.addAttribute("psregcode", dao1.searchPsRegCode(code));
				
			}
			

			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		

		result = "/WEB-INF/views/PetsitterList.jsp";

		return result;
	}
	
	
	
	// �렖�떆�꽣 �떊泥� action 泥섎━
	@RequestMapping(value = "/petsitterreq.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String petsitterreq(Model model, HttpSession session, String code)
	{
		String result = null;
		
		IPetsitterListDAO dao = sqlSession.getMapper(IPetsitterListDAO.class);
		IPetsitterDAO dao1 = sqlSession.getMapper(IPetsitterDAO.class);
		
		if((String)session.getAttribute("code") != null)	// 濡쒓렇�씤�맂 �쉶�썝�씠�씪硫�
		{
			// �렖�떆�꽣肄붾뱶�룄 �떞�븘�꽌 �쟾�떖
			model.addAttribute("psregcode", dao1.searchPsRegCode((String)session.getAttribute("code")));
			
		}

		result = "WEB-INF/views/PetsitterDocu.jsp";

		return result;
	}
	
	
	
	// �렖�떆�꽣 �봽濡쒗븘 �긽�꽭蹂닿린 action 泥섎━
	@RequestMapping(value = "/petsitterprofileview.action", method = RequestMethod.GET)
	public String petsitterprofileview(String seq, Model model)
	{
		String result = null;

		IPetsitterListDAO dao = sqlSession.getMapper(IPetsitterListDAO.class);

		
		model.addAttribute("ps_profile_seq", dao.psprofileview(seq));

		result = "WEB-INF/views/PetsitterView.jsp";

		return result;
	}
	
	
	
	
}