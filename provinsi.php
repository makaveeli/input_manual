<?php

require('connection.php');

$prov = $_POST['provid'];


  $query = mysqli_query($conn, "SELECT * FROM provinsi WHERE nama_provinsi LIKE '%".$prov."%'  ");
  // $query = mysqli_query($conn, "SELECT * FROM kota join provinsi on kota.id_provinsi = provinsi.id_provinsi where provinsi.nama_provinsi like '%".$prov."%'  ");
  while($row = mysqli_fetch_array($query)){
    echo '<option value="'.$row['nama_provinsi'].'">';
  }