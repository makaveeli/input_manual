<?php

require('connection.php');

$field = count($_POST['desa']);
$prov = $_POST['provinsi'];
$kota = $_POST['kota'];

for($i=0; $i<$field; $i++)  
      {  
           if(trim($_POST["desa"][$i] != ''))  
           {  
                $sql = "INSERT INTO reason(provinsi,kota,desa) VALUES('".mysqli_real_escape_string($conn,$prov)."','".mysqli_real_escape_string($conn,$kota)."','".mysqli_real_escape_string($conn,$_POST['desa'][$i])."')";  
                mysqli_query($conn, $sql);  
                $hsl = array( 'STATUS'=> array(
                  'NAMA_PROVINSI' => $prov,
                  'NAMA_KOTA' => $kota,
                  'NAMA_WILAYAH' => $_POST['desa'][$i]
                ));

                echo json_encode($hsl);
                
           }  
      }  