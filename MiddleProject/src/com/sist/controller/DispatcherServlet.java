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
	// web.xml -> xml�� ��θ� �б� -> handlermapping�� ���� (SAX) --> ��ϵ� Ŭ���� ��Ƶд�.(Model)
	// 
	private List<String> list=new ArrayList<String>();
	public void init(ServletConfig config) throws ServletException {
		String path = config.getInitParameter("xmlPath"); // xml�� init-param�� ����
		System.out.println(path);
		
		try {
			SAXParserFactory spf=SAXParserFactory.newInstance(); //�ļ��� ����
			SAXParser sp = spf.newSAXParser(); //�ļ��� 
			HandlerMapping hm = new HandlerMapping();
			sp.parse(new File(path), hm); //�ļ����� , hm�� �������ִ� startElement
			List<String> packList = hm.getPackList(); //��Ű���� ������
			
			for(String pack:packList){ //��Ű���� component�� �־ Ŭ������ ������
				List<String> clsList=ComponentScan.componenetFileData(pack);
				
				for(String cls:clsList){ // ������ Ŭ������  list�� �߰�
					System.out.println("cls="+cls);
					list.add(cls);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/*
	 *  ����� ��û ó��
	 *  	1. ����� ��û�� �޴´�. -> board/list.do :URI
	 *  	2. ó���� �޼ҵ带 ã�´�. -> Annotation @RequestMapping("board/list.do") *������̼��� �׻� ������ �޼ҵ� �����ִ�.
	 *  	3. Model(Request)�� ���� �Ѵ�. -> �ش� �޼ҵ�� ���� (����� Request�� �߰�)
	 *  	4. ViewResolver -> ȭ�鿡 ����� JSP�� ã�´�.
	 *  	5. JSP�� Model(Request)�� �����Ѵ�
	 * 		6. JSP���� ȭ�� ���
	 */ 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String cmd=request.getRequestURI(); //������Ʈ ����� ���´�./JSPMVCLastProject/*.do -> URI
			cmd=cmd.substring(request.getContextPath().length()+1); // JSPMVCLastProject(getContextPath)/ �ڸ���.
			
			// CLASS ã��
			for(String cls:list){
				Class clsName=Class.forName(cls); // Ŭ���� ������ ����
				if(clsName.isAnnotationPresent(Controller.class)==false){ //Controller����� ���� ���� Ŭ���� ����
					continue;
				}
				
				//System.out.println(obj);
				Object obj = clsName.newInstance(); // Ŭ���� �Ҵ�
				//�޼ҵ� ã��
				Method[] method = clsName.getDeclaredMethods();
				for(Method m:method){
					RequestMapping rm = m.getAnnotation(RequestMapping.class);
					if(cmd.equals(rm.value())){ //cmd��û Ŭ������ requestmapping�� ���� ������ Ȯ��
						Model model = new Model(request, response); //request,response�� ���� ModelŬ������ private
						String jsp =(String)m.invoke(obj, model); //MainModel m = new Mainmodel(); => m.main_page()
						System.out.println(jsp);
						if(jsp.startsWith("redirect")){
							//ȭ�� �̵�
							response.sendRedirect(jsp.substring(jsp.indexOf(":")+1));// return �� redirect:(<-¥��)main.do
							
						}else{
							// ȭ�� ���
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
