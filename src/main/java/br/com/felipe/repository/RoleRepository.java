package br.com.felipe.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.felipe.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Integer>{

	Role findByName(String name);

}
