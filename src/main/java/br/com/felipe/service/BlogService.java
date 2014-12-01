package br.com.felipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.access.method.P;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import br.com.felipe.entity.Blog;
import br.com.felipe.entity.Item;
import br.com.felipe.entity.User;
import br.com.felipe.exception.RssException;
import br.com.felipe.repository.BlogRepository;
import br.com.felipe.repository.ItemRepository;
import br.com.felipe.repository.UserRepository;

@Service
public class BlogService {

	@Autowired
	private BlogRepository blogRepository;

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RssService rssService;
	
	@Autowired
	private ItemRepository itemRepository;
	
	public void saveItems(Blog blog) {
		try {
			List<Item> items = rssService.getItems(blog.getUrl());
			for (Item item : items) {
				Item savedItem = itemRepository.findByBlogAndLink(blog, item.getLink());
				if(savedItem == null) {
					item.setBlog(blog);
					itemRepository.save(item);
				}
			}
		} catch (RssException e) {
			e.printStackTrace();
		}
	}
	
	//1 hour = 60 seconds * 60 minutes * 1000 milliseconds
	@Scheduled(fixedDelay=3600000)
	public void reloadBlogs() {
		List<Blog> blogs = blogRepository.findAll();
		for (Blog blog : blogs) {
			saveItems(blog);
		}
	}
	
	public void save(Blog blog, String username) {
		User user = userRepository.findByUsername(username);
		blog.setUser(user);
		blogRepository.save(blog);
		saveItems(blog);
	}
	
	@PreAuthorize("#blog.user.username == authentication.username or hasRole('ROLE_ADMIN')")
	public void delete(@P("blog") Blog  blog) {
		blogRepository.delete(blog);
	}

	public Blog findOne(int id) {
		return blogRepository.findOne(id);
	}
}
