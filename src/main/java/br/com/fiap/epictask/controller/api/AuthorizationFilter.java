package br.com.fiap.epictask.controller.api;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import br.com.fiap.epictask.service.TokenService;

public class AuthorizationFilter extends OncePerRequestFilter {
	
	private TokenService tokenService;

	@Override
	protected void doFilterInternal(
				HttpServletRequest request, 
				HttpServletResponse response, 
				FilterChain filterChain)
			throws ServletException, IOException {
		
		String token = extractToken(request);
		System.out.println(token);
		
		tokenService = new TokenService();
		boolean valid = tokenService.isValid(token);
		
		if (valid) {
			authenticateUser(token);
		}
		
		filterChain.doFilter(request, response);
		
	}

	private void authenticateUser(String token) {
		tokenService = new TokenService();
		Long id = tokenService.getUserId(token);
		
	}

	private String extractToken(HttpServletRequest request) {
		String header = request.getHeader("Authorization");
		if (header == null || header.isEmpty() || !header.startsWith("Bearer ") )
			return null;
		
		return header.substring(7, header.length());
		
	}

}
