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
		List<String> roles = new ArrayList<>();
		authentication.getAuthorities().forEach(auth -> {
			roles.add(auth.getAuthority());
		});
		if(roles.contains("A01")) {
			response.sendRedirect("/admin/home");
			return;
		}
		response.sendRedirect("/");
	}
	
}
