package com.sist.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Model {
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public Model(HttpServletRequest request, HttpServletResponse response){
		this.request = request;
		this.response=response;
	}
	public void addAttribute(String key,Object obj){
		request.setAttribute(key, obj);
	}
	
	public HttpServletRequest getRequest() {
		return request;
	}
	public HttpServletResponse getResponse() {
		return response;
	}
	
	
}
