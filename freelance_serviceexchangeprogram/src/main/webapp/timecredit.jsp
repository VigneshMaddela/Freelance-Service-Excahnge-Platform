<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Time Credit - Freelance Fusion</title>
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
        .time-bank {
            margin-top: 100px; /* Space for fixed header */
            padding: 20px;
        }
        .balance {
            text-align: center;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        .transactions {
            margin-top: 20px;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }
        .filter {
            margin-bottom: 20px;
            text-align: center;
        }
        .filter label {
            margin-right: 10px;
        }
        .filter select {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #333; /* Dark gray */
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1; /* Light gray */
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

    <div class="time-bank">
        <section class="balance">
            <h1>Time Bank</h1>
            <p>Your current balance is: <strong>10 hours</strong></p>
        </section>
        <section class="transactions">
            <h2>Transaction History</h2>
            <div class="filter">
                <label for="filter">Filter by type:</label>
                <select id="filter" onchange="filterTransactions()">
                    <option value="All">All</option>
                    <option value="Credit">Credit</option>
                    <option value="Debit">Debit</option>
                </select>
            </div>
            <table id="transaction-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Amount (hours)</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2024-07-15</td>
                        <td>Credit</td>
                        <td>5</td>
                        <td>Service exchange with User123</td>
                    </tr>
                    <tr>
                        <td>2024-07-16</td>
                        <td>Debit</td>
                        <td>2</td>
                        <td>Service provided to User456</td>
                    </tr>
                    <!-- Add more transactions as needed -->
                </tbody>
            </table>
        </section>
    </div>

    <div class="footer">
        <p>&copy; 2024 Freelance Fusion. All rights reserved.</p>
    </div>

    <script>
        function filterTransactions() {
            const filterValue = document.getElementById('filter').value;
            const rows = document.querySelectorAll('#transaction-table tbody tr');

            rows.forEach(row => {
                const type = row.children[1].textContent;
                if (filterValue === 'All' || type === filterValue) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>
