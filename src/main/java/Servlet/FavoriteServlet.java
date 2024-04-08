package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import entities.Favorite;
import entities.Share;
import entities.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.FavoriteDAO;
import model.ShareDAO;
import model.VideoDAO;




/**
 * Servlet implementation class FavoriteServlet
 */
@WebServlet({
	"/favorite/index",
	"/favorite/like",
	"/favorite/share",
	"/favorite/unlike"
})
public class FavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FavoriteDAO fDao = new FavoriteDAO();

    public FavoriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		if(uri.contains("index")) {
			favorite(request, response);
			request.getRequestDispatcher("/views/user/user.jsp").forward(request, response);
		}
		else if(uri.contains("/favorite/like")) {
			like(request, response);
		}
		else if(uri.contains("unlike")) {
			unlike(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		share(request, response);
		request.getRequestDispatcher("/views/user/user.jsp").forward(request, response);
	}
	
	public void favorite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Users user = (Users) request.getSession().getAttribute("user");
		List<Favorite> list = fDao.findByUser(user.getId());
		request.setAttribute("favorite", list);
	}
	
	public void like(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Favorite fa = new Favorite();
			fa.setLikeDate(new Date());
			fa.setUser((Users) request.getSession().getAttribute("user"));
			VideoDAO vdDao = new VideoDAO();
			fa.setVideo(vdDao.findById(request.getParameter("id")));
			fDao.create(fa);
			if(request.getParameter("dt")!=null)
				response.sendRedirect("/Assignment2/watch-product/detail?id="+vdDao.findById(request.getParameter("id")).getPoster());
			else if(request.getParameter("ho")!=null)
				response.sendRedirect("/Assignment2/watch-product/index");
			else 
				response.sendRedirect("/Assignment2/favorite/index");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void share(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Users user = (Users) request.getSession().getAttribute("user");
			Properties p = new Properties();
            p.put("mail.smtp.auth", "true");
            p.put("mail.smtp.starttls.enable", "true");
            p.put("mail.smtp.ssl.protocols", "TLSv1.2");
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.put("mail.smtp.port", 587);
            p.put("mail.debug", "true");  
            Session s = Session.getDefaultInstance(p, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("sonntps26480@fpt.edu.vn", "cvbwdoueiyqeonxg");
                }
            });
            javax.mail.Message msg = new MimeMessage(s);
            msg.setFrom(new InternetAddress("paintvn000@gmail.com"));
            msg.setRecipients(javax.mail.Message.RecipientType.TO, InternetAddress.parse(request.getParameter("email")));
            String subject = "VIDEO SHARE FROM "+user.getFullname().toUpperCase();
            msg.setSubject(subject);
            String content = "Link to video: http://localhost:8080/Assignment2/watch-product/detail?id="+request.getParameter("videoId");
            MimeMultipart mimeMultipart = new MimeMultipart();
            MimeBodyPart mimeBodyPart = new MimeBodyPart();
            mimeBodyPart.setContent(content, "text/html; charset=utf-8");
            mimeMultipart.addBodyPart(mimeBodyPart);
            msg.setContent(mimeMultipart);
            Transport.send(msg);
            request.setAttribute("success_email", true);
            ShareDAO shDao = new ShareDAO();
            VideoDAO vdDao = new VideoDAO();
            Share sh = new Share();
            sh.setUser(user);
            sh.setShareDate(new Date());
            sh.setVideo(vdDao.findByPoster(request.getParameter("videoId")));
            shDao.create(sh);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error_email", "Send fail!");
			// TODO: handle exception
		}
	}
	
	public void unlike(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Users user = (Users) request.getSession().getAttribute("user");
			fDao.removeByVideo(request.getParameter("id"), user.getId());
			VideoDAO vdDao = new VideoDAO();
			if(request.getParameter("dt")!=null)
				response.sendRedirect("/Assignment2/watch-product/detail?id="+vdDao.findById(request.getParameter("id")).getPoster());
			else if(request.getParameter("ho")!=null)
				response.sendRedirect("/Assignment2/watch-product/index");
			else 
				response.sendRedirect("/Assignment2/favorite/index");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
