package com.sist.controller;
//��Ű�� ��� -> Ŭ���� �̸� ã��
import java.io.*;
import java.util.*;
public class ComponentScan {
	
	public static List<String> componenetFileData(String pack){
		List<String> list = new ArrayList<String>();
		try {
			String path="C:\\mvcDev\\mvcStudy\\JSPMVCLastProject\\src";
			path=path+"\\"+pack.replace(".", "\\");
			File dir= new File(path); // File : file,directory ����
			File[] fList=dir.listFiles();
			for(File f:fList){
				//System.out.println(f.getName());
				String fname = f.getName();
				String ext = fname.substring(fname.lastIndexOf(".")+1);
				if(ext.equals("java")){
					String clsName=pack+"."+fname.substring(0,fname.lastIndexOf("."));
					
					list.add(clsName);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
	}
}
