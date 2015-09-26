<?php

include_once "config.php";

$con = mysqli_connect($server,$user,$pword,$database,$port);
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}

$sql="SELECT ".$applicant_id_column." FROM ".$applicant_table." order by rand()";
if ($DEBUG) { echo "<pre>$sql</pre>"; }
$result = mysqli_query($con,$sql);
while($row = mysqli_fetch_array($result)) {

  $applicant_id = $row[$applicant_id_column];
  $sql2="SELECT ".$selection_number_column.", ".$school_id_column.", ".$program_column." FROM ".$choice_table." WHERE ".$applicant_id_column." = ".$applicant_id." order by ".$selection_number_column;
  if ($DEBUG) { echo "<pre>SQL2: $sql2</pre>"; }
  $result2 = mysqli_query($con,$sql2);
  while($row2 = mysqli_fetch_array($result2)) {

    $school_id = $row2[$school_id_column];
    $program = $row2[$program_column];
    
    $sql3="select 1 from ".$master_table." where ".$school_id_column." = ".$school_id." and ".$program_column." = '".$program."' and ".$available_seats_column." > 0";
    if ($DEBUG) { echo "<pre>SQL3: $sql3</pre>"; }
    $result3 = mysqli_query($con,$sql3);
    $rows_returned = $result3->num_rows;  
    if ($rows_returned > 0) {
      $sql4="update ".$master_table." set ".$assigned_seats_column." = ".$assigned_seats_column." + 1, ".$available_seats_column." = ".$available_seats_column." - 1 where ".$school_id_column." = ".$school_id." and ".$program_column." = '".$program."'";
      if ($DEBUG) { echo "<pre>SQL4: $sql4</pre>"; }
      $result4 = mysqli_query($con,$sql4);
 
      $sql5="update ".$applicant_table." set ".$assigned_school_column." = ".$school_id.", ".$program_column." = '".$program."' where ".$applicant_id_column." = ".$applicant_id;
      if ($DEBUG) { echo "<pre>SQL5: $sql5</pre>"; }
      $result5 = mysqli_query($con,$sql5);
      break;
    }
  }
}

mysqli_close($con);
?>
