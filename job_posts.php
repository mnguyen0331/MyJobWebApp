<html>
    <body>
        <table>
         <tr>
            <th> Job Title </th>
            <th> Description </th>
            <th> Address </th>
            <th> Qualifications </th>
            <th> Responsibilities </th>
            <th> Education </th>
            <th> Job Type </th>
            <th> Contact Details </th>
            <th> Experience level </th>
            <th> Salary Range </th>
            <th> Day Posted </th>
            <th> Deadline </th>
        </tr>
        <?php
            $conn = mysqli_connect("localhost", "root", "", "myjob");
            $sql = "SELECT * FROM Job";
            $result = mysqli_query($conn, $sql);

            if ($result->num_rows > 0) {
                while ($row = $result-> fetch_assoc()) {
                    echo "<tr><td>" . $row["Title"] . "</td><td>" . $row["Description"] . "</td><td>" . $row["Address"]," ",$row["City"]," ",$row["State"],", ",$row["Zipcode"]  . "</td><td>" . $row["Qualifications"] . "</td><td>" 
                    . $row["Responsibilities"] . "</td><td>" . $row["EducationLevelId"] . "</td><td>" . $row["JobTypeId"] . "</td><td>" . $row["ContactDetaills"] 
                    . "</td><td>" . $row["ExperienceLevelId"] . "</td><td>" . $row["SalaryRangeId"] . "</td><td>" . $row["DatePosted"] . "</td><td>" . $row["Deadline"] . "</td></tr>";
                }
            }
            else {
                echo "No Results";
            }
            $conn->close();
        ?>
        </table>
    </body>
</html>
