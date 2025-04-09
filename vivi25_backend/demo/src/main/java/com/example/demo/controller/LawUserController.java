package com.example.demo.controller;

import com.example.demo.model.LawUser;
import com.example.demo.repository.LawUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import com.example.demo.model.LawUser;
import com.example.demo.repository.LawUserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api")
public class LawUserController {

    @Autowired
    private LawUserRepository lawUserRepository;

    @PostMapping("/register")
    public ResponseEntity<Map<String, Object>> registerUser(@RequestBody LawUser user) {
        Map<String, Object> response = new HashMap<>();

        try {
            // Check if username or email already exists
            if (lawUserRepository.existsByUsername(user.getUsername())) {
                response.put("success", false);
                response.put("message", "Username already exists");
                return ResponseEntity.badRequest().body(response);
            }

            if (lawUserRepository.existsByEmail(user.getEmail())) {
                response.put("success", false);
                response.put("message", "Email already exists");
                return ResponseEntity.badRequest().body(response);
            }

            // Validate password match
            if (!user.getPassword().equals(user.getConfirmPassword())) {
                response.put("success", false);
                response.put("message", "Passwords do not match");
                return ResponseEntity.badRequest().body(response);
            }

            // Save the user
            lawUserRepository.save(user);

            response.put("success", true);
            response.put("message", "Registration successful");
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Registration failed: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    @PostMapping("/login")
    public ResponseEntity<Map<String, Object>> loginUser(@RequestBody Map<String, String> credentials) {
        Map<String, Object> response = new HashMap<>();

        String input = credentials.get("input");
        String password = credentials.get("password");

        try {
            // Try to find by email or username
            Optional<LawUser> userOptional = lawUserRepository.findByEmailOrUsername(input, input);

            if (userOptional.isPresent()) {
                LawUser user = userOptional.get();

                // In a real application, you should use password hashing (like BCrypt)
                if (user.getPassword().equals(password)) {
                    response.put("success", true);
                    response.put("message", "Login successful");

                    // Create a user map without password for security
                    Map<String, Object> userResponse = new HashMap<>();
                    userResponse.put("id", user.getId());
                    userResponse.put("fullName", user.getFullName());
                    userResponse.put("username", user.getUsername());
                    userResponse.put("email", user.getEmail());
                    userResponse.put("isLawStudent", user.isLawStudent());
                    // Add other fields as needed

                    response.put("user", userResponse);
                    return ResponseEntity.ok(response);
                }
            }

            response.put("success", false);
            response.put("message", "Invalid credentials");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);

        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Login failed: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
}