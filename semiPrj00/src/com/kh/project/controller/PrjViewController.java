package com.kh.project.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.project.service.PrjViewService;
import com.kh.project.notice.vo.ProjectNoticeVo;
import com.kh.project.vo.ProjectVo;
import com.kh.reward.vo.ProjectRewardVo;

@WebServlet(urlPatterns = "/project/view")
public class PrjViewController extends HttpServlet{

	//프로젝트 상세페이지 보여주기
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		//클릭한 프로젝트의 프로젝트 번호 받아오기
		String prjNum = req.getParameter("num");
		System.out.println("받아온 플젝번호:"+prjNum);
		
		//서버 가서 플젝 번호와 일치하는 프로젝트 vo 조회해오기
		ProjectVo pvo = new PrjViewService().selectProject(prjNum);
		
		//총 후원금 계산하기
		String total = new PrjViewService().getTotalDonation(prjNum);
		
		//달성률 계산하기
		String getTotal = total.replaceAll(",","");
		int totalDonation = Integer.parseInt(getTotal);
		double getPercentage = ((double)totalDonation / (double)pvo.getGoal()) * 100;
		long percent = Math.round(getPercentage);
		
		//남은기간 계산하기
		String date = pvo.getEndDate();
		int year = Integer.parseInt((date).substring(0,4));
		int month = Integer.parseInt((date).substring(5,7))-1;	//0~11
		int day = Integer.parseInt(date.substring(8,10));
		
		Calendar today = Calendar.getInstance();
		Calendar endDay = Calendar.getInstance();
		endDay.set(year, month, day);
		long ltoday = today.getTimeInMillis() / (24*60*60*1000);
		long lendDay = endDay.getTimeInMillis() / (24*60*60*1000);
		
		long dayLeft = lendDay - ltoday;
		
		//총 후원자 수 계산하기
		String totalDonator = new PrjViewService().getTotalDonator(prjNum);
		
		//서버 가서 플젝 번호와 일치하는 공지사항 vo 조회해오기
		List<ProjectNoticeVo> noticeList = new PrjViewService().selectNotice(prjNum);
		System.out.println("dao에서 가져온 공지사항 리스트:"+noticeList);
		
		//서버 가서 플젝 번호와 일치하는 리워드 vo 조회해오기
		List<ProjectRewardVo> optionList = new PrjViewService().selectReward(prjNum);
		System.out.println("dao에서 가져온 리워드 리스트:"+optionList);
		
		
		
		//전달할거 가지고 (  ) jsp 파일로 포워딩
		req.setAttribute("projectVo", pvo);
		req.setAttribute("totalDonation", totalDonation);
		req.setAttribute("percent", percent);
		req.setAttribute("dayLeft", dayLeft);
		req.setAttribute("totalDonator", totalDonator);
		req.setAttribute("noticeList", noticeList);
		req.setAttribute("optionList", optionList);
		req.getRequestDispatcher("/WEB-INF/views/project/projectDescriptionView.jsp").forward(req, resp);
	
	}
	
}
