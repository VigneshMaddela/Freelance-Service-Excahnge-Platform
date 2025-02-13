package com.example.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/addskill")
public class AddSkillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/freelanceserviceexchange";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "Vignesh2005";

    // SQL query
    private static final String INSERT_SKILL_QUERY = "INSERT INTO skills (username, skill_name) VALUES (?, ?)";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username"); // Retrieve username from session
        String skillName = request.getParameter("skill_name");

        // Validate input
        if (username == null || skillName == null || skillName.isEmpty()) {
            response.sendRedirect("skill.jsp?error=Invalid%20input");
            return;
        }

        // Insert new skill
        boolean isSkillAdded = addSkill(username, skillName);

        if (isSkillAdded) {
            response.sendRedirect("skill.jsp?success=Skill%20added%20successfully");
        } else {
            response.sendRedirect("skill.jsp?error=Could%20not%20add%20skill");
        }
    }

    private boolean addSkill(String username, String skillName) {
        // Explicitly load the PostgreSQL JDBC driver
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("PostgreSQL Driver not found.", e);
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(INSERT_SKILL_QUERY)) {
            stmt.setString(1, username);
            stmt.setString(2, skillName);
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
