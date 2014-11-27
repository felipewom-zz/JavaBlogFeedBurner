package br.com.felipe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import br.com.felipe.entity.Blog;
import br.com.felipe.entity.User;
import br.com.felipe.repository.BlogRepository;
import br.com.felipe.repository.UserRepository;

@Service
public class BlogService {
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	public void save(Blog blog, String username) {
		User user = userRepository.findByUsername(username);
		blog.setUser(user);
		blogRepository.save(blog);
	}
	
	@PreAuthorize("#blog.user.username == authentication.username or hasRole('ROLE_ADMIN')")
	public void delete(@P("blog") Blog  blog) {
		blogRepository.delete(blog);
	}

	public Blog findOne(int id) {
		return blogRepository.findOne(id);
	}
}
