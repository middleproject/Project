package com.sist.controller;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
import java.util.*;
/*
 * 	Framework : Spring, Mybatis => XML(�Ľ�)
 */
public class HandlerMapping  extends DefaultHandler{
	private List<String> packList = new ArrayList<String>();
	
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		/*
		 * 	qName : �±׸��� �����´�
		 * 	attributes : �±� �Ӽ����� ���� ���
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
