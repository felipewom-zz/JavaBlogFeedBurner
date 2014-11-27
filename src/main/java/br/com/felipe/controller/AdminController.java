package br.com.felipe.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.felipe.entity.User;
import br.com.felipe.service.UserService;

@Controller
@RequestMapping("/users")
public class AdminController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping
	public String users(Model model) {
		model.addAttribute("users", userService.findAll());
		return "users";
	}

	@RequestMapping("/{id}")
	public String details(Model model, @PathVariable int id, Principal principal) {
		String username = principal.getName();
		User user = userService.findOneWithBlogs(id);
		model.addAttribute("user", user);
		if( user.getUsername() == username) {
			return "account";
		}
		return "user-details";
	}
	
	@RequestMapping("/remove/{id}")
	public String removeUser(@PathVariable int id) {
		userService.delete(id);
		return "redirect:/users.html";
	}
}
