<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Review - Freelance Service Exchange Platform</title>
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
        .review-section {
            margin-top: 100px; /* Space for fixed header */
            padding: 20px;
        }
        .review-section h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .review-form {
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .review-form input[type="text"],
        .review-form textarea {
            width: 100%;
            padding: 15px;
            margin-bottom: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            outline: none;
        }
        .review-form textarea {
            height: 100px;
            resize: vertical;
        }
        .review-form input[type="submit"] {
            padding: 15px 25px;
            font-size: 16px;
            background-color: #333; /* Dark gray */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .review-form input[type="submit"]:hover {
            background-color: #555; /* Slightly lighter gray */
        }
        .review-list {
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        .review-card {
            padding: 15px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }
        .review-card h3 {
            margin-top: 0;
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

    <div class="review-section">
        <section class="review-form">
            <h1>Submit a Review</h1>
            <form action="submitReview" method="post">
                <input type="text" name="reviewTitle" placeholder="Review Title" required>
                <textarea name="reviewBody" placeholder="Write your review here..." required></textarea>
                <input type="submit" value="Submit Review">
            </form>
        </section>
        <section class="review-list">
            <h1>Recent Reviews</h1>
            <div class="review-cards">
                <%-- Example review list rendering --%>
                <div class="review-card">
                    <h3>Great Service!</h3>
                    <p><strong>Reviewed by:</strong> Vignesh</p>
                    <p>Great service Provided by Manoj, he is excellent in work and fast too.</p>
                </div>
                <div class="review-card">
                    <h3>Excellent Work</h3>
                    <p><strong>Reviewed by:</strong> User456</p>
                    <p>Curabitur ac risus eu justo ultricies dictum non ac libero. Sed efficitur euismod leo.</p>
                </div>
                <!-- Add more reviews as needed -->
            </div>
        </section>
    </div>

    <div class="footer">
        <p>&copy; 2024 Freelance Fusion. All rights reserved.</p>
    </div>
</body>
</html>
