<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Project Hub - Freelance Fusion</title>
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
        .project-hub {
            margin-top: 100px; /* Space for fixed header */
            padding: 20px;
        }
        .projects-list {
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        .project-card {
            padding: 15px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }
        .project-card:hover {
            background-color: #f1f1f1;
        }
        .project-detail {
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            margin-top: 20px;
        }
        .project-detail h3 {
            margin-top: 0;
        }
        .project-detail ul {
            list-style-type: disc;
            padding-left: 20px;
        }
        .project-detail button {
            padding: 10px 15px;
            background-color: #333; /* Dark gray */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }
        .project-detail button:hover {
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

    <div class="project-hub">
        <section class="projects-list">
            <h1>Project Hub</h1>
            <div class="project-cards">
                <%-- Example project list rendering --%>
                <div class="project-card" onclick="showProjectDetail('1')">
                    <h2>Website Redesign</h2>
                    <p>Redesign the company website to improve UX.</p>
                    <p>Status: Ongoing</p>
                </div>
                <div class="project-card" onclick="showProjectDetail('2')">
                    <h2>Marketing Campaign</h2>
                    <p>Develop a marketing campaign for the new product launch.</p>
                    <p>Status: Completed</p>
                </div>
                <!-- Add more projects as needed -->
            </div>
        </section>
        <section class="project-detail" id="project-detail" style="display: none;">
            <h2>Project Details</h2>
            <h3 id="project-title"></h3>
            <p id="project-description"></p>
            <p id="project-status"></p>
            <h4>Milestones:</h4>
            <ul id="project-milestones">
                <!-- Milestones will be added here -->
            </ul>
            <button onclick="hideProjectDetail()">Close</button>
        </section>
    </div>

    <div class="footer">
        <p>&copy; 2024 Freelance Fusion. All rights reserved.</p>
    </div>

    <script>
        const projects = [
            { id: 1, title: 'Website Redesign', description: 'Redesign the company website to improve UX.', status: 'Ongoing', milestones: ['Design Phase', 'Development Phase'] },
            { id: 2, title: 'Marketing Campaign', description: 'Develop a marketing campaign for the new product launch.', status: 'Completed', milestones: ['Planning', 'Execution', 'Review'] },
            // Add more projects as needed
        ];

        function showProjectDetail(projectId) {
            const project = projects.find(p => p.id == projectId);
            if (project) {
                document.getElementById('project-title').textContent = project.title;
                document.getElementById('project-description').textContent = project.description;
                document.getElementById('project-status').textContent = 'Status: ' + project.status;
                const milestonesList = document.getElementById('project-milestones');
                milestonesList.innerHTML = '';
                project.milestones.forEach(milestone => {
                    const li = document.createElement('li');
                    li.textContent = milestone;
                    milestonesList.appendChild(li);
                });
                document.getElementById('project-detail').style.display = 'block';
            }
        }

        function hideProjectDetail() {
            document.getElementById('project-detail').style.display = 'none';
        }
    </script>
</body>
</html>
