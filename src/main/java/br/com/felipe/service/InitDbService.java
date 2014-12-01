package br.com.felipe.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import br.com.felipe.entity.Blog;
import br.com.felipe.entity.Role;
import br.com.felipe.entity.User;
import br.com.felipe.repository.BlogRepository;
import br.com.felipe.repository.ItemRepository;
import br.com.felipe.repository.RoleRepository;
import br.com.felipe.repository.UserRepository;

@Transactional
@Service
public class InitDbService {
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private ItemRepository itemRepository;
	
	@PostConstruct
	public void init() {
		if(roleRepository.findByName("ROLE_ADMIN") == null) {
			Role roleUser = new Role();
			roleUser.setName("ROLE_USER");
			roleRepository.save(roleUser);
			
			Role roleAdmin = new Role();
			roleAdmin.setName("ROLE_ADMIN");
			roleRepository.save(roleAdmin);
			
			User userAdmin = new User();
			userAdmin.setUsername("admin");
			userAdmin.setName("Admin da Silva");
			userAdmin.setEnabled(true);
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			userAdmin.setPassword(encoder.encode("admin"));
			userAdmin.setEmail("admin@admin.com");
			List<Role> roles = new ArrayList<Role>();
			roles.add(roleUser);
			roles.add(roleAdmin);
			userAdmin.setRoles(roles);
			userRepository.save(userAdmin);
			
			Blog blogJavaVids = new Blog();
			blogJavaVids.setName("JavaVids");
			blogJavaVids.setUrl("http://feeds.feedburner.com/javavids?format=xml");
			blogJavaVids.setUser(userAdmin);
			blogRepository.save(blogJavaVids);
		}
		
//		Item item1 = new Item();
//		item1.setBlog(blogJavaVids);
//		item1.setTitle("First");
//		item1.setLink("http://www.javavids.com");
//		item1.setPublishedDate(new Date());
//		itemRepository.save(item1);
//		
//		Item item2 = new Item();
//		item2.setBlog(blogJavaVids);
//		item2.setTitle("Second");
//		item2.setLink("http://www.javavids.com");
//		item2.setPublishedDate(new Date());
//		itemRepository.save(item2);
	}
}
