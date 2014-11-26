package br.com.felipe.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.felipe.entity.Blog;
import br.com.felipe.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer>{
	List<Blog> findByUser(User user);
}
