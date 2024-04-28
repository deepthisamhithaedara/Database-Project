<%@ page import="java.sql.*" import="oracle.jdbc.OracleTypes" import="java.math.BigDecimal" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #dashboardHeader {
            text-align: center;
            color: #4CAF50; /* Set the color to green */
        }

        #main-container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            width: 100%;
            margin-top: 20px;
        }

        #left-container {
            display: flex;
            flex-direction: row;
            width: 10%;
        }

        #right-container {
            flex-direction: column;
            width: 80%;
            overflow-x: auto;

            /* Adjusted width */
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            margin-bottom: 10px;
            display: block;
            width: 200px; /* Adjust width as needed */
        }

        button:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }
        #label {
           display: block; /* Makes the label a block element, which will position it above the button */
           margin-bottom: 5px;
           color:green;
        }

    </style>
</head>
<body>

    
    <div id="dashboardHeader">
        <h1>Hospital Dashboard</h1>
    </div>
    
       <div id="main-container">
        <div id="left-container">
            <form action="newjsp.jsp" method="GET">

        <label Id="label" for="getAllPatients">Patient Module:</label>
        <button type="submit" name="getAllPatients" value="true">Patients</button>
        <button type="button" onclick="toggleInsertForm()">Insert Patient</button>
        <button type="button" onclick="toggleUpdatePatientForm()">Assign Patient</button>
        <button type="submit" name="getPatientInfoView" value="true">Patients Doctor View</button>
        <button type="button" onclick="showDischargeForm()">Discharge Patient</button>
        <button type="button" onclick="showBillForm()">Bills</button>
        
        <br>
        <label Id="label" for="getEmployeeInfo">Employee Module:</label>
        <button type="submit" name="getEmployeeInfo" value="true">Employee Info</button>
        <button type="button" onclick="toggleInsertEmployeeForm()">Insert Employee</button>
        <button type="button" onclick="toggleDeleteEmployeeForm()">Delete Employee</button>
        <br>
        <label Id="label" for="getAllDoctors">Doctor Module:</label>
        <button type="submit" name="getAllDoctors" value="true">Doctors</button>
        <button type="button" onclick="toggleInsertDoctorForm()">Insert Doctor</button>
        <button type="submit" name="getDoctorPatientView" value="true">Doctor Patient View</button>
        <button type="button" onclick="toggleDeleteDoctorForm()">Delete Doctor</button>
        
        <br>
        <label Id="label" for="getNurses">Nurse Module:</label>
        <button type="submit" name="getNurses" value="true">Nurses</button>
        <button type="button" onclick="toggleInsertNurseForm()">Insert Nurse</button>
        <button type="submit" name="getNursePatientView" value="true">Nurse Patient View</button>
        <button type="button" onclick="toggleDeleteNurseForm()">Delete Nurse</button>
        <br>
        <label Id="label" for="getNurses">Other:</label>
        <button type="submit" name="getRoomInfo" value="true">Room</button> 
        <button type="submit" name="getEmergencyContacts" value="true">Emergency Contacts</button>
        <button type="button" onclick="window.location.href='index.html'">Logout</button>
    </form>
                    
            
        </div>

        <div id="right-container">
            <div id="resultsPanel">
                <!-- Results will be displayed here -->
                
    <!-- Form for inserting a new patient (initially hidden) -->
    <div id="insertForm" style="display: none;">
        <h3>Insert Patient:</h3>
        <form action="newjsp.jsp" method="POST">
            <label for="patientName">Patient Name:</label>
            <input type="text" id="patientName" name="patientName" required><br><br>
            <label for="patientSSN">Patient SSN:</label>
            <input type="text" id="patientSSN" name="patientSSN" required><br><br>
            <label for="patientBirthDate">Patient Birth Date (YYYY-MM-DD):</label>
            <input type="text" id="patientBirthDate" name="patientBirthDate" required><br><br>
            <label for="patientDescription">Description:</label>
             <input type="text" id="patientDescription" name="patientDescription"><br><br>
            <button type="submit" name="insertPatient" value="true">Insert Patient</button>
        </form>
    </div>
    

    <div id="insertEmployeeForm" style="display: none;">
        <h3>Insert Employee:</h3>
        <form action="newjsp.jsp" method="POST">
            <label for="employeeName">Employee Name:</label>
            <input type="text" id="employeeName" name="employeeName" required><br><br>
            <label for="startDate">Start Date (YYYY-MM-DD):</label>
            <input type="text" id="startDate" name="startDate" required><br><br>
            <label for="degree">Degree:</label>
            <input type="text" id="degree" name="degree" required><br><br>
            <label for="birthDate">Birth Date (YYYY-MM-DD):</label>
            <input type="text" id="birthDate" name="birthDate" required><br><br>
            <button type="submit" name="insertEmployee" value="true">Insert Employee</button>
        </form>
        <p> Note: Doctor Degree: MD, Nurse Degree: RN </p>
    </div>
    
    <div id="deleteEmployeeForm" style="display: none;">
    <h3>Delete Employee:</h3>
    <form action="newjsp.jsp" method="POST">
        <label for="employeeId">Employee ID:</label>
        <input type="text" id="employeeId" name="employeeId" required><br><br>
        <button type="submit" name="deleteEmployee" value="true">Delete Employee</button>
    </form>
</div>
    
    <div id="insertDoctorForm" style="display: none;">
        <h3>Insert Doctor:</h3>
        <h4> Note: First fill "Employee" as its superclass covering common information  </h4>
        <form action="newjsp.jsp" method="POST">
            <label for="specialty">Specialty:</label>
            <input type="text" id="specialty" name="specialty" required><br><br>
            <label for="office">Office:</label>
            <input type="text" id="office" name="office" required><br><br>
            <button type="submit" name="insertDoctor" value="true">Insert Doctor</button>
        </form>
    </div>
    
    <div id="deleteDoctorForm" style="display: none;">
    <h3>Delete Doctor:</h3>
    <form action="newjsp.jsp" method="POST">
        <label for="doctorId">Doctor ID:</label>
        <input type="text" id="doctorId" name="doctorId" required><br><br>
        <button type="submit" name="deleteDoctor" value="true">Delete Doctor</button>
    </form>
   </div>

    
    <div id="insertNurseForm" style="display: none;">
        <h3>Insert Nurse:</h3>
        <h4> Note: First fill "Employee" as its superclass covering common information  </h4>
        <form action="newjsp.jsp" method="POST">
            <label for="team">Team:</label>
            <input type="text" id="team" name="team" required><br><br>
            <label for="shift">Shift:</label>
            <input type="text" id="shift" name="shift" required><br><br>
            <button type="submit" name="insertNurse" value="true">Insert Nurse</button>
        </form>
    </div>
    
    <div id="deleteNurseForm" style="display: none;">
    <h3>Delete Nurse:</h3>
    <form action="newjsp.jsp" method="POST">
        <label for="nurseId">Nurse ID:</label>
        <input type="text" id="nurseId" name="nurseId" required><br><br>
        <button type="submit" name="deleteNurse" value="true">Delete Nurse</button>
    </form>
</div>
    
    
    <div id="updatePatientForm" style="display: none;">
    <h3>Assign Patient:</h3>
    <form action="newjsp.jsp" method="POST">
        <label for="patientID">Patient ID:</label>
        <input type="text" id="patientID" name="patientID" required><br><br>
        <label for="doctorID">Doctor ID:</label>
        <input type="text" id="doctorID" name="doctorID" required><br><br>
        <label for="nurseID">Nurse ID:</label>
        <input type="text" id="nurseID" name="nurseID" required><br><br>
        <label for="roomNumber">Room Number:</label>
        <input type="text" id="roomNumber" name="roomNumber" required><br><br>
        <button type="submit" name="updatePatient" value="true">Update Patient</button>
    </form>
    <%
        out.println("<h4> Note: Refer below for doctor,nurse and room info </h4>");
            try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // SQL query to retrieve all doctors
                String sql = "SELECT * FROM Doctor";

                // Create a statement and execute the query
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                 
                out.println();
                out.println();
                // Display all doctors in a table
                out.println("<h3>All Doctors</h3>");
                out.println("<table border='1'>");
                out.println("<tr><th>Employee ID</th><th>Specialty</th><th>Office</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("Employee_ID") + "</td>");
                    out.println("<td>" + rs.getString("Specialty") + "</td>");
                    out.println("<td>" + rs.getString("Office") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                // Close the result set, statement, and connection
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            
       try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // SQL query to retrieve Nurses results
                String sql = "SELECT * FROM Nurse";

                // Create a statement and execute the query
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                 
                out.println();
                out.println();
                out.println("<h3> All Nurses</h3>");
                // Generate HTML table for results
                out.println("<table>");
                out.println("<tr><th>Employee ID</th><th>Team</th><th>Shift</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("Employee_ID") + "</td>");
                    out.println("<td>" + rs.getString("Team") + "</td>");
                    out.println("<td>" + rs.getString("Shift") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                // Close the result set, statement, and connection
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            
        try {
            // JDBC URL, username, and password for your database
            String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
            String user = "dbteam3";
            String password = "F23dbteam3H";

            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish a database connection
            Connection conn = DriverManager.getConnection(url, user, password);

            // SQL query to retrieve room information
            String sql = "SELECT * FROM Room";

            // Create a statement and execute the query
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            // Display room information in a table
            out.println("<h3>Room Information</h3>");
            out.println("<table border='1'>");
            out.println("<tr><th>Room Number</th><th>Nurse ID</th><th>Occupancy</th><th>Precautions</th><th>Ward</th><th>Accommodations</th></tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("Room_Number") + "</td>");
                out.println("<td>" + rs.getInt("Nurse_ID") + "</td>");
                out.println("<td>" + rs.getString("Occupancy") + "</td>");
                out.println("<td>" + rs.getString("Precautions") + "</td>");
                out.println("<td>" + rs.getString("Ward") + "</td>");
                out.println("<td>" + rs.getString("Accomodations") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

            // Close the result set, statement, and connection
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // SQL query to retrieve all patients
                String sql = "SELECT * FROM Patient";

                // Create a statement and execute the query
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                 
                out.println();
                out.println();
                // Display all patients in a table
                out.println("<h3>All Patients</h3>");
                out.println("<table border='1'>");
                out.println("<tr><th>Patient ID</th><th>Name</th><th>Doctor ID</th><th>Nurse ID</th><th>Room Number</th><th>Description</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("Patient_ID") + "</td>");
                    out.println("<td>" + rs.getString("Name") + "</td>");
                    out.println("<td>" + rs.getInt("Doctor_ID") + "</td>");
                    out.println("<td>" + rs.getInt("Nurse_ID") + "</td>");
                    out.println("<td>" + rs.getInt("Room_Number") + "</td>");
                    out.println("<td>" + rs.getString("Description") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                // Close the result set, statement, and connection
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
       
        
     %>
       
    
</div>
     
     <div>
     <form id="getBillForm" action="" method="post" style="display: none;">
        <label for="patientId">Patient ID:</label>
        <input type="text" id="patientId" name="patientId">
        <br>
        <br>
        <button type="submit" name="getBill" value="true">Get Bills</button>
    </form>
     </div>
     
     <div>
         <form id="dischargeForm" action="" method="post" style="display: none;">
        <label for="patientID">Patient ID:</label>
        <input type="text" id="patientID" name="patientID">
        <br>
        <br>
        <label for="roomNumber">Room Number:</label>
        <input type="text" id="roomNumber" name="roomNumber">
        <br>
        <br>
        <button type="submit" name="dischargePatient" value="true">Discharge</button>
    </form>
     </div>
              

    <script>
        function toggleInsertForm() {
            var form = document.getElementById("insertForm");
            if (form.style.display === "none") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        }
        
        function toggleInsertEmployeeForm() {
            var form = document.getElementById("insertEmployeeForm");
            if (form.style.display === "none") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        }
        
        function toggleInsertDoctorForm() {
            var form = document.getElementById("insertDoctorForm");
            if (form.style.display === "none") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        } 
        
        function toggleInsertNurseForm() {
            var form = document.getElementById("insertNurseForm");
            if (form.style.display === "none") {
                form.style.display = "block";
            } else {
                form.style.display = "none";
            }
        }
        
         function toggleUpdatePatientForm() {
        var form = document.getElementById("updatePatientForm");
        if (form.style.display === "none") {
            form.style.display = "block";
        } else {
            form.style.display = "none";
        }
    }
    
    function toggleDischargeForm() {
                    var form = document.getElementById("dischargePatientForm");
                    if (form.style.display === "none") {
                        form.style.display = "block";
                    } else {
                        form.style.display = "none";
                    }
                }
                
       function showBillForm() {
            document.getElementById("getBillForm").style.display = "block";
        }
        
         function showDischargeForm() {
            document.getElementById("dischargeForm").style.display = "block";
        }
        
        function toggleDeleteDoctorForm() {
        var form = document.getElementById("deleteDoctorForm");
        if (form.style.display === "none") {
            form.style.display = "block";
        } else {
            form.style.display = "none";
        }
    }
    
    function toggleDeleteNurseForm() {
        var form = document.getElementById("deleteNurseForm");
        if (form.style.display === "none") {
            form.style.display = "block";
        } else {
            form.style.display = "none";
        }
    }
    
    function toggleDeleteEmployeeForm() {
        var form = document.getElementById("deleteEmployeeForm");
        if (form.style.display === "none") {
            form.style.display = "block";
        } else {
            form.style.display = "none";
        }
    }


        
    </script>

    
    <% 
       
        // Java code to handle retrieving all patients
        if ("true".equals(request.getParameter("getAllPatients"))) {
            try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // SQL query to retrieve all patients
                String sql = "SELECT * FROM Patient";

                // Create a statement and execute the query
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                 
                out.println();
                out.println();
                // Display all patients in a table
                out.println("<h3>All Patients</h3>");
                out.println("<table border='1'>");
                out.println("<tr><th>Patient ID</th><th>Name</th><th>Doctor ID</th><th>Nurse ID</th><th>Room Number</th><th>Description</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("Patient_ID") + "</td>");
                    out.println("<td>" + rs.getString("Name") + "</td>");
                    out.println("<td>" + rs.getInt("Doctor_ID") + "</td>");
                    out.println("<td>" + rs.getInt("Nurse_ID") + "</td>");
                    out.println("<td>" + rs.getInt("Room_Number") + "</td>");
                    out.println("<td>" + rs.getString("Description") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                // Close the result set, statement, and connection
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        // Java code to handle retrieving patient info from the view
        if ("true".equals(request.getParameter("getPatientInfoView"))) {
            try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // SQL query to retrieve patient information from the view
                String sql = "SELECT * FROM PatientInfoView";

                // Create a statement and execute the query
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                 
                out.println();
                out.println();
                // Display patient information from the view in a table
                out.println("<h3>Patient Information from View</h3>");
                out.println("<table border='1'>");
                out.println("<tr><th>Patient ID</th><th>Patient Name</th><th>Assigned Doctor</th><th>Doctor Specialty</th><th>Room Number</th><th>Nurse Name</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("Patient_ID") + "</td>");
                    out.println("<td>" + rs.getString("Patient_Name") + "</td>");
                    out.println("<td>" + rs.getString("Assigned_Doctor_Name") + "</td>");
                    out.println("<td>" + rs.getString("Doctor_Specialty") + "</td>");
                    out.println("<td>" + rs.getInt("Room_Number") + "</td>");
                    out.println("<td>" + rs.getString("Nurse_Name") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                // Close the result set, statement, and connection
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                
            }
        }
        
         if ("true".equals(request.getParameter("insertPatient"))) { // Check if Insert Patient button is clicked
            try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // Prepare SQL statement for inserting a new patient
                String sql = "INSERT INTO Patient (SSN, Name, Birth_Date,Description) " +
                             "VALUES (?, ?, TO_DATE(?, 'YYYY-MM-DD'),?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);

                // Set parameters for the prepared statement
                // You need to implement generatePatientID() to generate a unique patient ID
                pstmt.setString(1, request.getParameter("patientSSN"));
                pstmt.setString(2, request.getParameter("patientName"));
                pstmt.setString(3, request.getParameter("patientBirthDate"));
                pstmt.setString(4, request.getParameter("patientDescription"));
                
                // Execute the insert statement
                pstmt.executeUpdate();
                // Close the prepared statement and connection
                pstmt.close();
                conn.close();

                // Display success message
                out.println("<p>Patient inserted successfully!</p>");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error inserting patient!</p>");
                out.println(e);
            }
        }
        
        // Check if the form is submitted for updating patient information
    if ("true".equals(request.getParameter("updatePatient"))) {
        // Retrieve form data
        int patientID = Integer.parseInt(request.getParameter("patientID"));
        int doctorID = Integer.parseInt(request.getParameter("doctorID"));
        int nurseID = Integer.parseInt(request.getParameter("nurseID"));
        int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));

        try {
            // JDBC URL, username, and password for the database
            String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
            String user = "dbteam3";
            String password = "F23dbteam3H";

            // Load the MySQL JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish a database connection
            Connection conn = DriverManager.getConnection(url, user, password);

            // Prepare SQL statement for updating patient information
            String updatePatientSql = "UPDATE Patient SET Doctor_ID = ?, Nurse_ID = ?, Room_Number = ? WHERE Patient_ID = ?";
            PreparedStatement updatePatientStmt = conn.prepareStatement(updatePatientSql);
            updatePatientStmt.setInt(1, doctorID);
            updatePatientStmt.setInt(2, nurseID);
            updatePatientStmt.setInt(3, roomNumber);
            updatePatientStmt.setInt(4, patientID);

            // Execute the update statement for patient
            int rowsAffectedPatient = updatePatientStmt.executeUpdate();

            // Close the prepared statement for patient update
            updatePatientStmt.close();

            // Display success message for patient update
            out.println("<p>Updated " + rowsAffectedPatient + " patient successfully!</p>");
            // Update the room occupancy to 'Occupied' if a room number is provided
        if (roomNumber != 0) {
            String updateRoomSql = "UPDATE Room SET Occupancy = 'Occupied' WHERE Room_Number = ?";
            PreparedStatement updateRoomStmt = conn.prepareStatement(updateRoomSql);
            updateRoomStmt.setInt(1, roomNumber);
            updateRoomStmt.executeUpdate();
            updateRoomStmt.close();
        }
        } catch (Exception e) {
            e.printStackTrace();
            // Display error message
            out.println("<p>Error updating patient!</p>");
            out.println(e);
        }
    }
    
    if ("true".equals(request.getParameter("dischargePatient"))) {
        int patientID = Integer.parseInt(request.getParameter("patientID"));
        int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));

        try {
            // JDBC URL, username, and password for Oracle database
            String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
            String user = "dbteam3";
            String password = "F23dbteam3H";

            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish a database connection
            Connection conn = DriverManager.getConnection(url, user, password);

            // Prepare the call to the stored procedure
            CallableStatement cstmt = conn.prepareCall("{CALL DischargePatient(?, ?, ?, ?)}");

            // Set the input parameters for patient ID and room number
            cstmt.setInt(1, patientID);
            cstmt.setInt(2, roomNumber);

            // Register OUT parameters for success message and error message
            cstmt.registerOutParameter(3, Types.VARCHAR);
            cstmt.registerOutParameter(4, Types.VARCHAR);

            // Execute the stored procedure
            cstmt.execute();

            // Get the success and error messages
            String successMessage = cstmt.getString(3);
            String errorMessage = cstmt.getString(4);

            // Close the statement and connection
            cstmt.close();
            conn.close();

            // Display success or error message
            if (successMessage != null) {
                out.println("<p>" + successMessage + "</p>");
            } else if (errorMessage != null) {
                out.println("<p>" + errorMessage + "</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Display error message
            out.println("<p>Error discharging patient!</p>");
            out.println(e);
        }
    }

        
        //DOCTOR
        
        // Java code to handle retrieving all doctors
        if ("true".equals(request.getParameter("getAllDoctors"))) {
            try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // SQL query to retrieve all doctors
                String sql = "SELECT * FROM Doctor";

                // Create a statement and execute the query
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                 
                out.println();
                out.println();
                // Display all doctors in a table
                out.println("<h3>All Doctors</h3>");
                out.println("<table border='1'>");
                out.println("<tr><th>Employee ID</th><th>Specialty</th><th>Office</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("Employee_ID") + "</td>");
                    out.println("<td>" + rs.getString("Specialty") + "</td>");
                    out.println("<td>" + rs.getString("Office") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                // Close the result set, statement, and connection
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        // Java code to handle retrieving doctor-patient view
        if ("true".equals(request.getParameter("getDoctorPatientView"))) {
            try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // SQL query to retrieve doctor-patient view
                String sql = "SELECT * FROM DoctorInfoView";

                // Create a statement and execute the query
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                 
                out.println();
                out.println();
                // Display doctor-patient view in a table
                out.println("<h3>Doctor Patient View</h3>");
                out.println("<table border='1'>");
                out.println("<tr><th>Doctor ID</th><th>Doctor Name</th><th>Doctor Specialty</th><th>Patients Assigned</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("Doctor_ID") + "</td>");
                    out.println("<td>" + rs.getString("Doctor_Name") + "</td>");
                    out.println("<td>" + rs.getString("Doctor_Specialty") + "</td>");
                    out.println("<td>" + rs.getString("Patients_Assigned") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                // Close the result set, statement, and connection
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        if ("true".equals(request.getParameter("insertDoctor"))) { // Check if Insert Doctor button is clicked
            try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // Prepare SQL statement for inserting a new doctor
                String sql = "INSERT INTO Doctor (Specialty, Office) VALUES (?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);

                // Set parameters for the prepared statement
                pstmt.setString(1, request.getParameter("specialty"));
                pstmt.setString(2, request.getParameter("office"));

                // Execute the insert statement
                pstmt.executeUpdate();
                // Close the prepared statement and connection
                pstmt.close();
                conn.close();

                // Display success message
                out.println("<p>Doctor inserted successfully!</p>");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error inserting doctor!,Please check if you have inserted common info in employee.</p>");
                out.println(e);
            }
        }
        
       if ("true".equals(request.getParameter("deleteDoctor"))) { // Check if Delete Doctor button is clicked
        try {
        // JDBC URL, username, and password for Oracle database
        String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
        String user = "dbteam3";
        String password = "F23dbteam3H";

        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish a database connection
        Connection conn = DriverManager.getConnection(url, user, password);

        // Prepare SQL statement for deleting a doctor
        String sql = "DELETE FROM Doctor WHERE Employee_ID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        // Set parameter for the prepared statement
        pstmt.setString(1, request.getParameter("doctorId"));

        // Execute the delete statement
        int rowsAffected = pstmt.executeUpdate();

        // Close the prepared statement and connection
        pstmt.close();
        conn.close();

        if (rowsAffected > 0) {
            // Display success message
            out.println("<p>Doctor deleted successfully!</p>");
        } else {
            // Display message if no rows were affected (doctor not found)
            out.println("<p>No doctor found with the specified ID!</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error deleting doctor!</p>");
        out.println(e);
    }
}
        
        //NURSE
        
        // Java code to handle retrieving Nurses results
        if ("true".equals(request.getParameter("getNurses"))) {
            try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // SQL query to retrieve Nurses results
                String sql = "SELECT * FROM Nurse";

                // Create a statement and execute the query
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                 
                out.println();
                out.println();
                out.println("<h3>Nurses Results</h3>");
                // Generate HTML table for results
                out.println("<table>");
                out.println("<tr><th>Employee ID</th><th>Team</th><th>Shift</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("Employee_ID") + "</td>");
                    out.println("<td>" + rs.getString("Team") + "</td>");
                    out.println("<td>" + rs.getString("Shift") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                // Close the result set, statement, and connection
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
         // Java code to handle retrieving nurse-patient view results
        if ("true".equals(request.getParameter("getNursePatientView"))) {
            try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // SQL query to retrieve nurse-patient view results
                String sql = "SELECT * FROM Nurse_Patient_View";

                // Create a statement and execute the query
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                 
                out.println();
                out.println();
                out.println("<h3>Nurse Patient View Results</h3>");
                // Generate HTML table for results
                out.println("<table>");
                out.println("<tr><th>Nurse ID</th><th>Nurse Name</th><th>Nurse Team</th><th>Nurse Shift</th><th>Patients Assigned</th><th>Room Numbers</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("Nurse_ID") + "</td>");
                    out.println("<td>" + rs.getString("Nurse_Name") + "</td>");
                    out.println("<td>" + rs.getString("Nurse_Team") + "</td>");
                    out.println("<td>" + rs.getString("Nurse_Shift") + "</td>");
                    out.println("<td>" + rs.getString("Patient_Names") + "</td>");
                    out.println("<td>" + rs.getString("Room_Numbers") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                // Close the result set, statement, and connection
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        // Java code to handle inserting data into Nurse table
        if ("true".equals(request.getParameter("insertNurse"))) {
            try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // Prepare SQL statement for inserting a new nurse
                String sql = "INSERT INTO Nurse (Team, Shift) VALUES (?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);

                // Set parameters for the prepared statement
                pstmt.setString(1, request.getParameter("team"));
                pstmt.setString(2, request.getParameter("shift"));

                // Execute the insert statement
                pstmt.executeUpdate();
                // Close the prepared statement and connection
                pstmt.close();
                conn.close();

                // Display success message
                out.println("<p>Nurse inserted successfully!</p>");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error inserting nurse!,Please check if you have inserted common info in employee. </p>");
                out.println(e);
            }
        }
        
        if ("true".equals(request.getParameter("deleteNurse"))) { // Check if Delete Nurse button is clicked
    try {
        // JDBC URL, username, and password for Oracle database
        String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
        String user = "dbteam3";
        String password = "F23dbteam3H";

        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish a database connection
        Connection conn = DriverManager.getConnection(url, user, password);

        // Prepare SQL statement for deleting a nurse
        String sql = "DELETE FROM Nurse WHERE Employee_ID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        // Set parameter for the prepared statement
        pstmt.setString(1, request.getParameter("nurseId"));

        // Execute the delete statement
        int rowsAffected = pstmt.executeUpdate();

        // Close the prepared statement and connection
        pstmt.close();
        conn.close();

        if (rowsAffected > 0) {
            // Display success message
            out.println("<p>Nurse deleted successfully!</p>");
        } else {
            // Display message if no rows were affected (nurse not found)
            out.println("<p>No nurse found with the specified ID!</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error deleting nurse!</p>");
        out.println(e);
    }
}

        
      
        
        //EMPLOYEE
        
        if ("true".equals(request.getParameter("getEmployeeInfo"))) { // Check if Employee Info button is clicked
            try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // SQL query to retrieve all employee information
                String sql = "SELECT * FROM Employee";

                // Create a statement and execute the query
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                 
                out.println();
                out.println();
                out.println("<h3> Employee Information </h3>");
                // Generate HTML table
                out.println("<table>");
                out.println("<tr><th>Employee ID</th><th>Name</th><th>Start Date</th><th>Degree</th><th>Birth Date</th></tr>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("Employee_ID") + "</td>");
                    out.println("<td>" + rs.getString("Name") + "</td>");
                    out.println("<td>" + rs.getDate("Start_Date") + "</td>");
                    out.println("<td>" + rs.getString("Degree") + "</td>");
                    out.println("<td>" + rs.getDate("Birth_Date") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
                // Close the result set, statement, and connection
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        if ("true".equals(request.getParameter("insertEmployee"))) { // Check if Insert Employee button is clicked
            try {
                // JDBC URL, username, and password for Oracle database
                String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
                String user = "dbteam3";
                String password = "F23dbteam3H";

                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a database connection
                Connection conn = DriverManager.getConnection(url, user, password);

                // Prepare SQL statement for inserting a new employee
                String sql = "INSERT INTO Employee (Name, Start_Date, Degree, Birth_Date) VALUES (?, TO_DATE(?, 'YYYY-MM-DD'), ?, TO_DATE(?, 'YYYY-MM-DD'))";
                PreparedStatement pstmt = conn.prepareStatement(sql);

                // Set parameters for the prepared statement
                pstmt.setString(1, request.getParameter("employeeName"));
                pstmt.setString(2, request.getParameter("startDate"));
                pstmt.setString(3, request.getParameter("degree"));
                pstmt.setString(4, request.getParameter("birthDate"));

                // Execute the insert statement
                pstmt.executeUpdate();
                // Close the prepared statement and connection
                pstmt.close();
                conn.close();

                // Display success message
                out.println("<p>Employee inserted successfully!, Please goahead with Doctor/Nurse information </p>");
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error inserting employee!</p>");
                out.println(e);
            }
        }
        
      if ("true".equals(request.getParameter("deleteEmployee"))) { // Check if Delete Doctor button is clicked
        try {
        // JDBC URL, username, and password for Oracle database
        String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
        String user = "dbteam3";
        String password = "F23dbteam3H";

        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish a database connection
        Connection conn = DriverManager.getConnection(url, user, password);

        // Prepare SQL statement for deleting a doctor
        String sql = "DELETE FROM Employee WHERE Employee_ID = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);

        // Set parameter for the prepared statement
        pstmt.setString(1, request.getParameter("employeeId"));

        // Execute the delete statement
        int rowsAffected = pstmt.executeUpdate();

        // Close the prepared statement and connection
        pstmt.close();
        conn.close();

        if (rowsAffected > 0) {
            // Display success message
            out.println("<p>Employee deleted successfully!</p>");
        } else {
            // Display message if no rows were affected (doctor not found)
            out.println("<p>No Employee found with the specified ID!</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error deleting employee!</p>");
        out.println(e);
    }
}
        
        //ROOM
        
        if ("true".equals(request.getParameter("getRoomInfo"))) {
        try {
            // JDBC URL, username, and password for your database
            String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
            String user = "dbteam3";
            String password = "F23dbteam3H";

            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish a database connection
            Connection conn = DriverManager.getConnection(url, user, password);

            // SQL query to retrieve room information
            String sql = "SELECT * FROM Room";

            // Create a statement and execute the query
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            // Display room information in a table
            out.println("<h3>Room Information</h3>");
            out.println("<table border='1'>");
            out.println("<tr><th>Room Number</th><th>Nurse ID</th><th>Occupancy</th><th>Precautions</th><th>Ward</th><th>Accommodations</th></tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("Room_Number") + "</td>");
                out.println("<td>" + rs.getInt("Nurse_ID") + "</td>");
                out.println("<td>" + rs.getString("Occupancy") + "</td>");
                out.println("<td>" + rs.getString("Precautions") + "</td>");
                out.println("<td>" + rs.getString("Ward") + "</td>");
                out.println("<td>" + rs.getString("Accomodations") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

            // Close the result set, statement, and connection
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
   
    //Emergency contacts
    if ("true".equals(request.getParameter("getEmergencyContacts"))) {
    try {
        // JDBC URL, username, and password for Oracle database
        String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
        String user = "dbteam3";
        String password = "F23dbteam3H";

        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish a database connection
        Connection conn = DriverManager.getConnection(url, user, password);

        // Prepare the call to the stored procedure
        CallableStatement cstmt = conn.prepareCall("{CALL GetAllEmergencyContacts(?)}");

        // Register the OUT parameter for the cursor
        cstmt.registerOutParameter(1, OracleTypes.CURSOR);

        // Execute the stored procedure
        cstmt.execute();

        // Get the cursor result
        ResultSet rs = (ResultSet) cstmt.getObject(1);

        // Display emergency contacts
        out.println("<h3>Emergency Contacts</h3>");
        out.println("<table border='1'>");
        out.println("<tr><th>Name</th><th>Patient ID</th><th>Address</th><th>Phone Number</th><th>Relationship</th></tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getString("Name") + "</td>");
            out.println("<td>" + rs.getInt("Patient_ID") + "</td>");
            out.println("<td>" + rs.getString("Address") + "</td>");
            out.println("<td>" + rs.getString("Phone_Number") + "</td>");
            out.println("<td>" + rs.getString("Relationship") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");

        // Close the result set, statement, and connection
        rs.close();
        cstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}



          
        //BILL
        
     if ("true".equals(request.getParameter("getBill"))) {
        try {
            int patientId = Integer.parseInt(request.getParameter("patientId"));

            // JDBC URL, username, and password for Oracle database
            String url = "jdbc:oracle:thin:@csdb.csc.villanova.edu:1521:orcl";
            String user = "dbteam3";
            String password = "F23dbteam3H";

            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish a database connection
            Connection conn = DriverManager.getConnection(url, user, password);

            // Prepare the call to the stored procedure
            CallableStatement cstmt = conn.prepareCall("{CALL GetBillForPatient(?, ?, ?)}");

            // Set the input parameter for the patient ID
            cstmt.setInt(1, patientId);

            // Register OUT parameters for total bill amount and bill information
            cstmt.registerOutParameter(2, Types.DECIMAL); // total bill amount
            cstmt.registerOutParameter(3, OracleTypes.CURSOR); // bill information

            // Execute the stored procedure
            cstmt.execute();

            // Get the total bill amount and bill information
            BigDecimal totalBillAmount = cstmt.getBigDecimal(2);
            ResultSet rs = (ResultSet) cstmt.getObject(3);

            // Display total bill amount
            out.println("<h3>Total Bill Amount</h3>");
            out.println("<p>Total: $" + totalBillAmount + "</p>");

            // Display bill information
            out.println("<h3>Bills</h3>");
            out.println("<table border='1'>");
            out.println("<tr><th>Bill No</th><th>Cost</th><th>Patient ID</th></tr>");
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("Bill_No") + "</td>");
                out.println("<td>" + rs.getBigDecimal("Cost") + "</td>");
                out.println("<td>" + rs.getInt("Patient_ID") + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");

            // Close the result set, statement, and connection
            rs.close();
            cstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
        
        
              
    %>
    <br>
    <br>
    <center> <img src="image2.jpg" height="550" width="1200"> </center>
     </div>
        </div>
    </div>
</body>
</html>
