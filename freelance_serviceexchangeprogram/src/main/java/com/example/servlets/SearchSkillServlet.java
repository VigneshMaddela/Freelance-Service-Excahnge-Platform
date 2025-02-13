package com.example.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/searchSkill")
public class SearchSkillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/freelanceserviceexchange";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "Vignesh2005";

    private static final String SEARCH_SKILLS_QUERY = "SELECT DISTINCT skill_name FROM skills WHERE skill_name ILIKE ?";
    private static final String USERS_FOR_SKILL_QUERY = "SELECT username FROM skills WHERE skill_name = ?";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchSkill = request.getParameter("searchSkill");

        if (searchSkill == null || searchSkill.trim().isEmpty()) {
            request.setAttribute("error", "Skill cannot be empty");
            request.getRequestDispatcher("skill.jsp").forward(request, response);
            return;
        }

        List<String> skills = searchSkills(searchSkill);
        if (skills.isEmpty()) {
            request.setAttribute("message", "No skills found for the search term: " + searchSkill);
        } else {
            request.setAttribute("skills", skills);

            // Retrieve users for each skill
            for (String skill : skills) {
                List<String> users = getUsersForSkill(skill);
                request.setAttribute("usersForSkill_" + skill, users);
            }
        }

        // Forward to JSP
        request.getRequestDispatcher("skill.jsp").forward(request, response);
    }

    private List<String> searchSkills(String searchSkill) {
        List<String> skills = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(SEARCH_SKILLS_QUERY)) {
            stmt.setString(1, "%" + searchSkill + "%");
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    skills.add(rs.getString("skill_name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider using a logging framework
        }
        return skills;
    }

    private List<String> getUsersForSkill(String skillName) {
        List<String> users = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(USERS_FOR_SKILL_QUERY)) {
            stmt.setString(1, skillName);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    users.add(rs.getString("username"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider using a logging framework
        }
        return users;
    }
}
