<?php

include_once "config.php";

$con = mysqli_connect($server,$user,$pword,$database,$port);
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}

$sql="SELECT a.".$selection_number_column.", a.".$school_id_column.", b.".$school_name_column.", a.".$program_column." FROM ".$choice_table." a inner join ".$names_table." b on a.".$school_id_column." = b.".$school_id_column." WHERE a.".$applicant_id_column." = '".$applicant_id."'";
$result = mysqli_query($con,$sql);

echo "Results of Lottery";

echo "<table border='1'>
<tr>
<th>Selection Number</th>
<th>School ID</th>
<th>School Name</th>
<th>Program</th>
</tr>";


while($row = mysqli_fetch_array($result)) {
  echo "<tr>";
  echo "<td>" . $row[$selection_number_column] . "</td>";
  echo "<td>" . $row[$school_id_column] . "</td>";
  echo "<td>" . $row[$school_name_column] . "</td>";
  echo "<td>" . $row[$program_column] . "</td>";
  echo "</tr>";
}
echo "</table>";

mysqli_close($con);
?>
