@WebServlet("/user")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:postgresql://localhost:5432/freelanceserviceexchange";
    private static final String DB_USER = "postgres";
    private static final String DB_PASSWORD = "Vignesh2005";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");

        if (username != null && !username.trim().isEmpty()) {
            User user = getUserFromDatabase(username);
            if (user != null) {
                request.setAttribute("user", user);
            } else {
                request.setAttribute("error", "User not found.");
            }
        } else {
            request.setAttribute("error", "Invalid username.");
        }

        request.getRequestDispatcher("user.jsp").forward(request, response);
    }

    private User getUserFromDatabase(String username) {
        User user = null;
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT username, password FROM users WHERE username = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, username);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String password = rs.getString("password");
                        user = new User(username, password);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
