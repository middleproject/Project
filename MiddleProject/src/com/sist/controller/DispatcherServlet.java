package com.sist.controller;

import java.io.*;
import java.lang.reflect.Method;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import java.util.*;

public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// web.xml -> xml의 경로명 읽기 -> handlermapping에 전송 (SAX) --> 등록된 클래스 모아둔다.(Model)
	// 
	private List<String> list=new ArrayList<String>();
	public void init(ServletConfig config) throws ServletException {
		String path = config.getInitParameter("xmlPath"); // xml의 init-param을 읽음
		System.out.println(path);
		
		try {
			SAXParserFactory spf=SAXParserFactory.newInstance(); //파서기 생성
			SAXParser sp = spf.newSAXParser(); //파서기 
			HandlerMapping hm = new HandlerMapping();
			sp.parse(new File(path), hm); //파서파일 , hm이 가지고있는 startElement
			List<String> packList = hm.getPackList(); //팩키지를 가져옴
			
			for(String pack:packList){ //패키지를 component에 넣어서 클래스를 가져옴
				List<String> clsList=ComponentScan.componenetFileData(pack);
				
				for(String cls:clsList){ // 가져온 클래스를  list에 추가
					System.out.println("cls="+cls);
					list.add(cls);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/*
	 *  사용자 요청 처리
	 *  	1. 사용자 요청을 받는다. -> board/list.do :URI
	 *  	2. 처리한 메소드를 찾는다. -> Annotation @RequestMapping("board/list.do") *어노테이션은 항상 제어할 메소드 위에있다.
	 *  	3. Model(Request)을 전송 한다. -> 해당 메소드로 전송 (결과를 Request에 추가)
	 *  	4. ViewResolver -> 화면에 출력할 JSP를 찾는다.
	 *  	5. JSP에 Model(Request)를 전송한다
	 * 		6. JSP에서 화면 출력
	 */ 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String cmd=request.getRequestURI(); //프로젝트 명부터 들어온다./JSPMVCLastProject/*.do -> URI
			cmd=cmd.substring(request.getContextPath().length()+1); // JSPMVCLastProject(getContextPath)/ 자른다.
			
			// CLASS 찾기
			for(String cls:list){
				Class clsName=Class.forName(cls); // 클래스 정보를 읽음
				if(clsName.isAnnotationPresent(Controller.class)==false){ //Controller등록이 되지 않은 클래스 제외
					continue;
				}
				
				//System.out.println(obj);
				Object obj = clsName.newInstance(); // 클래스 할당
				//메소드 찾기
				Method[] method = clsName.getDeclaredMethods();
				for(Method m:method){
					RequestMapping rm = m.getAnnotation(RequestMapping.class);
					if(cmd.equals(rm.value())){ //cmd요청 클래스와 requestmapping한 값이 같은지 확인
						Model model = new Model(request, response); //request,response를 감춤 Model클래스의 private
						String jsp =(String)m.invoke(obj, model); //MainModel m = new Mainmodel(); => m.main_page()
						System.out.println(jsp);
						if(jsp.startsWith("redirect")){
							//화면 이동
							response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));// return 값 redirect:(<-짜름)main.do
							
						}else{
							// 화면 출력
							RequestDispatcher rd = request.getRequestDispatcher(jsp);
							rd.forward(request, response);
						}
						return;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
