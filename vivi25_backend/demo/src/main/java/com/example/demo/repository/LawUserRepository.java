package com.example.demo.repository;

import com.example.demo.model.LawUser;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface LawUserRepository extends JpaRepository<LawUser, Long> {
    boolean existsByUsername(String username);
    boolean existsByEmail(String email);
    Optional<LawUser> findByEmailOrUsername(String email, String username);
}