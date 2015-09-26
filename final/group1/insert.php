<?php

include_once "config.php";

$choice[0] = intval($_GET['choice1']);
$choice[1] = intval($_GET['choice2']);
$choice[2] = intval($_GET['choice3']);
$choice[3] = intval($_GET['choice4']);
$choice[4] = intval($_GET['choice5']);
$choice[5] = intval($_GET['choice6']);
$choice[6] = intval($_GET['choice7']);
$choice[7] = intval($_GET['choice8']);
$choice[8] = intval($_GET['choice9']);
$choice[9] = intval($_GET['choice10']);
$choice[10] = intval($_GET['choice11']);
$choice[11] = intval($_GET['choice12']);

$choice_prog[0] = $_GET['choice1_prog'];
$choice_prog[1] = $_GET['choice2_prog'];
$choice_prog[2] = $_GET['choice3_prog'];
$choice_prog[3] = $_GET['choice4_prog'];
$choice_prog[4] = $_GET['choice5_prog'];
$choice_prog[5] = $_GET['choice6_prog'];
$choice_prog[6] = $_GET['choice7_prog'];
$choice_prog[7] = $_GET['choice8_prog'];
$choice_prog[8] = $_GET['choice9_prog'];
$choice_prog[9] = $_GET['choice10_prog'];
$choice_prog[10] = $_GET['choice11_prog'];
$choice_prog[11] = $_GET['choice12_prog'];

$con = mysqli_connect($server,$user,$pword,$database,$port);
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}

$sql="insert into ".$applicant_table." values ()";
if ($DEBUG) { echo "<pre>$sql</pre>";}

mysqli_query($con,$sql);
// $applicant_id = mysqli_insert_id($con);
$sql="SELECT LAST_INSERT_ID() last_id";
if ($DEBUG) { echo "<pre>$sql</pre>";}
$result = mysqli_query($con,$sql);
$row = mysqli_fetch_array($result);
$applicant_id = $row['last_id'];


foreach ($choice as $key => $value) {
 if ($value != 0) { 
  $sql="insert into ".$choice_table." (".$applicant_id_column.", ".$selection_number_column.", ".$school_id_column.", ".$program_column.") values (".$applicant_id.",".$key.",".$value.",'".$choice_prog[$key]."')";
if ($DEBUG) { echo "<pre>$sql</pre>";}
  $result = mysqli_query($con,$sql);
 }
}

$sql="SELECT a.".$selection_number_column.", a.".$school_id_column.", b.".$school_name_column.", a.".$program_column." FROM ".$choice_table." a inner join ".$names_table." b on a.".$school_id_column." = b.".$school_id_column." WHERE a.".$applicant_id_column." = '".$applicant_id."'";
if ($DEBUG) { echo "<pre>$sql</pre>";}
$result = mysqli_query($con,$sql);

echo "Choices for Applicant ID: ".$applicant_id;

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
