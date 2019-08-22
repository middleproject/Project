package com.sist.controller;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
import java.util.*;
/*
 * 	Framework : Spring, Mybatis => XML(파싱)
 */
public class HandlerMapping  extends DefaultHandler{
	private List<String> packList = new ArrayList<String>();
	
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		/*
		 * 	qName : 태그명을 가져온다
		 * 	attributes : 태그 속성값을 읽을 경우
		 */
		try {
			if(qName.equals("context:component-scan")){
				String pack = attributes.getValue("base-package");
				packList.add(pack);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<String> getPackList() {
		return packList;
	}
	
}
