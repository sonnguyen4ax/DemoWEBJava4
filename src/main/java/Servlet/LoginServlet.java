package Servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;



import org.apache.commons.beanutils.BeanUtils;

import entities.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.UserDAO;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet({
	"/login/index",
	"/login/sign-in",
	"/login/sign-up"
})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO usDao = new UserDAO();

    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String forward = "/views/login.jsp";
		String uri = request.getRequestURI();
		if(uri.contains("index")) {
			if(request.getParameter("sign-out")!=null) {
				request.getSession().removeAttribute("user");
			}
			forward = "/views/login.jsp";
		}
		request.getRequestDispatcher(forward).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		if(uri.contains("sign-in")) {
			signIn(request, response);
		}
		else if(uri.contains("sign-up")) {
			signUp(request, response);
		}
	}
	
	public void signIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Users user = usDao.findOne(request.getParameter("username"), request.getParameter("password"));
			request.getSession().setAttribute("user", user);
			response.sendRedirect("/Assignment2/watch-product/index");
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("errorLoginMessage", "Login fail!");
			request.getRequestDispatcher("/views/login.jsp").forward(request, response);
		}
	}
	
	public void signUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		try {
			Users user = usDao.findById(request.getParameter("id"));
			if(request.getParameter("id") == "" || request.getParameter("email") == "" || request.getParameter("password") == "") {
				request.setAttribute("errorSignUpMessage", "Empty input!");
			}
			else if(user != null){
				request.setAttribute("errorSignUpMessage", "Username exists!");
			}
			else {
				Users us = new Users();
				BeanUtils.populate(us, request.getParameterMap());
				usDao.create(us);
				request.setAttribute("successSignUpMessage", "Sign up success!");
			}
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("errorSignUpMessage", "Sign up fail!");
		}
		request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	}

}
