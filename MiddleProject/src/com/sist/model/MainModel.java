package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.sist.controller.*;
import com.sist.dao.*;
import com.sist.vo.*;
import com.sist.model.*;

@Controller("mainModel")
public class MainModel {
	
	@RequestMapping("main/main.do")
	public String main_page(Model model){
		//���ο� ��ٱ��� ���� 
		int Wishcount = 0;
		int msgCount = 0;
		int followCount=0;
		HttpSession session = model.getRequest().getSession();
		String id =(String)session.getAttribute("id");
		List<FollowVO> madeList =new ArrayList<FollowVO>();
		List<RecipeVO> list = new ArrayList<RecipeVO>();
		List<Integer> rList = new  ArrayList<Integer>(); // ���� ������
		List<Integer> iList = new  ArrayList<Integer>(); //������ ������
		if(id!=null) { 
			Wishcount = MemberDAO.wishCount(id);
			msgCount = RecipeDAO.msgCount(id);
			RecipeVO zvo = new RecipeVO();
			madeList = RecipeDAO.followSearch(id);	
			for(FollowVO vo:madeList){
				iList=(RecipeDAO.followSearchRecipe(vo));
			}
			rList = RecipeDAO.readIntRecipe(id);
			followCount = iList.size();
			for(int i:iList){
				for(int j:rList){
					if(i==j){
						zvo = RecipeDAO.wishAllData(i);
						zvo.setRead(true);
						followCount--;
					}
				}
				list.add(zvo);
			}			
		}
		// ���� ����Ʈ ���� ����
		List<Integer> dList = new ArrayList<Integer>();
		dList = RecipeDAO.todayDeleteList();
		for(int recipeno:dList){
			RecipeDAO.todayHitDelete(recipeno);
		}
		// ���� �ִ� ��ȸ�� ������ ����
		List<TodayHitVO> tList = new ArrayList<TodayHitVO>();
		List<RecipeVO> rlist = new ArrayList<RecipeVO>();
		tList = RecipeDAO.todayHitList();
		System.out.println("tList������:"+tList.size());
		for(TodayHitVO tvo:tList){
			try {
				RecipeVO vo = RecipeDAO.recipeDetailnoUpdate(tvo.getRecipeno());
				vo.setHit(tvo.getHit());
				rlist.add(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			System.out.println("tvo:"+tvo.getRecipeno());
		}
		// ž 5����
		List<MemberVO> mList = new ArrayList<MemberVO>();
		mList = MemberDAO.chefAllData();
		
		
		session.setAttribute("mList", mList);
		session.setAttribute("rlist", rlist);
		session.setAttribute("followCount", followCount);
		session.setAttribute("msgCount", msgCount);
		session.setAttribute("Wishcount", Wishcount);
		model.addAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
	
}
