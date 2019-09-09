package com.sist.manager;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class NaverBlogManager {
	public static void main(String[] args) {
		NaverBlogManager nb = new NaverBlogManager();
		String json = nb.blogGetData("�ų���");
		try {
			JSONParser jp = new JSONParser();
			/*
			 *  {} JSONObject
			 *  [] JSONArray
			 */
			JSONObject obj = (JSONObject)jp.parse(json);
			JSONArray arr=(JSONArray)obj.get("items");
			for(int i=0;i<arr.size();i++){
				JSONObject js = (JSONObject)arr.get(i);
				String desc =(String)js.get("description");
				desc= desc.replace("<", "");
				desc= desc.replace(">", "");
				desc= desc.replace("/", "");
				desc= desc.replaceAll("[A-Za-z]", "");
				desc= desc.replace("&", "");
				desc= desc.replace("#", "");
				desc= desc.replace(",", "");
				System.out.println(desc);
			}
		} catch (Exception e) {
			e.printStackTrace();}
	}
	public String blogGetData(String data){
		String result="";
		 String clientId = "TWL9HAmAOLGJ7FMgEbZn";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
	        String clientSecret = "ccxOoMfHu0";//���ø����̼� Ŭ���̾�Ʈ ��ũ����";
	        try {
	            String text = URLEncoder.encode(data, "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/blog?display=100&query="+ text; // json ���
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // ���� ȣ��
	                br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
	            } else {  // ���� �߻�
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
	            }
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            result=response.toString();
	        } catch (Exception e) {
	            System.out.println(e);
	        }
		return result;
	}
}
