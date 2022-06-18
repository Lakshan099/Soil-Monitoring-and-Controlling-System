<!DOCTYPE html>
<?php session_start();
if(!isset($_SESSION["username"]))
{
	header('Location:login.php');
}
	?>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ACCOUNT-DRESS WORLD</title>
<link rel="stylesheet" type="text/css" href="CSS/mapStyle.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
	


</head>
<body>
	<header><img src="Images/Soil-Systems-Logo.png" alt="" width="144" height="137" class="logo">
	<p>Soil Monitoring and Controlling System</p>
		<a href="cart.php"><p class="two">	Admin</p><br><i class="fa fa-sign-out" style="font-size:56px;color:black"></i></a>
</header>  
<div class="container1">
	<iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63371.80385598095!2d79.8211860158427!3d6.921922576100784!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae253d10f7a7003%3A0x320b2e4d32d3838d!2sColombo!5e0!3m2!1sen!2slk!4v1648717938823!5m2!1sen!2slk" data-map="JTdCJTIycG9zaXRpb25UeXBlJTIyJTNBJTIybWFwLWVtYmVkJTIyJTJDJTIyYWRkcmVzcyUyMiUzQSUyMk1hbmhhdHRhbiUyMiUyQyUyMnpvb20lMjIlM0FudWxsJTJDJTIydHlwZUlkJTIyJTNBJTIycm9hZCUyMiUyQyUyMmxhbmclMjIlM0FudWxsJTJDJTIyYXBpS2V5JTIyJTNBbnVsbCUyQyUyMm1hcmtlcnMlMjIlM0ElNUIlNUQlMkMlMjJlbWJlZCUyMiUzQSUyMmh0dHBzJTNBJTJGJTJGd3d3Lmdvb2dsZS5jb20lMkZtYXBzJTJGZW1iZWQlM0ZwYiUzRCExbTE4ITFtMTIhMW0zITFkNjMzNzEuODAzODU1OTgwOTUhMmQ3OS44MjExODYwMTU4NDI3ITNkNi45MjE5MjI1NzYxMDA3ODQhMm0zITFmMCEyZjAhM2YwITNtMiExaTEwMjQhMmk3NjghNGYxMy4xITNtMyExbTIhMXMweDNhZTI1M2QxMGY3YTcwMDMlMjUzQTB4MzIwYjJlNGQzMmQzODM4ZCEyc0NvbG9tYm8hNWUwITNtMiExc2VuITJzbGshNHYxNjQ4NzE3OTM4ODIzITVtMiExc2VuITJzbGslMjIlN0Q="></iframe>
	  <form id="form1" name="form1" method="post">
	    <br>
<br>
		  
		     <input type="text" class="text1" name="button" id="button" value="    Map View"><i class="fa fa-map-marker" style="font-size:70px;color: white"></i>
		
<a href=""><i class="fa fa-chevron-circle-left" style="font-size:100px"></i></a>
		 
	  <input  type="text" class="text2" name="search"><a href=""><i class="fa fa-search" style="font-size:56px;color:black"></i></a>
      </form>		
		 
</div>
	<table class="t1" width="450" height="350">
  <tbody>
    <tr>
      <td>
		  <table class="t2" width="350" height="150">
  <tbody>
    <tr>
      <td class="td1">Location:</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="td2">Average NPK value</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="td2">Potasium</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="td2">Posperous</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="td2">Nitrogen</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="td2"><br>Average Humidity</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="td2">Average Temperature</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td class="td2">Soil Moisturizing sensor</td>
      <td>&nbsp;</td>
    </tr>
  </tbody>
</table>

</td>
    </tr>
  </tbody>
</table>

</body>

</html>
