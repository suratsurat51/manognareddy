package com.manognareddy.filter;

import java.io.IOException;
import java.util.Random;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.manognareddy.util.Constants;
import com.manognareddy.util.FileCounter;

/**
 * Servlet implementation class Servlet
 */
@WebFilter(urlPatterns = { "/maternity", "/babies", "/newBorn", "/delete", "/upload", "/index", "/gallery", "/index.jsp" , "/index.html", "/maternity.html",
		"/babies.html", "/newBorn.html", "/gallery.html"})
public class AppFilter implements Filter {
	private static final long serialVersionUID = 1L;
	private static Random random = new Random();

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) arg0;
		String servletPath = request.getServletPath().replace("/", "").replace(".html", "");
		if (servletPath.equals(Constants.DELETE) || servletPath.equals(Constants.UPLOAD)) {
			String tag = request.getParameter(Constants.TAG);
			if (tag != null) {
				int maxCount = FileCounter.getCount(tag, Constants.MAX);
				request.setAttribute(Constants.MAX_TAG_COUNT, maxCount);
				request.setAttribute(Constants.TAG, tag);
				request.setAttribute(Constants.IMAGES_ARR, FileCounter.getFileNames(tag, Constants.MAX));
			} else {
				request.setAttribute(Constants.MAX_TAG_COUNT, 0);
			}
		} else if (servletPath.startsWith(Constants.INDEX)) {
			String[] maternityFileNamesArr = FileCounter.getFileNames(Constants.MATERNITY + "/" + Constants.HOME_IMAGE,
					Constants.MAX);
			String[] newBornFileNamesArr = FileCounter.getFileNames(Constants.NEW_BORN + "/" + Constants.HOME_IMAGE,
					Constants.MAX);
			String[] babiesFileNamesArr = FileCounter.getFileNames(Constants.BABIES + "/" + Constants.HOME_IMAGE,
					Constants.MAX);
			if (maternityFileNamesArr != null) {
				for (String temp : maternityFileNamesArr) {
					temp = Constants.MATERNITY + "/" + Constants.HOME_IMAGE + Constants.FORWARD_SLASH + Constants.MAX
							+ Constants.FORWARD_SLASH + temp;
					request.setAttribute(Constants.MATERNITY, temp);
				}
			}
			if (newBornFileNamesArr != null) {
				for (String temp : newBornFileNamesArr) {
					temp = Constants.NEW_BORN + "/" + Constants.HOME_IMAGE + Constants.FORWARD_SLASH + Constants.MAX
							+ Constants.FORWARD_SLASH + temp;
					request.setAttribute(Constants.NEW_BORN, temp);
				}
			}
			if (babiesFileNamesArr != null) {
				for (String temp : babiesFileNamesArr) {
					temp = Constants.BABIES + "/" + Constants.HOME_IMAGE + Constants.FORWARD_SLASH + Constants.MAX
							+ Constants.FORWARD_SLASH + temp;
					request.setAttribute(Constants.BABIES, temp);
				}
			}
			request.setAttribute(Constants.MAX_TAG_COUNT, 3);
		} else if (servletPath.equals(Constants.GALLERY)) {
			String[] maternityFileNamesArr = FileCounter.getFileNames(Constants.MATERNITY, Constants.MAX);
			String[] newBornFileNamesArr = FileCounter.getFileNames(Constants.NEW_BORN, Constants.MAX);
			String[] babiesFileNamesArr = FileCounter.getFileNames(Constants.BABIES, Constants.MAX);
			int totalCount = maternityFileNamesArr.length + newBornFileNamesArr.length + babiesFileNamesArr.length;
			String[] medfileNamesArr = new String[totalCount];
			String[] minFileNamesArr = new String[totalCount];
			int count = 0;
			for (String temp : maternityFileNamesArr) {
				medfileNamesArr[count] = Constants.MATERNITY + Constants.FORWARD_SLASH + Constants.MED
						+ Constants.FORWARD_SLASH + temp;
				minFileNamesArr[count] = Constants.MATERNITY + Constants.FORWARD_SLASH + Constants.MIN
						+ Constants.FORWARD_SLASH + temp;
				count++;
			}
			for (String temp : newBornFileNamesArr) {
				medfileNamesArr[count] = Constants.NEW_BORN + Constants.FORWARD_SLASH + Constants.MED
						+ Constants.FORWARD_SLASH + temp;
				minFileNamesArr[count] = Constants.NEW_BORN + Constants.FORWARD_SLASH + Constants.MIN
						+ Constants.FORWARD_SLASH + temp;
				count++;
			}
			for (String temp : babiesFileNamesArr) {
				medfileNamesArr[count] = Constants.BABIES + Constants.FORWARD_SLASH + Constants.MED
						+ Constants.FORWARD_SLASH + temp;
				minFileNamesArr[count] = Constants.BABIES + Constants.FORWARD_SLASH + Constants.MIN
						+ Constants.FORWARD_SLASH + temp;
				count++;
			}

			request.setAttribute(Constants.IMAGES_ARR, medfileNamesArr);
			request.setAttribute(Constants.MIN_IMAGES_ARR, minFileNamesArr);
			request.setAttribute(Constants.MAX_TAG_COUNT, totalCount);
		} else {
			int maxCount = FileCounter.getCount(servletPath, Constants.MAX);
			request.setAttribute(Constants.MAX_TAG_COUNT, maxCount);
			int randomCnt = random.nextInt(maxCount);
			if (randomCnt == 0) {
				randomCnt++;
			}
			request.setAttribute(Constants.RANDOM_COUNT, randomCnt);
			request.setAttribute(Constants.IMAGES_ARR, FileCounter.getFileNames(servletPath, Constants.MAX));
		}
		if (!servletPath.endsWith(Constants.JSP_FILE_EXT)) {
			request.getRequestDispatcher(servletPath + Constants.JSP_FILE_EXT).forward(request, arg1);
		}else{
			arg2.doFilter(arg0, arg1);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
