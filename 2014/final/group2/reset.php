<?php

include_once "config.php";

$con = mysqli_connect($server,$user,$pword,$database,$port);
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}

$sql="update ".$applicant_table." set ".assigned_school_column." = 0";
if ($DEBUG) { echo "<pre>$sql</pre>"; }
$result = mysqli_query($con,$sql);

$sql="update ".$master_table." set ".$assigned_seats_column." = 0, ".$available_seats_column." = ".$total_seats_column;
if ($DEBUG) { echo "<pre>$sql</pre>"; }
$result = mysqli_query($con,$sql);

$sql="select * from ".$master_table;
if ($DEBUG) { echo "<pre>$sql</pre>"; }
$result = mysqli_query($con,$sql);

echo "Results of reset";

echo "<table border='1'>
<tr>
<th>School ID</th>
<th>School Name</th>
<th>Program</th>
<th>Total Seats</th>
<th>Assigned Seats</th>
<th>Available Seats</th>
</tr>";

while($row = mysqli_fetch_array($result)) {
  echo "<tr>";
  echo "<td>" . $row[$school_id_column] . "</td>";
  echo "<td>" . $row[$master_name_column] . "</td>";
  echo "<td>" . $row[$program_column] . "</td>";
  echo "<td>" . $row[$total_seats_column] . "</td>";
  echo "<td>" . $row[$assigned_seats_column] . "</td>";
  echo "<td>" . $row[$available_seats_column] . "</td>";
  echo "</tr>";
}
echo "</table>";

mysqli_close($con);
?>
