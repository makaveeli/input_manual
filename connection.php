<?php

$conn = mysqli_connect('localhost','root','','expo');

if (!$conn) {
  die(mysqli_connect_error());
}
