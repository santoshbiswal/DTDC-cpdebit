<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CP Debit</title>
<link href="../resource/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="../resource/css/cd_custom.css" rel="stylesheet" type="text/css">
<!-- <script type="text/javascript" src="./static/js/jquery-3.3.1.js"></script> -->
<script type="text/javascript" src="../resource/js/jquery-latest.min.js"></script>
<script type="text/javascript" src="../resource/js/jquery-ui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	@keyframes spinner-border {
		to { transform: rotate(360deg); }
	}
</style>

</head>
<body>
	<!----------------- Header Starts -------------------->
	<div class="header content">

		<div class="dtdclogo">
			INTRANET<br /> <span>CP DEBIT</span>
		</div>
		<div class="FRPLUS"></div>
	</div>
	<!----------------- Header Ends -------------------->
	<div class="container" style="width: 50%; margin-top: 7%;">
		<!----- Graph Section Starts ----->
		<div class="col-lg-12" style="padding: 0px !important; clear: both;">
			<div class="panel-body"
				style="background-color: #fff; border-radius: 4px; overflow: auto;">
				<form id="cpDebitForm" method="post" enctype="multipart/form-data"
					action="/CP-Debit/upload">
					<table class="table table-bordered" id="example">
						<thead style="background-color: #62a8e4;">
							<tr>
								<th colspan="2"
									style="background-color: #84194F !important; font-size: 18px;">Block
									Shipments from Generating CDS</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td
									style="border-right: none !important; border-bottom: 0px; border-top: none; text-align: right;"><b>File
										Upload</b></td>
								<td
									style="border-bottom: 0px; border-left: 0px; border-top: none;"><input
									type="file" id="file" name="file" accept=".xls,.xlsx"></td>

							</tr>
							<tr>
								<td colspan="2"
									style="text-align: center; border-top: 0px; padding-bottom: 20px;">
									<button type="button" class="btn btn-success spinner-border" style="padding: 5px 35px;" id="cpdebitsubmit" >Submit</button> '
							</tr>
						<tfoot>
							<tr>
								<td style="text-align: left; font-size: 10px; border: none;">
									File Should be in Excel format</td>
								<td style="text-align: right; font-size: 11px; border: none;">
									<a href="../resource/images/sample.xlsx">Click Here</a> to
									download the format file
								</td>
							</tr>
						</tfoot>
						</tbody>
					</table>
					<div id="text" align="center"></div>
				</form>
			</div>
		</div>

		<!----- Graph Section Ends ----->
		<form name="downloadData" id="downloadDataForm" action="/CP-Debit/download" method="post">
                <input type="hidden" name="consgList" id="consgList" />
		</form>
		
</div>
</body>
<script type="text/javascript">


		$(document).ready(function () {

            $("#cpdebitsubmit").click(function (event) {

                //stop submit the form, we will post it manually.
                event.preventDefault();

                // Get form
                var form = $('#cpDebitForm')[0];
                $("#cpdebitsubmit").html('<span style="display: inline-block;width: 2rem;height: 2rem;vertical-align: text-bottom;border: .25em solid currentColor;border-right-color: transparent;border-radius: 50%;-webkit-animation: spinner-border .75s linear infinite;animation: spinner-border .75s linear infinite;width: 1rem;height: 1rem;border-width: .2em;" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>Uploading...');
        		// Create an FormData object
                var data = new FormData(form);


        		// disabled the submit button
                $("#cpdebitsubmit").prop("disabled", true);
                $.ajax({
                    type: "POST",
                    enctype: 'multipart/form-data',
                    url: "/CP-Debit/upload",
                    data: data,
                    processData: false,
                    contentType: false,
                    cache: false,
                    timeout: 600000,
                    success: function (data) {
                        //$("#result").text(data);

                        if(data.flag){
                                alert(data.message);
                                console.log(JSON.stringify(data.data));
                                $('#consgList').val(JSON.stringify(data.data));
                                $('#downloadDataForm').attr('validated',true);
                                $('#downloadDataForm').submit();

                        } else {
                            alert(data.message);
                        }
                        console.log(data);
                        setTimeout(clearSubmit, 1000);
                    },
                    error: function (e) {
                        $("#result").text(e.responseText);
                        console.log("ERROR : ", e);
                        setTimeout(clearSubmit, 1000);

                    }
                });

            });

        });


        function clearSubmit() {
                $("#cpdebitsubmit").prop("disabled", false);
                $("#file").replaceWith($("#file").val('').clone(true));
                $("#cpdebitsubmit").html("Submit");
        }


		/* function checkfile() {
			
			var validExts = new Array(".xlsx", ".xls");
			var fileExt = $('#file').val();
			fileExt = fileExt.substring(fileExt.lastIndexOf('.'));
			if (validExts.indexOf(fileExt) < 0) {
				alert("Invalid file selected, valid files are of " + validExts.toString() + " types.");
				return false;
			}
			else return true;
		}
		 */
</script>
</html>