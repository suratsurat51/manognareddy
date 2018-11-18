package com.manognareddy.servlet;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.manognareddy.util.Constants;
import com.manognareddy.util.FileCounter;

/**
 * Servlet implementation class ImageDeleteServlet
 */
@WebServlet("/image/delete")
public class ImageDeleteServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImageDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse response)
			throws ServletException, IOException {
		String body = req.getReader().lines().collect(Collectors.joining());
		String[] params = body.split("&");
		Map<String,String> requestMap = new HashMap<>();
		for(String param:params){
			String[] keyVal = param.split("=");
			String val = null;
			if(keyVal[1] != null){
				val = keyVal[1].trim();
				val = URLDecoder.decode(val,"utf-8");
			}
			requestMap.put(keyVal[0], val);
		}
		String token = requestMap.get(Constants.TOKEN_STR);
		if (token == null) {
			token = (String) req.getSession().getAttribute(Constants.APP_TOKEN);
		}
		if (token.equals(Constants.TOKEN)) {
			if ((String) req.getSession().getAttribute(Constants.APP_TOKEN) == null) {
				req.getSession().setAttribute(Constants.APP_TOKEN, token);
			}
			String tag = requestMap.get(Constants.TAG);
			int maxCount = FileCounter.getCountInFolder(tag, Constants.MAX);
			if (maxCount <= Constants.MIN_FILES_LIMIT) {
				response.getWriter().write("Can't delete below than " + Constants.MIN_FILES_LIMIT);
			} else {
				Iterator<String> names = requestMap.keySet().iterator();
				boolean deleted = false;
				while (names.hasNext()) {
					String name = names.next();
					String val = requestMap.get(name);
					if ("on".equalsIgnoreCase(val) && maxCount > Constants.MIN_FILES_LIMIT) {
						String toPath = Constants.IMG_DIR_PATH + tag + "/" + Constants.MIN;
						deleted = new File(toPath + "/" + name).delete();
						toPath = Constants.IMG_DIR_PATH + tag + "/" + Constants.MED;
						deleted = new File(toPath + "/" + name).delete();
						toPath = Constants.IMG_DIR_PATH + tag + "/" + Constants.MAX;
						deleted = new File(toPath + "/" + name).delete();
						maxCount--;
					}
				}
				if (deleted) {
					response.getWriter().write("Deleted successfully");
				} else {
					response.getWriter().write("Nothing to Delete");
				}
			}
		} else {
			response.getWriter().write("Invalid token.");
		}

	}
	
}
