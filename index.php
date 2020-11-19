<?php require('connection.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SGR NATIVE</title>
</head>
<body>
  <div class="container">
    <div class="content">
      <!-- <form action="" method="post"> -->
        <label for="">provinsi </label><br><input type="text" name="provinsi" list="exampleList" id="provinsi" autocomplete="off">
        <datalist id="exampleList">
          <!-- OPTION WITH AJAX -->
        </datalist>
        <br>
        <br>
        <label for="">kota </label><br><input type="text" name="kota" list="kota" autocomplete="off" id="kotax">
        <datalist id="kota">
          <!-- OPTION WITH AJAX -->
        </datalist>
        <br><br>
        <div class="input_fields_wrap">
        <label for="">tambahkan desa</label>
          <div><input type="text" name="mytext[]" id="lal">&nbsp;<button class="add_field_button">+</button><br></div>
        </div>
        <br><br>
        <button id="simpan">simpan</button>
    </div>
  </div>
  <script src="jquery-3.4.1.min.js"></script>
  <script>
    $(document).ready(function(){
        // menampilkan list provinsi
        var prov = $('#exampleList').val();
        $('.add_field_button').val();
   
        
        $.ajax({
          type : 'post',
          url : 'provinsi.php',
          data : {provid : prov},
          success : function(data){
            $('#exampleList').html(data);
            $('#provinsi').val('');
          }
        })

        // menampilkan list kota
        $('#provinsi').change(function(){
          // alert('ya')
          var gp = $('#provinsi').val();
            $.ajax({
              type : 'post',
              url : 'kota.php',
              data : {kota : gp},
              success : function(data){
                $('#kota').html(data);
                // console.log(data)
              }
            })
        });

        var max_fields      = 10; 
        var wrapper   		= $(".input_fields_wrap"); 
        var add_button      = $(".add_field_button"); 
        
        var x = 1;
        $(add_button).click(function(e){ 
          e.preventDefault();
          if(x < max_fields){ 
            x++; 
            $(wrapper).append('<div><br><input type="text" name="mytext[]"/>&nbsp;<button class="remove_field">x</button></div>'); 
          } 
        });
        
        $(wrapper).on("click",".remove_field", function(e){
          e.preventDefault(); $(this).parent('div').remove(); x--;
    })

  }) 
      $('#simpan').on('click', function(){
        
              var provinsi = $('#provinsi').val();
              var kota = $('#kotax').val();
              var h = document.getElementsByName('mytext[]');
              var data = [];

              
              var k = h.length;
                if (k < 5) {
                  alert('Your input is less than 5')
                }else{
                  for (var i = 0, iLen = h.length; i < iLen; i++) {
                
                    f = h[i].value;
                  
                    $.ajax({
                      type : 'post',
                      url : 'field.php',
                      dataType: 'json',
                      data : { provinsi:provinsi, kota:kota, desa:f },
                      cache: false,
                        success: function(data){
                          console.log(data);
                          alert('Input is Succesfully')
                  
                        }
                    })
                } 

                }
            })  
  </script>
</body>
</html>