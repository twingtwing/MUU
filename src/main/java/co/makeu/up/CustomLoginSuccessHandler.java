package co.makeu.up;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		List<String> roleNames = new ArrayList<String>();
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		if(roleNames.contains("A01")) {
			response.sendRedirect("/admin/home"); // /admin/** ~ 형식으로만 넣으면 됨. 알아서
		}
		if(roleNames.contains("A03")) {
			response.sendRedirect("/creator/home"); // /creator/** ~ 형식으로만 넣으면 됨. 알아서
		}
		response.sendRedirect("/home");
	}
	
}
