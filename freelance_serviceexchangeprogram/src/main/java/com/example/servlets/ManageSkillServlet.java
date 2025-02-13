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

@WebServlet("/manageSkill")
public class ManageSkillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/freelanceserviceexchange";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "Vignesh2005";

    private static final String INSERT_UPDATE_SKILL_QUERY = "INSERT INTO skills (username, skill_name) VALUES (?, ?) ON CONFLICT (username, skill_name) DO UPDATE SET skill_name = EXCLUDED.skill_name";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String skillName = request.getParameter("skill_name");

        if (skillName == null || skillName.isEmpty()) {
            response.sendRedirect("skill.jsp?error=Skill%20cannot%20be%20empty");
            return;
        }

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp?error=You%20must%20be%20logged%20in%20to%20add%20skills");
            return;
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(INSERT_UPDATE_SKILL_QUERY)) {
            stmt.setString(1, username);
            stmt.setString(2, skillName);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("skill.jsp?error=An%20error%20occurred%20while%20updating%20the%20skill");
            return;
        }

        response.sendRedirect("skill.jsp?success=Skill%20added/updated%20successfully");
    }
}
