<?php

include_once "config.php";

$con = mysqli_connect($server,$user,$pword,$database,$port);
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}

$sql="select * from ".$master_table;
if ($DEBUG) { echo "<pre>$sql</pre>"; }
$result = mysqli_query($con,$sql);

echo "Results of School Assignment <br>";
echo "Master Table";

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

$sql="SELECT a.".$applicant_id_column.", c.".$selection_number_column.", n.".$school_name_column.", a.".$program_column." ";
$sql.="FROM ".$applicant_table." a ";
$sql.="inner join ".$choice_table." c on a.".$applicant_id_column." = c.".$applicant_id_column." and a.".$assigned_school_column." = c.".$school_id_column." ";
$sql.="inner join ".$names_table." n on a.".$assigned_school_column." = n.".$school_id_column." ";
$sql.="order by a.".$applicant_id_column;

if ($DEBUG) { echo "<pre>$sql</pre>"; }
$result = mysqli_query($con,$sql);

echo "School Assignments";

echo "<table border='1'>
<tr>
<th>Applicant ID</th>
<th>Selection Number</th>
<th>School Name</th>
<th>Program</th>
</tr>";


while($row = mysqli_fetch_array($result)) {
  echo "<tr>";
  echo "<td>" . $row[$applicant_id_column] . "</td>";
  echo "<td>" . $row[$selection_number_column] . "</td>";
  echo "<td>" . $row[$school_name_column] . "</td>";
  echo "<td>" . $row[$program_column] . "</td>";
  echo "</tr>";
}
echo "</table>";

mysqli_close($con);
?>
