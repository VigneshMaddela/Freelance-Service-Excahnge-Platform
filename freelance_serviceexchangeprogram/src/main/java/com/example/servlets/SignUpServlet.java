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
import com.example.models.User;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:postgresql://localhost:5432/freelanceserviceexchange";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "Vignesh2005";

    // SQL query
    private static final String INSERT_USER_QUERY = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); // Assuming role is provided

        // Validate input
        if (username == null || email == null || password == null || role == null ||
            username.isEmpty() || email.isEmpty() || password.isEmpty() || role.isEmpty()) {
            response.sendRedirect("signup.jsp?error=Invalid%20input");
            return;
        }

        // Create user object
        User user = new User(username, email, password, role);

        // Insert new user
        boolean isUserCreated = createUser(user);

        if (isUserCreated) {
            response.sendRedirect("login.jsp?success=Account%20created%20successfully");
        } else {
            response.sendRedirect("signup.jsp?error=Could%20not%20create%20account");
        }
    }

    private boolean createUser(User user) {
        // Explicitly load the PostgreSQL JDBC driver
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("PostgreSQL Driver not found.", e);
        }

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(INSERT_USER_QUERY)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getRole());
            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
