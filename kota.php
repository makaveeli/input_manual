<?php

require('connection.php');

$kota = $_POST['kota'];
// $kota = $_POST['kota'];

// if ($prov == true) {
  // $query = mysqli_query($conn, "SELECT * FROM provinsi WHERE nama_provinsi LIKE '%".$prov."%'  ");
  $query = mysqli_query($conn, "SELECT * FROM kota join provinsi on kota.id_provinsi = provinsi.id_provinsi where provinsi.nama_provinsi = '$kota'  ");

  while($row = mysqli_fetch_array($query)){
    echo '<option value="'.$row['nama_kota'].'">';
  }
// }