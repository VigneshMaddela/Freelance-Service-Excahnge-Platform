<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Service Exchange - Freelance Service Exchange Platform</title>
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
        .service-exchange {
            margin-top: 100px; /* Space for fixed header */
            padding: 20px;
        }
        .service-exchange h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        .service-list {
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        .service-card {
            padding: 15px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }
        .service-card:hover {
            background-color: #f1f1f1;
        }
        .service-detail {
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            margin-top: 20px;
        }
        .service-detail h3 {
            margin-top: 0;
        }
        .service-detail ul {
            list-style-type: disc;
            padding-left: 20px;
        }
        .service-detail button {
            padding: 10px 15px;
            background-color: #333; /* Dark gray */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
        .service-detail button:hover {
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

    <div class="service-exchange">
        <section class="service-list">
            <h1>Service Exchange</h1>
            <div class="service-cards">
                <%-- Example service list rendering --%>
                <div class="service-card" onclick="showServiceDetail('1')">
                    <h2>Graphic Design</h2>
                    <p>Description: Create marketing materials for a new product.</p>
                    <p>Offered By: User123</p>
                </div>
                <div class="service-card" onclick="showServiceDetail('2')">
                    <h2>Content Writing</h2>
                    <p>Description: Write blog posts about technology trends.</p>
                    <p>Offered By: User456</p>
                </div>
                <!-- Add more services as needed -->
            </div>
        </section>
        <section class="service-detail" id="service-detail" style="display: none;">
            <h2>Service Details</h2>
            <h3 id="service-title"></h3>
            <p id="service-description"></p>
            <p id="service-offered-by"></p>
            <button onclick="hideServiceDetail()">Close</button>
        </section>
    </div>

    <div class="footer">
        <p>&copy; 2024 Freelance Fusion. All rights reserved.</p>
    </div>

    <script>
        const services = [
            { id: 1, title: 'Graphic Design', description: 'Create marketing materials for a new product.', offeredBy: 'User123' },
            { id: 2, title: 'Content Writing', description: 'Write blog posts about technology trends.', offeredBy: 'User456' },
            // Add more services as needed
        ];

        function showServiceDetail(serviceId) {
            const service = services.find(s => s.id == serviceId);
            if (service) {
                document.getElementById('service-title').textContent = service.title;
                document.getElementById('service-description').textContent = service.description;
                document.getElementById('service-offered-by').textContent = 'Offered By: ' + service.offeredBy;
                document.getElementById('service-detail').style.display = 'block';
            }
        }

        function hideServiceDetail() {
            document.getElementById('service-detail').style.display = 'none';
        }
    </script>
</body>
</html>
