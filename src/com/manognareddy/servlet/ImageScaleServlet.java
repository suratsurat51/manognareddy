package com.manognareddy.servlet;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.manognareddy.util.Constants;
import com.manognareddy.util.FileCounter;

/**
 * Servlet implementation class ImageScaleServlet
 */
@WebServlet("/image/upload")
@MultipartConfig
public class ImageScaleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ImageScaleServlet() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Part file = request.getPart(Constants.FILE);
		String token = request.getParameter(Constants.TOKEN_STR);
		if (token == null) {
			token = (String) request.getSession().getAttribute(Constants.APP_TOKEN);
		}
		if (token.equals(Constants.TOKEN)) {
			String tag = request.getParameter(Constants.TAG);
			if ((String) request.getSession().getAttribute(Constants.APP_TOKEN) == null) {
				request.getSession().setAttribute(Constants.APP_TOKEN, token);
			}
			int maxCount = FileCounter.getCountInFolder(tag, Constants.MAX);
			if (maxCount >= Constants.MAX_FILES_LIMIT) {
				response.getWriter().write("Can't upload more than " + Constants.MAX_FILES_LIMIT);
			} else {
				String homeImage = request.getParameter(Constants.HOME_IMAGE);
				if (!Constants.REPLACE.equalsIgnoreCase(homeImage)) {
					scaleImage(file.getInputStream(), tag);
				}
				if (Constants.YES.equalsIgnoreCase(homeImage) || Constants.REPLACE.equalsIgnoreCase(homeImage)) {
					scaleHomeImage(file.getInputStream(), tag);
				}
				response.getWriter().write("Uploaded successfully");
			}
		} else {
			response.getWriter().write("Invalid token.");
		}
	}

	public static void main(String[] args) {

		try {
			File file = new File("C:\\Users\\User\\git\\suratsurat51.github.io\\photos\\maternity\\maternity-3.jpg");
			scaleImage(new FileInputStream(file), "test");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void scaleImage(InputStream fileIs, String tag) throws ServletException {
		String toPath = Constants.IMG_DIR_PATH + tag + "/" + Constants.MAX;
		File toPathDir = new File(toPath);
		if (!toPathDir.exists()) {
			toPathDir.mkdirs();
		}
		// int cnt = totalFilesCount + 1;
		String uuid = UUID.randomUUID().toString();
		try {
			Image imageToConvert = ImageIO.read(fileIs);
			toPath = Constants.IMG_DIR_PATH + "/";
			convertAndSaveImg(tag, Constants.MAX, Constants.MAX_SIZE, toPath, uuid, imageToConvert);
			convertAndSaveImg(tag, Constants.MED, Constants.MED_SIZE, toPath, uuid, imageToConvert);
			convertAndSaveImg(tag, Constants.MIN, Constants.MIN_SIZE, toPath, uuid, imageToConvert);

		} catch (Exception any) {
			any.printStackTrace();
			throw new ServletException(any);
		}
	}

	public static void scaleHomeImage(InputStream fileIs, String tag) throws ServletException {
		tag = tag + "/" + Constants.HOME_IMAGE;
		String toPath = Constants.IMG_DIR_PATH + tag + "/" + Constants.MAX;
		File toPathDir = new File(toPath);
		if (!toPathDir.exists()) {
			toPathDir.mkdirs();
		}
		if (toPathDir.exists()) {
			for (File temp : toPathDir.listFiles()) {
				System.out.println(temp + " " + temp.exists());
				temp.delete();
			}
		}
		// int cnt = totalFilesCount + 1;
		String uuid = UUID.randomUUID().toString();
		try {
			Image imageToConvert = ImageIO.read(fileIs);
			toPath = Constants.IMG_DIR_PATH + "/";
			convertAndSaveImg(tag, Constants.MAX, Constants.MAX_SIZE, toPath, uuid, imageToConvert);

		} catch (Exception any) {
			any.printStackTrace();
			throw new ServletException(any);
		}
	}

	private static void convertAndSaveImg(String tag, String subtag, int size, String toPath, String uuid,
			Image imageToConvert) throws IOException {
		double aspectRatio = (double) imageToConvert.getWidth(null) / (double) imageToConvert.getHeight(null);
		BufferedImage convertedImage = resizeImage(imageToConvert, size, (int) (size / aspectRatio));
		File toFile = new File(toPath + tag + "/" + subtag + "/" + uuid + ".jpg");
		if (!toFile.exists()) {
			toFile.getParentFile().mkdirs();
		}
		ImageIO.write(convertedImage, "jpg", toFile);
	}

	/**
	 * This function resize the image file and returns the BufferedImage object
	 * that can be saved to file system.
	 */
	private static BufferedImage resizeImage(final Image image, int width, int height) {
		final BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		final Graphics2D graphics2D = bufferedImage.createGraphics();
		graphics2D.setComposite(AlphaComposite.Src);
		// below three lines are for RenderingHints for better image quality at
		// cost of higher processing time
		graphics2D.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
		graphics2D.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		graphics2D.drawImage(image, 0, 0, width, height, null);
		graphics2D.dispose();
		return bufferedImage;
	}

}
