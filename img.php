<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="style.css">
    <title></title>
</head>
<html>

<body>

<!--//////////////////__________testing problem with image, no solution found_________________/////////////////-->

<?php

$servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "cr10_armstorfer_angela_biglibrary";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "SELECT image FROM media";
$result = mysqli_query($conn, $sql);


// fetch a next row (as long as there are some) into $row

while($row = mysqli_fetch_assoc($result)) {
        
        echo  "<img src=" . $row["image"] . "/>";

 }

echo "Fetched data successfully\n";



//printf("Image: %s<br>", $row["image"]);
 







// Free result set

mysqli_free_result($result);


// Close connection

mysqli_close($conn);



?>


</body>

</html>