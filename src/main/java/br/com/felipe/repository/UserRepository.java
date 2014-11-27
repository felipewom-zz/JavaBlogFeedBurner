package br.com.felipe.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.felipe.entity.User;

public interface UserRepository extends JpaRepository<User, Integer>{
	User findByUsername(String username);

	User findByEmail(String email);

}
