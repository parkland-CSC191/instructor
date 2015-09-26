<?php

include_once "config.php";

$con = mysqli_connect($server,$user,$pword,$database,$port);
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}

$sql="drop table final_master_temp";
if ($DEBUG) { echo "<pre>$sql</pre>"; }
$result = mysqli_query($con,$sql);

$sql="drop table final_assignment_temp";
if ($DEBUG) { echo "<pre>$sql</pre>"; }
$result = mysqli_query($con,$sql);

$sql="create table final_master_temp as (select * from  ".$master_table.")";
if ($DEBUG) { echo "<pre>$sql</pre>"; }
$result = mysqli_query($con,$sql);

echo $master_table." backed up";

$sql="create table final_assignment_temp as (select * from  ".$applicant_table.")";
if ($DEBUG) { echo "<pre>$sql</pre>"; }
$result = mysqli_query($con,$sql);

echo $applicant_table." backed up";

mysqli_close($con);
?>
