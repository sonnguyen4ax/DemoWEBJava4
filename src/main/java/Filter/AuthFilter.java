package Filter;

import java.io.IOException;
import java.util.Date;



import entities.Users;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebFilter({
	"/admin/*",
	"/profile/*",
	"/favorite/*",
	"/like",
	"/share",
	"/unlike",
	"/watch-product/comment"
})
public class AuthFilter implements HttpFilter {

	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		String uri = req.getRequestURI();
		Users user = (Users) req.getSession().getAttribute("user");
		String error = "";
		if(user == null) {
			error = resp.encodeURL("Vui lòng đăng nhập!");
			resp.sendRedirect("/Assignment2/login/index?error="+error);
		}
		else if(!user.getAdmin() && uri.contains("/admin/")){
			error = resp.encodeURL("Vui lòng đăng nhập với vai trò Admin!");
			resp.sendRedirect("/Assignment2/login/index?error="+error);
		}
		else {
			chain.doFilter(req, resp);
		}
	}

}
