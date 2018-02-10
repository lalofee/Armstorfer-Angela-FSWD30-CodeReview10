<?php
//Display all the records from MySQL table using PHP and MySQL.


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
?>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Home Library</title>

<style>
body {
background: lightblue url("img/book.jpg") no-repeat fixed center; 
}
 .jumbotron { 
    background-color: #90305A; /* pink */
    opacity: 0.8;
    color: #ffffff;
    padding: 100px 25px;
 }  
</style>

</head>

<body>

<div class="jumbotron jumbotron-fluid">
    <div class="row">
	
		
    <div id="left" class="col-md-6">
		<h2>Welcome User</h2>
		<p>here you can find all items of our library</p>
	</div>

	<div id="right" class="col-md-6">
    	<h1>Big Library</h1> 
    	<p>We love Books</p> 
  	</div>
             

        <a href="logout.php?logout">Sign Out</a>

    </div>
</div>
<!---//////////////////End of Jumbotron///////////////////-->


<!---//////////////////Start of Table///////////////////-->
<?php

$sql = "SELECT media.title, author.author_surname, author.author_name, media.image, media.short_description, publisher.publisher_name, media.ISBN
		FROM media 
		INNER JOIN author ON media.fk_author_ID = author.author_ID
		INNER JOIN publisher ON media.fk_publisher_ID = publisher.publisher_ID";

$result = mysqli_query($conn, $sql);


echo

"<div class='container'>
   <table class='table table-dark table-hover'>
    <thead>
      <tr>
        <th>Title</th>
        <th>Authors Name</th>
        <th>Image</th>
        <th>Description</th>
        <th>Publisher</th>
        <th>ISBN</th>
      </tr>
    </thead>";

// fetch a next row (as long as there are some) into $row
while($row = mysqli_fetch_assoc($result)) {

	echo

    "<tbody>
      <tr>
        <td>" . $row["title"] . "</td>
        <td>" . $row["author_surname"] . " " . $row["author_name"] . "</td>
        <td>" . $row["image"] . "</td>
        <td>" . $row["short_description"] . "</td>
        <td>" . $row["publisher_name"] . "</td>
        <td>" . $row["ISBN"] . "</td>
      </tr>";
}

echo "</tbody></table></div>";

// Free result set
mysqli_free_result($result);
// Close connection
mysqli_close($conn);

?>


 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>

<?php ob_end_flush(); ?>





