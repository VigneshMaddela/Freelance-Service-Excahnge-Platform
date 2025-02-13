<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Skills - Freelance Service Exchange Platform</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .header {
            background-color: #333; /* Dark gray */
            color: white;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        .header .logo {
            display: flex;
            align-items: center;
        }
        .header .logo img {
            height: 40px;
        }
        .header .logo .title {
            margin-left: 10px;
            font-size: 24px;
        }
        .header .nav {
            display: flex;
            align-items: center;
        }
        .header .nav a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            padding: 10px;
        }
        .header .nav a:hover {
            background-color: #555; /* Slightly lighter gray */
            border-radius: 5px;
        }
        .search-container {
            margin-top: 100px; /* Space for fixed header */
            text-align: center;
            padding: 40px;
            background-color: #ffffff;
        }
        .search-container input[type="text"] {
            width: 60%;
            padding: 15px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
        }
        .search-container input[type="submit"] {
            padding: 15px 25px;
            font-size: 16px;
            background-color: #333; /* Dark gray */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
        }
        .search-container input[type="submit"]:hover {
            background-color: #555; /* Slightly lighter gray */
        }
        .featured {
            margin: 40px auto;
            padding: 20px;
            width: 80%;
            background: linear-gradient(to bottom, #000000, #434343); /* Black gradient */
            color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        .featured h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .featured .category {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }
        .featured .category div {
            width: 30%;
            margin-bottom: 20px;
            padding: 20px;
            background-color: #333; /* Darker gray for each category */
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            text-align: center;
            cursor: pointer;
        }
        .featured .category div img {
            height: 100px;
            margin-bottom: 10px;
        }
        .featured .category div:hover {
            background-color: #555; /* Slightly lighter gray */
        }
        .footer {
            background-color: #333; /* Dark gray */
            color: white;
            text-align: center;
            padding: 20px;
            position: relative;
            bottom: 0;
            width: 100%;
        }
        .content {
            margin-top: 100px;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 5px;
        }
        .input-field {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: calc(100% - 130px);
            margin-right: 10px;
        }
        .btn {
            padding: 10px 15px;
            background-color: #333; /* Dark gray */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #555; /* Slightly lighter gray */
        }
        .error-message, .success-message {
            margin: 10px 0;
        }
        .error-message p {
            color: #d9534f;
        }
        .success-message p {
            color: #5bc0de;
        }
        .search-results {
            margin-top: 20px;
        }
        .search-result-item {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">
            <!-- <img src="images/logo.png" alt="Logo" onerror="this.onerror=null;this.src='images/default.png';"> -->
            <div class="title">Freelance Fusion</div>
        </div>
        <div class="nav">
            <a href="home.jsp">Home</a>
            <a href="user.jsp">User</a>
            <a href="skill.jsp">Skill</a>
            <a href="serviceexchange.jsp">Service Exchange</a>
            <a href="timecredit.jsp">Time Credit</a>
            <a href="review.jsp">Review</a>
            <a href="project.jsp">Project</a>
            <a href="logout" class="btn">Log Out</a>
        </div>
    </div>

    <div class="content">
        <h1>Manage Skills</h1>

        <form action="searchSkill" method="get" class="search-container">
            <input type="text" name="searchSkill" placeholder="Enter skill to search" class="input-field">
            <button type="submit" class="btn">Search</button>
        </form>

        <hr>

        <div class="error-message">
            <% 
                String error = (String) request.getAttribute("error");
                if (error != null) { %>
                    <p><%= error %></p>
            <% } %>
        </div>

        <div class="success-message">
            <% 
                String success = (String) request.getAttribute("success");
                if (success != null) { %>
                    <p><%= success %></p>
            <% } %>
        </div>

        <div class="message">
            <% 
                String message = (String) request.getAttribute("message");
                if (message != null) { %>
                    <p><%= message %></p>
            <% } %>
        </div>

        <h2>Search Results</h2>
        <div class="search-results">
            <% 
                List<String> skills = (List<String>) request.getAttribute("skills");
                if (skills != null && !skills.isEmpty()) {
                    for (String skill : skills) {
                        List<String> users = (List<String>) request.getAttribute("usersForSkill_" + skill);
                        %>
                        <div class="search-result-item">
                            <strong><%= skill %></strong>
                            <ul>
                                <% if (users != null && !users.isEmpty()) {
                                    for (String user : users) { %>
                                        <li><%= user %></li>
                                    <% } 
                                } else { %>
                                    <li>No users found for this skill.</li>
                                <% } %>
                            </ul>
                        </div>
                        <% 
                    }
                } else { %>
                    <p>No skills found for the search term.</p>
                <% } 
            %>
        </div>

        <h2>Add Skill</h2>
        <form action="addskill" method="post" class="search-container">
            <label for="skill_name">Skill Name:</label>
            <input type="text" id="skill_name" name="skill_name" class="input-field" required>
            <button type="submit" class="btn">Add Skill</button>
        </form>
    </div>

    <div class="footer">
        <p>&copy; 2024 Freelance Fusion. All rights reserved.</p>
    </div>
</body>
</html>
