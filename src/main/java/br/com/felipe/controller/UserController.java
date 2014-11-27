package br.com.felipe.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.felipe.entity.Blog;
import br.com.felipe.entity.User;
import br.com.felipe.service.BlogService;
import br.com.felipe.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private BlogService blogService;

	@ModelAttribute("user")
	public User constructUser() {
		return new User();
	}

	@ModelAttribute("blog")
	public Blog constructBlogs() {
		return new Blog();
	}

	@RequestMapping("/account")
	public String account(Model model, Principal principal) {
		String username = principal.getName();
		model.addAttribute("user", userService.findOneWithBlogs(username));
		return "account"; //in general.xml -> definition name="account"
	}

	@RequestMapping(value = "/account", method = RequestMethod.POST)
	public String doAddBlog(Model model,
			@Valid @ModelAttribute("blog") Blog blog, BindingResult result,
			Principal principal) {
		if (result.hasErrors()) {
			return account(model, principal);
		}
		String username = principal.getName();
		blogService.save(blog, username);
		return "redirect:/account.html";
	}

	@RequestMapping("/blog/remove/{id}")
	public String removeBlog(@PathVariable int id) {
		Blog blog = blogService.findOne(id);
		blogService.delete(blog);
		return "redirect:/account.html";
	}
}
