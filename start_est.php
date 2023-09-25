<!DOCTYPE html>
<html lang="en">
<?php
// $DB_HOST = "webhosting2029.is.cc";
$DB_HOST = "localhost";
$DB_NAME = "myprivac_pod";
// $DB_USER = "myprivac_pod";
$DB_USER = "root";
// $DB_PASS = "mra98&HRB)**";
$DB_PASS = "";
// CONNECT TO THE DATABASE
$mysqli = new mysqli($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);

if (mysqli_connect_errno()) {
	printf("Connect failed: %s\n", mysqli_connect_error());
	exit();
}

if (isset($_GET['user_id'])) {
	$company_id = base64_decode(urldecode($_GET['company_id']));
	$user_id = base64_decode(urldecode($_GET['user_id']));
}

if (isset($_POST['user_id'])) {
	$company_id = base64_decode(urldecode($_POST['company_id']));
	$user_id = base64_decode(urldecode($_POST['user_id']));
}

// if($company_id==15){
// header("Location: https://quote.podflorida.com/index.php?user_id=Mjc%3D&company_id=OQ%3D%3D");
// }
// elseif($company_id==16) {
// header("Location: https://quote.podflorida.com/index.php?user_id=Mjc%3D&company_id=OQ%3D%3D");
// }
// get the record from the database
							if($stmt = $mysqli->prepare("SELECT solid_ppf, texture_ppf, textureplus_ppf, stripes_ppf, val_solid_ppf, val_texture_ppf, val_textureplus_ppf, val_stripe_ppf, lights_ppf, special FROM pricing WHERE company_id =?"))
							{
							 $stmt->bind_param("i", $company_id);
							 $stmt->execute();

						     $stmt->bind_result($solid_ppf, $texture_ppf, $textureplus_ppf, $stripes_ppf, $val_solid_ppf, $val_texture_ppf, $val_textureplus_ppf, $val_stripe_ppf, $lights_ppf, $special);
						     $stmt->fetch();
					         $stmt->close();
							}

				            // show an error if the query has an error
				            else
				            {
					         echo "Error: could not prepare SQL statement";
				            }

// get the record from the database
							if($stmt = $mysqli->prepare("SELECT distributor_companies.name, distributor_companies.logo_file_path FROM distributor_companies WHERE company_id =?"))
							{
							 $stmt->bind_param("i", $company_id);
							 $stmt->execute();

						     $stmt->bind_result($name, $logo_file_path);
						     $stmt->fetch();
					         $stmt->close();
							}

				            // show an error if the query has an error
				            else
				            {
					         echo "Error: could not prepare SQL statement";
				            }

// get the record from the database
							if($stmt = $mysqli->prepare("SELECT user_phone FROM users WHERE user_id =?"))
							{
							 $stmt->bind_param("i", $user_id);
							 $stmt->execute();

						     $stmt->bind_result($companyPhone);
						     $stmt->fetch();
					        $stmt->close();
							}

				            // show an error if the query has an error
				            else
				            {
					         echo "Error: could not prepare SQL statement";
				            }				            

?>

<head>
	<title><?php echo $name; ?> | Project Information Form</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/noui/nouislider.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<!--===============================================================================================-->


	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/css/bootstrap.min.css" integrity="sha512-b2QcS5SsA8tZodcDtGRELiGv5SaKSk1vDHDaQRda0htPYWZ6046lr3kJ5bAAQdpV2mmA/4v0wQF9MyU6/pDIAg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
	<div class="container-contact100">
		<div class="wrap-contact100">
			<div class="row align-items-center">
				<div class="col-6">
					<span class="contact100-form-title">
						<img src="https://podflorida.com/console/<?php echo $logo_file_path; ?>" width="25%" height="25%" alt="">
						<?php echo $name; 
						?>
					</span>
					<h3>Instant Online Estimate</h3>
					<div style="color:red;">
						<center>
							<h5 class="text-start"><?php echo $special; ?></h5>
						</center><br>
					</div>
					<p style="font-size: 1.5em">This estimate includes: Track System, Curtains, Valance, and Installation. We offer various options which can change your final price.
						Measure the length (side to side) or perimeter of the area where you need curtains then complete this form.</p>
				</div>
				<div class="col-6">
					<form class="contact100-form validate-form" action="online_est.php" method="POST">
						<input type="hidden" name="company_id" value="<?php echo $company_id; ?>" />
						<input type="hidden" name="company" value="<?php echo $name; ?>" />
						<input type="hidden" name="company_phone" value="<?php echo $companyPhone; ?>" />
						<input type="hidden" name="user_id" value="<?php echo $user_id; ?>" />
						<input type="hidden" name="logo_file_path" value="<?php echo $logo_file_path; ?>" />
						<input type="hidden" name="solid_ppf" value="<?php echo $solid_ppf; ?>" />
						<input type="hidden" name="val_solid_ppf" value="<?php echo $val_solid_ppf; ?>" />
						<input type="hidden" name="texture_ppf" value="<?php echo $texture_ppf; ?>" />
						<input type="hidden" name="val_texture_ppf" value="<?php echo $val_texture_ppf; ?>" />
						<input type="hidden" name="textureplus_ppf" value="<?php echo $textureplus_ppf; ?>" />
						<input type="hidden" name="val_textureplus_ppf" value="<?php echo $val_textureplus_ppf; ?>" />
						<input type="hidden" name="stripe_ppf" value="<?php echo $stripes_ppf; ?>" />
						<input type="hidden" name="val_stripe_ppf" value="<?php echo $val_stripe_ppf; ?>" />
						<input type="hidden" name="lights_ppf" value="<?php echo $lights_ppf; ?>" />

						<div class="wrap-input100 validate-input bg1 rs1-wrap-input100" data-validate="Enter width of area needing curtains">
							<span class="label-input100" style="font-size: 30px; font-weight: bold;">Total width <span style="color: red;font-weight: bold;">(in feet)</span> of all areas where you need curtains?</span>


							<div class="form-floating my-4">
								<input type="number" class="form-control input100" name="curtain_length" id="floatingInput" placeholder="name@example.com">
								<label for="floatingInput">Feet</label>
							</div>

							<button class="contact100-form-btn">
								<span>
									SUBMIT
									<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
								</span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.2/js/bootstrap.bundle.min.js" integrity="sha512-X/YkDZyjTf4wyc2Vy16YGCPHwAY8rZJY+POgokZjQB2mhIRFJCckEGc6YyX9eNsPfn0PzThEuNs+uaomE5CO6A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});


			$(".js-select2").each(function() {
				$(this).on('select2:close', function(e) {
					if ($(this).val() == "Please chooses") {
						$('.js-show-service').slideUp();
					} else {
						$('.js-show-service').slideUp();
						$('.js-show-service').slideDown();
					}
				});
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->

	<script src="js/main.js"></script>

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
		window.dataLayer = window.dataLayer || [];

		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-23581568-13');
	</script>

</body>

</html>