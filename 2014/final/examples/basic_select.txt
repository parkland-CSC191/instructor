<?php
$q = intval($_GET['q']);

$con = mysqli_connect('localhost','cschultz','cschultz#3','cschultz');
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}

$sql="SELECT * FROM 2015_choice WHERE applicant_id = '".$q."'";
$result = mysqli_query($con,$sql);

echo "<table border='1'>
<tr>
<th>Selection Number</th>
<th>School ID</th>
<th>Program</th>
</tr>";

while($row = mysqli_fetch_array($result)) {
  echo "<tr>";
  echo "<td>" . $row['selection_number'] . "</td>";
  echo "<td>" . $row['school_id'] . "</td>";
  echo "<td>" . $row['program'] . "</td>";
  echo "</tr>";
}
echo "</table>";

mysqli_close($con);
?>
