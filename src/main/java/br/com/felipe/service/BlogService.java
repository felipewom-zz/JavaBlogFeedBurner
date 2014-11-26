package br.com.felipe.service;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	public void save(Blog blog, String name) {
		User user = userRepository.findByUsername(name);
		blog.setUser(user);
		blogRepository.save(blog);
	}
}
