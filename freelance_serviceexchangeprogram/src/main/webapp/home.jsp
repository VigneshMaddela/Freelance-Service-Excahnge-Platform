<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Freelance Fusion</title>
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
        .search-results {
            margin: 40px auto;
            padding: 20px;
            width: 80%;
            background: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        .search-results h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .result-item {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .result-item h3 {
            margin: 0;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">
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
            <a href="logout" class="button">Log Out</a>
        </div>
    </div>

    <div class="search-container">
        <h1>Find the Right Service</h1>
        <form action="search" method="get">
            <input type="text" name="query" placeholder="What are you looking for?" value="<%= request.getAttribute("query") != null ? request.getAttribute("query") : "" %>">
            <input type="submit" value="Search">
        </form>
    </div>

    <div class="search-results">
        <h2>Search Results</h2>
        <% 
            ResultSet results = (ResultSet) request.getAttribute("searchResults");
            if (results != null) {
                boolean hasResults = false;
                while (results.next()) {
                    hasResults = true;
                    String skillName = results.getString("skill_name");
                    String username = results.getString("username");
        %>
            <div class="result-item">
                <h3><%= skillName %></h3>
                <p>Username: <%= username %></p>
            </div>
        <% 
                }
                if (!hasResults) {
        %>
            <p>No results found for "<%= request.getAttribute("query") %>".</p>
        <% 
                }
            } else {
        %>
            <p>No results found for "<%= request.getAttribute("query") %>".</p>
        <% 
            }
        %>
    </div>

    <div class="featured">
        <h2>Featured Categories</h2>
        <div class="category">
            <div onclick="window.location.href='skill.jsp'">
                <h3>Manage Skills</h3>
                <p>Manage Your Skills.</p>
            </div>
            <div onclick="window.location.href='serviceexchange.jsp'">
                <h3>Service Exchange</h3>
                <p>View Service Exchange.</p>
            </div>
            <div onclick="window.location.href='timecredit.jsp'">
                <h3>Time Credit</h3>
                <p>See your Time Credit.</p>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2024 Freelance Fusion. All rights reserved.</p>
    </div>
</body>
</html>
