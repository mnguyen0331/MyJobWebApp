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
            <th> JobID </th>
        </tr>
        <?php
            $conn = mysqli_connect("localhost", "root", "", "myjob");
            $sql = "SELECT * FROM Job";
            $result = mysqli_query($conn, $sql);

            if ($result->num_rows > 0) {
                while ($row = $result-> fetch_assoc()) {
                    echo "<tr><td>" . $row["Title"] . "</td><td>" . $row["Description"] . "</td><td>" . $row["Address"]," ",$row["City"]," ",$row["State"],", ",$row["Zipcode"]  . "</td><td>" . $row["Qualifications"] . "</td><td>" 
                    . $row["Responsibilities"] . "</td><td>" . $row["EducationLevelId"] . "</td><td>" . $row["JobTypeId"] . "</td><td>" . $row["ContactDetaills"] 
                    . "</td><td>" . $row["ExperienceLevelId"] . "</td><td>" . $row["SalaryRangeId"] . "</td><td>" . $row["DatePosted"] . "</td><td>" . $row["Deadline"] . "</td><td>" .  $row["JobId"] . "</td></tr>";
                }
            }
            else {
                echo "No Results";
            }

        ?>
        </table>
    </body>

    <br />
    Insert the Job ID for the Job you wish to apply for:<br />
    <form action="job_posts.php" method="post">
       <input type="text" name="ID"> 
        <button type="submit">Submit</button>
    </form>
            <br />
    <?php
    if (!isset($_POST['ID'])) {
    $ID = $_POST["ID"];
    $unmae= "root";
    $User = "SELECT UserId FROM User WHERE user_name='$uname'";
    $timestamp = date("Y-m-d H:i:s");

    $mysqli = mysqli_connect("localhost", "root", "", "myjob");
    $result = $mysqli->query("SELECT JobId FROM Job WHERE JobId = $ID");
    if($result->num_rows == 0) {
      printf("<p>No JobID located with that number</p>");
    } else {
        printf("<p>Job Found</p>");
        $insert = "INSERT INTO UserApplyJob (UserId, JobId, StatusId, TimeStamp) VALUES ('" . $ID ."','" . $User ."','" .  'In Review'  ."','" . $timestamp ."')";
        if ($insert) {
            printf("<p>Application Sent!</p>");
        }

    }
    $mysqli->close();
    }
    ?>

    <br /><br />
    <nav role=navigation><a href=Apply.php>Done Applying? - Click here</a></nav>
    <br /><br /><br />
</html>
